package com.yl.online.controller;

import com.yl.online.entity.Group;
import com.yl.online.entity.User;
import com.yl.online.service.LoginService;
import com.yl.online.util.Common;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

/**
 * @author yelei
 * @date 2019/4/3
 */
@Controller
@RequestMapping("/")
public class LoginController {
    @Autowired
    private LoginService loginService;
    @RequestMapping("/loginPage")
    public String loginPage(){
        return "signIn";
    }
    @RequestMapping("/login")
    public String login(@RequestParam("usernumber")String usernumber, @RequestParam("userpass")String userpass,
                         Model model,HttpServletResponse response, HttpServletRequest request){
        User user=loginService.login(usernumber,userpass);
        if (user==null){
            model.addAttribute("message","用户不存在或者密码错误");
            return "singIn";
        }else {
            Cookie cookie=new Cookie("userName",usernumber);
            cookie.setPath("/");
            cookie.setMaxAge(30*24*60*60*1000);
            response.addCookie(cookie);
            request.getSession().setAttribute("user",user);
           // return "redirect:/toIndex?auth="+user.getAuth();
            return "index";

        }
    }
    @RequestMapping(value = "/toIndex/{auth}",method = RequestMethod.GET)
    public ModelAndView index(@RequestParam("auth")Integer auth, ModelAndView model,HttpServletRequest request){
        Cookie[] cookie=request.getCookies();
        model.addObject("username",cookie[0].getValue());
        User user= (User) request.getSession().getAttribute("user");
        if(auth.equals(Common.SUPERADMIN_AUTH)){
            List<User> userList;
            //超级管理员，查询管理员，返回index
            userList=loginService.getUserList(auth);
            model.addObject("user",userList);
            model.setViewName("index");
        }else if (auth.equals(Common.ADMIN_AUTH)){
            //管理员，返回小组
            List<Group> groups=loginService.getGroupList(user.getId());

            model.setViewName("index1");

        }
        return model;
    }

}
