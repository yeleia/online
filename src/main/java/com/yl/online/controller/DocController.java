package com.yl.online.controller;

import com.sun.org.apache.xpath.internal.operations.Mod;
import com.yl.online.entity.Doc;
import com.yl.online.entity.Group;
import com.yl.online.entity.User;
import com.yl.online.entity.VO.GroupDocVo;
import com.yl.online.service.DocService;
import com.yl.online.util.Common;
import org.apache.poi.POIXMLDocument;
import org.apache.poi.POIXMLTextExtractor;
import org.apache.poi.hwpf.extractor.WordExtractor;
import org.apache.poi.openxml4j.opc.OPCPackage;
import org.apache.poi.xwpf.extractor.XWPFWordExtractor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.ClassUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @author yelei
 * @date 2019/5/8
 */
@RestController
@RequestMapping("/")
public class DocController {
    @Autowired
    private DocService docService;
    @RequestMapping("/getAllDoc")
    public ModelAndView getAllDocByUserId(@RequestParam("id")Integer id,ModelAndView modelAndView){
        if (id==null){
            modelAndView.setViewName("signIn");
        }else {
            //auth=0,1查询团队文档和个人文档,auth=2,查询个人文档
            User user=docService.getUserById(id);
            if (user.getAuth().equals(Common.SUPERADMIN_AUTH)||user.getAuth().equals(Common.ADMIN_AUTH)){
                List<Group> group=docService.getGroupId(id);
                List<GroupDocVo> docs=new ArrayList<>();
                for (int i = 0; i <group.size() ; i++) {
                    List<Integer> docId= docService.getDocId(group.get(i).getId());
                    for (int j = 0; j <docId.size() ; j++) {
                        Doc doc = docService.getDocById(docId.get(j));
                        GroupDocVo groupDocVo = new GroupDocVo();
                        if (doc != null) {
                            groupDocVo.setDocId(doc.getId());
                            groupDocVo.setDocName(doc.getDocname());
                            groupDocVo.setGroupName(group.get(i).getGroupname());
                            docs.add(groupDocVo);
                        }
                    }
                }
                modelAndView.addObject("groupDoc",docs);
                modelAndView.setViewName("doc");
            }else {
                modelAndView.setViewName("docOne");
            }
            //加入的团队文档
            List<Integer> groupId=docService.getGroupIdByUserId(id);
            List<GroupDocVo> docs=new ArrayList<>();
            for (int i = 0; i <groupId.size() ; i++) {
                Group group=docService.getGroupById(groupId.get(i));
                List<Integer> docId= docService.getDocId(groupId.get(i));
                for (int j = 0; j <docId.size() ; j++) {
                    Doc doc=docService.getDocById(docId.get(j));
                    GroupDocVo groupDocVo=new GroupDocVo();
                    groupDocVo.setGroupName(group.getGroupname());
                    groupDocVo.setDocName(doc.getDocname());
                    groupDocVo.setDocId(doc.getId());
                    docs.add(groupDocVo);
                }
            }
            modelAndView.addObject("groupUserDoc",docs);
            //个人文档
            List<Integer> docIds=docService.getDocIdByUserId(id);
            List<Doc> docList=new ArrayList<>();
            for (int i = 0; i < docIds.size(); i++) {
                docList.add(docService.getDocById(docIds.get(i)));
            }
            modelAndView.addObject("group",docService.getGroupId(id));
            modelAndView.addObject("userDoc",docList);
            modelAndView.addObject("user",user);
        }
        return modelAndView;
    }
    @RequestMapping("/addGroupDoc")
    public ModelAndView addGroupDoc(ModelAndView modelAndView, @RequestParam("id")Integer id,@RequestParam("groupId")Integer groupId,
                                    @RequestParam("file") MultipartFile file,
                                    HttpServletRequest request, HttpServletResponse response)throws Exception{
            if (id==null){
                modelAndView.setViewName("signIn");
            }else {
               /* String path = request.getSession().getServletContext().getRealPath("/static/doc");*/
                String path = ClassUtils.getDefaultClassLoader().getResource("").getPath();
                String fileName = file.getOriginalFilename();
                File targetFile = new File(path+"static/doc", fileName);
                file.transferTo(targetFile);
                Doc doc=new Doc();
                doc.setDocname(fileName);
                doc.setWritedate(new Date());
                doc.setIswrite(0);
                doc.setPdfurl(path+"static/doc/"+fileName);
                doc.setContent(readWord(path+"static/doc/"+fileName));
                docService.addGroupDoc(doc,id,groupId);
                modelAndView.addObject("doc",doc);
                modelAndView.setViewName("docEditor");
            }
            return modelAndView;
    }
    @RequestMapping("/addUserDoc")
    public ModelAndView addUserDoc(ModelAndView modelAndView, @RequestParam("id")Integer id,
                                    @RequestParam("file") MultipartFile file,
                                    HttpServletRequest request, HttpServletResponse response)throws Exception{
        if (id==null){
            modelAndView.setViewName("signIn");
        }else {
            /* String path = request.getSession().getServletContext().getRealPath("/static/doc");*/
            String path = ClassUtils.getDefaultClassLoader().getResource("").getPath();
            String fileName = file.getOriginalFilename();
            File targetFile = new File(path+"static/doc", fileName);
            file.transferTo(targetFile);
            Doc doc=new Doc();
            doc.setDocname(fileName);
            doc.setWritedate(new Date());
            doc.setIswrite(0);
            doc.setPdfurl(path+"static/doc/"+fileName);
            doc.setContent(readWord(path+"static/doc/"+fileName));
            docService.addUserDoc(doc,id);
            modelAndView.addObject("doc",doc);
            modelAndView.setViewName("docEditor1");
        }
        return modelAndView;
    }
    public static String readWord(String path) {
        String buffer = "";
        try {
            if (path.endsWith(".doc")) {
                InputStream is = new FileInputStream(new File(path));
                WordExtractor ex = new WordExtractor(is);
                buffer = ex.getText();
                ex.close();
            } else if (path.endsWith("docx")) {
                OPCPackage opcPackage = POIXMLDocument.openPackage(path);
                POIXMLTextExtractor extractor = new XWPFWordExtractor(opcPackage);
                buffer = extractor.getText();
                extractor.close();
            } else {
                System.out.println("此文件不是word文件！");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return buffer;
    }
    @RequestMapping("/toEditor")
    public ModelAndView toEditor(ModelAndView modelAndView,@RequestParam("id")Integer id,@RequestParam("userId")Integer userId){
        User user=docService.getUserById(userId);
        Doc doc=docService.getDocById(id);
        modelAndView.addObject("doc",doc);
        modelAndView.addObject("user",user);
        modelAndView.setViewName("docEditor");
        return modelAndView;
    }

}
