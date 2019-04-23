package com.yl.online.service;

import com.yl.online.entity.User;

import java.util.Map;

/**
 * @author yelei
 * @date 2019/4/2
 */
public interface AdminService {
    Map<String, Object> addAdmin(User user);
}
