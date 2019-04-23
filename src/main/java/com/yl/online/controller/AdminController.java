package com.yl.online.controller;

import com.yl.online.entity.User;
import com.yl.online.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

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
    public Map<String,Object> addAdmin(User user){
        return adminService.addAdmin(user);
    }


}
