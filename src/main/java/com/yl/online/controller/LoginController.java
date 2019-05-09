package com.yl.online.controller;

import com.yl.online.entity.Group;
import com.yl.online.entity.GroupUser;
import com.yl.online.entity.User;
import com.yl.online.entity.VO.GroupVO;
import com.yl.online.service.AdminService;
import com.yl.online.service.LoginService;
import com.yl.online.util.Common;
import org.apache.catalina.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 * @author yelei
 * @date 2019/4/3
 */
@Controller
@RequestMapping("/")
public class LoginController {
    @Autowired
    private LoginService loginService;
    @Autowired
    private AdminService adminService;
    @RequestMapping("/loginPage")
    public String loginPage(){
        return "signIn";
    }
    @RequestMapping("/login")
    public String login(@RequestParam("usernumber")String usernumber, @RequestParam("userpass")String userpass,
                         Model model,HttpServletResponse response, HttpServletRequest request){
        System.out.println("login");
        User user=loginService.login(usernumber,userpass);
        if (user==null){
            model.addAttribute("message","用户不存在或者密码错误");
            return "singIn";
        }else {
            Cookie cookie=new Cookie("userName",usernumber);
            cookie.setPath("/");
            cookie.setMaxAge(30*24*60*60*1000);
            response.addCookie(cookie);
            HttpSession session=request.getSession();
            session.setAttribute("user",user);
            session.setMaxInactiveInterval(30*60);
            return "redirect:/toIndex?auth="+user.getAuth();
        }
    }
    @RequestMapping(value = "/toIndex")
    public ModelAndView index(@RequestParam("auth")Integer auth, ModelAndView model,HttpServletRequest request){
        Cookie[] cookie=request.getCookies();
        model.addObject("username",cookie[0].getValue());
        User user= (User) request.getSession().getAttribute("user");
        if(auth.equals(Common.SUPERADMIN_AUTH)){
            List<User> userList;
            //超级管理员，查询管理员，返回index
            userList=loginService.getUserList(Common.ADMIN_AUTH);
            model.addObject("users",userList);
            model.setViewName("index");
        }else if (auth.equals(Common.ADMIN_AUTH)){
            //管理员，返回管理小组和加入小组
            List<Group> groups=adminService.getGroupByCreator(user.getId());
            model.addObject("group",groups);
            model.setViewName("index11");
        }else {
            //普通用户，个人信息
            model.setViewName("own");
        }
        model.addObject("user",user);
        return model;
    }

}
