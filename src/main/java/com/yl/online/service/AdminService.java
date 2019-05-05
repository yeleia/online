package com.yl.online.service;

import com.yl.online.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.Map;

/**
 * @author yelei
 * @date 2019/4/2
 */
public interface AdminService {
    Map<String, Object> addAdmin(User user);

    Map<String,Object> updateAdmin(User user);

    Map<String,Object> deleteAdmin(Integer id);

    Map<String,Object> addGroup(String groupname, Integer creator);

    Map<String,Object> updateGroupName(Integer id, String groupname);

    Map<String,Object> deleteGroupById(Integer id);

    Map<String,Object> addGroupUser(Integer groupid, String userid);

    Map<String,Object> deleteGroupUser(Integer id);
}
