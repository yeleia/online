package com.yl.online.service;

import com.yl.online.dao.GroupMapper;
import com.yl.online.dao.GroupUserMapper;
import com.yl.online.dao.UserMapper;
import com.yl.online.entity.Group;
import com.yl.online.entity.GroupUser;
import com.yl.online.entity.User;
import com.yl.online.entity.VO.GroupVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
/**
 * @author yelei
 * @date 2019/4/3
 */
@Service("loginService")
public class LoginService {
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private GroupMapper groupMapper;
    @Autowired
    private GroupUserMapper groupUserMapper;
    public User login(String usernumber, String userpass) {
          User user=userMapper.getByNP(usernumber,userpass);
          return user;
    }


    public List<User> getUserList(Integer auth) {
        return userMapper.getUserList(auth);
    }

    public List<Group> getGroupList(Integer id) {
        return groupMapper.getByCreator(id);
    }

    public List<GroupUser> getGroupUser(Integer id) {
        return groupUserMapper.getByGroupId(id);
    }


    public User getUserById(Integer userid) {
        return userMapper.selectByPrimaryKey(userid);
    }

    public List<GroupUser> getUserGroup(Integer id) {
        return groupUserMapper.getByUserId(id);
    }

    public Group getGroupById(Integer groupid) {
        return groupMapper.getById(groupid);
    }
}
