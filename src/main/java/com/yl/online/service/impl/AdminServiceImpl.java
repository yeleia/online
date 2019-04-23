package com.yl.online.service.impl;

import com.yl.online.dao.UserMapper;
import com.yl.online.entity.User;
import com.yl.online.service.AdminService;
import com.yl.online.util.RetrunUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Map;

/**
 * @author yelei
 * @date 2019/4/2
 */
@Service("adminService")
public class AdminServiceImpl implements AdminService {
    @Autowired
    private UserMapper userMapper;
    @Override
    public Map<String, Object> addAdmin(User user) {
        if (userMapper.isExsitUser(user.getUsernumber())>0){
            return RetrunUtil.ret(false,"该管理员已经存在");
        }else {
            userMapper.insertSelective(user);
            return RetrunUtil.ret(true,"添加成功");
        }
    }

}
