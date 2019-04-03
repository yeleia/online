package com.yl.online.controller;

import com.yl.online.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * @author yelei
 * @date 2019/4/3
 */
@RestController
@RequestMapping("/")
public class LoginController {
    @Autowired
    private LoginService loginService;
    @RequestMapping("/login")
    public String login(@RequestParam("usernumber")String usernumber, @RequestParam("userpass")String userpass,
                        HttpServletRequest request){
        //HttpSession session=request.getSession();
        //session.setAttribute("token",session.getId());
        return loginService.login(usernumber,userpass,request);

    }
}
