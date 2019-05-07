package com.yl.online.controller;

import com.yl.online.entity.Group;
import com.yl.online.entity.GroupUser;
import com.yl.online.entity.User;
import com.yl.online.entity.VO.GroupV;
import com.yl.online.entity.VO.GroupVO;
import com.yl.online.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * @author yelei
 * @date 2019/4/2
 */
@RestController
@RequestMapping("/")
public class AdminController {
    @Autowired
    private AdminService adminService;

    //该权限只对超级管理员
    @RequestMapping("/addAdmin")
    public Map<String, Object> addAdmin(User user) {
        return adminService.addAdmin(user);
    }

    //该权限对所有角色有用
    @RequestMapping("/updateAdmin")
    public List<User> updateAdmin(User user) {

        return adminService.updateAdmin(user);
    }

    @RequestMapping("/deleteAdmin")
    public List<User> deleteAdmin(@RequestParam("id") Integer id) {
        return adminService.deleteAdmin(id);
    }

    //新建小组
    @RequestMapping("/addGroup")
    public Map<String, Object> addGroup(@RequestParam("groupname") String groupname, @RequestParam("creator") Integer creator) {
        return adminService.addGroup(groupname, creator);
    }

    //修改小组名
    @RequestMapping("/updateGroupName")
    public Map<String, Object> updateGroupName(@RequestParam("id") Integer id, @RequestParam("groupname") String groupname) {
        return adminService.updateGroupName(id, groupname);
    }

    //删除小组。。。。。级联删除
    @RequestMapping("/deleteGroup")
    public Map<String, Object> deleteGroupById(@RequestParam("id") Integer id) {
        return adminService.deleteGroupById(id);
    }

    @RequestMapping("/getGroupByUserId")
    public ModelAndView getGroupByUserId(@RequestParam("id") Integer id, ModelAndView modelAndView, HttpServletRequest request) {
        //List<GroupV> groupVS = adminService.getGroupV(id);
        List<Group> groups=adminService.getGroupByCreator(id);
        User user = (User) request.getSession().getAttribute("user");
        modelAndView.addObject("user", user);
        modelAndView.addObject("group",groups);
        modelAndView.setViewName("group");
        return modelAndView;
    }

    //添加小组成员,userid为jsonArrary
    @RequestMapping("/addGroupUser")
    public List<User> addGroupUser(@RequestParam("groupname")String groupname, @RequestParam("groupid") Integer groupid, @RequestParam("userid") Integer[] userid) {
        return adminService.addGroupUser(groupname,groupid, userid);
    }

    //删除小组成员，单个删除
    @RequestMapping("/deleteGroupUser")
    public Map<String, Object> deleteGroupUser(@RequestParam("id") Integer id) {
        return adminService.deleteGroupUser(id);
    }

    @RequestMapping("/toAddGroup")
    public ModelAndView toAddGroup(@RequestParam("id") Integer id, HttpServletRequest request, ModelAndView modelAndView) {
        if (id == null) {
            modelAndView.setViewName("signIn");
        } else {
            User user = (User) request.getSession().getAttribute("user");
            List<User> userList = adminService.getAllUser();
            List<User> userVo=new ArrayList<>();
            Group group=adminService.getGroupById(id);
            List<GroupUser> groupUsers=adminService.getGroupUser(id);
            for (int i = 0; i < groupUsers.size(); i++) {
                userVo.add(adminService.getUserById(groupUsers.get(i).getUserid()));
            }
            modelAndView.addObject("userVo",userVo);
            modelAndView.addObject("group",group);
            modelAndView.addObject("allUser", userList);
            modelAndView.addObject("user", user);
            modelAndView.setViewName("groupAdd");

        }
        return modelAndView;
        /* @RequestMapping("/")*/
    }
    @RequestMapping("/getAdminList")
    public ModelAndView getAdminList(ModelAndView modelAndView,HttpServletRequest request){
        User user = (User) request.getSession().getAttribute("user");
        modelAndView.addObject("user", user);
        modelAndView.addObject("users",adminService.getAllAdmin());
        modelAndView.setViewName("index");
        return modelAndView;
    }
    @RequestMapping("/getUser")
    public ModelAndView getUser(ModelAndView modelAndView,HttpServletRequest request){
        User user = (User) request.getSession().getAttribute("user");
        modelAndView.addObject("user", user);
        modelAndView.addObject("users",adminService.getUser());
        modelAndView.setViewName("user");
        return modelAndView;
    }
    @RequestMapping("/addUser")
    public Map<String, Object> addUser(User user) {
        return adminService.addUser(user);
    }
    @RequestMapping("/updateUser")
    public List<User> updateUser(User user) {
        return adminService.updateUser(user);
    }
    @RequestMapping("/deleteUser")
    public List<User> deleteUser(@RequestParam("id") Integer id) {
        return adminService.deleteAdmin(id);
    }
    //获取个人信息
    @RequestMapping("/getOwnMessage")
    public ModelAndView getOwnMessage(ModelAndView modelAndView,@RequestParam("id")Integer id){
        if (id!=null){
            User user=adminService.getOwn(id);
            modelAndView.addObject("user",user);
            modelAndView.setViewName("own");
        }else {
            modelAndView.setViewName("signIn");
        }
        return modelAndView;

    }
    @RequestMapping("/saveOwn")
    public Map<String,Object> saveOwn(User user){
        return adminService.saveOwn(user);
    }






}
