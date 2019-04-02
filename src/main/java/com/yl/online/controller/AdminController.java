package com.yl.online.controller;

import com.yl.online.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author yelei
 * @date 2019/4/2
 */
@RestController
public class AdminController {
    @Autowired
    private AdminService adminService;
}
