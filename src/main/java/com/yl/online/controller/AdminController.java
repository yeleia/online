package com.yl.online.controller;

import com.yl.online.entity.Group;
import com.yl.online.entity.User;
import com.yl.online.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.Date;
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
    //该权限对所有角色有用
    @RequestMapping("/updateAdmin")
    public Map<String,Object> updateAdmin(User user){
        return adminService.updateAdmin(user);
    }
    @RequestMapping("/deleteAdmin/{id}")
    public Map<String,Object> deleteAdmin(@RequestParam("id")Integer id){
        return adminService.deleteAdmin(id);
    }
    //新建小组
    @RequestMapping("/addGroup")
    public Map<String,Object> addGroup(@RequestParam("groupname")String groupname,@RequestParam("creator")Integer creator){
        return adminService.addGroup(groupname,creator);
    }
    //修改小组名
    @RequestMapping("/updateGroupName")
    public Map<String,Object> updateGroupName(@RequestParam("id")Integer id,@RequestParam("groupname")String groupname){
        return adminService.updateGroupName(id,groupname);
    }
    //删除小组。。。。。级联删除
    @RequestMapping("/deleteGroup")
    public Map<String,Object> deleteGroupById(@RequestParam("id")Integer id){
        return adminService.deleteGroupById(id);
    }
    //添加小组成员,userid为jsonArrary
    @RequestMapping("/addGroupUser")
    public Map<String,Object> addGroupUser(@RequestParam("groupid")Integer groupid,@RequestParam("userid")String userid){
        return adminService.addGroupUser(groupid,userid);
    }
    //删除小组成员，单个删除
    @RequestMapping("/deleteGroupUser")
    public Map<String,Object> deleteGroupUser(@RequestParam("id")Integer id){
        return adminService.deleteGroupUser(id);
    }





}
