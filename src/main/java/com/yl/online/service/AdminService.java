package com.yl.online.service;

import com.yl.online.entity.Group;
import com.yl.online.entity.GroupUser;
import com.yl.online.entity.User;
import com.yl.online.entity.VO.GroupV;
import com.yl.online.entity.VO.GroupVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * @author yelei
 * @date 2019/4/2
 */
public interface AdminService {
    Map<String, Object> addAdmin(User user);

    List<User> updateAdmin(User user);

    List<User> deleteAdmin(Integer id);

    Map<String,Object> addGroup(String groupname, Integer creator);

    Map<String,Object> updateGroupName(Integer id, String groupname);

    Map<String,Object> deleteGroupById(Integer id);

    List<User> addGroupUser(String groupname,Integer groupid, Integer[] userid);

    Map<String,Object> deleteGroupUser(Integer id);

    List<GroupV> getGroupV(Integer id);

    List<User> getAllUser();

    List<Group> getGroupByCreator(Integer id);

    Group getGroupById(Integer id);

    List<GroupUser> getGroupUser(Integer id);

    User getUserById(Integer userid);

    List<User> getAllAdmin();

    List<User> getUser();

    Map<String,Object> addUser(User user);

    List<User> updateUser(User user);

    User getOwn(Integer id);

    Map<String,Object> saveOwn(User user);
}
