package com.yl.online.service.impl;

import com.yl.online.dao.GroupMapper;
import com.yl.online.dao.GroupUserMapper;
import com.yl.online.dao.UserMapper;
import com.yl.online.entity.Group;
import com.yl.online.entity.GroupUser;
import com.yl.online.entity.User;
import com.yl.online.entity.VO.GroupV;
import com.yl.online.entity.VO.GroupVO;
import com.yl.online.service.AdminService;
import com.yl.online.util.Common;
import com.yl.online.util.RetrunUtil;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import sun.management.snmp.jvminstr.JvmOSImpl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * @author yelei
 * @date 2019/4/2
 */
@Service("adminService")
public class AdminServiceImpl implements AdminService {
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private GroupMapper groupMapper;
    @Autowired
    private GroupUserMapper groupUserMapper;
    @Override
    public Map<String, Object> addAdmin(User user) {
        if (userMapper.isExsitUser(user.getUsernumber())>0){
            return RetrunUtil.ret(false,"该管理员已经存在");
        }else {
            user.setAuth(Common.ADMIN_AUTH);
            userMapper.insertSelective(user);
            return RetrunUtil.ret(true,"添加成功");
        }
    }

    @Override
    public List<User> updateAdmin(User user) {
        Integer i=userMapper.updateByPrimaryKeySelective(user);
        if (i>0){
            return userMapper.getUserList(Common.ADMIN_AUTH);
        }else {
            return null;
        }

    }

    @Override
    public List<User> deleteAdmin(Integer id) {
        Integer i=userMapper.deleteByPrimaryKey(id);
        if (i>0){
            return userMapper.getUserList(Common.USER_AUTH);
        }else {
            return null;
        }
    }

    @Override
    public Map<String, Object> addGroup(String groupname, Integer creator) {
        Group group=new Group();
        group.setGroupname(groupname);
        group.setCreattime(new Date());
        group.setCreator(creator);
        groupMapper.insertSelective(group);
        return RetrunUtil.ret(true,"新建成功");
    }

    @Override
    public Map<String, Object> updateGroupName(Integer id, String groupname) {
        Integer i=groupMapper.updateGroupNameById(id,groupname);
        if (i>0){
            return RetrunUtil.ret(true,"修改成功");
        }else {
            return RetrunUtil.ret(false,"修改失败");
        }

    }

    @Override
    public Map<String, Object> deleteGroupById(Integer id) {
        Integer i=groupMapper.deleteByPrimaryKey(id);
        //同时删除groupUser
        groupUserMapper.deleteByGroupId(id);
        if (i>0){
            return RetrunUtil.ret(true,"删除成功");
        }else{
            return RetrunUtil.ret(false,"删除失败");
        }
    }

    @Override
    public List<User> addGroupUser(String groupname,Integer groupid, Integer[] userid) {
        if (groupname!=null){
            groupMapper.updateGroupNameById(groupid,groupname);
        }
        List<GroupUser> groupUsers=new ArrayList<>();
        /*JSONArray jsonArray=JSONArray.fromObject(userid);

        for (int i = 0; i <jsonArray.size() ; i++) {
            JSONObject json=JSONObject.fromObject(jsonArray.getString(i));
            GroupUser groupUser=new GroupUser();
            groupUser.setGroupid(groupid);
            groupUser.setUserid(json.getInt(userid));
            groupUsers.add(groupUser);
        }*/
        for (int i = 0; i <userid.length; i++) {
            GroupUser groupUser=new GroupUser();
            groupUser.setGroupid(groupid);
            groupUser.setUserid(userid[i]);
            groupUsers.add(groupUser);
        }
        //添加到数据库，并判断该小组成员是否已经添加
        for (GroupUser groupUser : groupUsers) {
            //判断小组成员是否存在
            if (groupUserMapper.getByGroupIdUserId(groupUser.getGroupid(),groupUser.getUserid())<1){
                groupUserMapper.insertSelective(groupUser);
            }
        }
        List<User> userList=new ArrayList<>();
        for (int i = 0; i <userid.length ; i++) {
            userList.add(userMapper.selectByPrimaryKey(userid[i]));
        }
        return userList;
    }

    @Override
    public Map<String, Object> deleteGroupUser(Integer id) {
        Integer i=groupUserMapper.deleteGroupUser(id);
        return null;
    }

    @Override
    public List<GroupV> getGroupV(Integer id) {
        List<Group> groups=groupMapper.getByCreator(id);
        List<GroupV> groupVOS=new ArrayList<>();
        for (int i = 0; i <groups.size() ; i++) {
            GroupV groupVO=new GroupV();
            groupVO.setGroupname(groups.get(i).getGroupname());
            groupVO.setGroupid(groups.get(i).getId());
            List<GroupUser> groupUsers=groupUserMapper.getByGroupId(groups.get(i).getId());
            StringBuilder name=null;
            for (int j = 0; j < groupUsers.size(); j++) {
                User user=userMapper.selectByPrimaryKey(groupUsers.get(j).getUserid());
                name.append(user.getUsername());
                name.append(",");
            }
        }
        return groupVOS;
    }

    @Override
    public List<User> getAllUser() {
        return userMapper.getAllUser();
    }

    @Override
    public List<Group> getGroupByCreator(Integer id) {
        return groupMapper.getByCreator(id);
    }

    @Override
    public Group getGroupById(Integer id) {
        return groupMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<GroupUser> getGroupUser(Integer id) {
        return groupUserMapper.getByGroupId(id);
    }

    @Override
    public User getUserById(Integer userid) {
        return userMapper.selectByPrimaryKey(userid);
    }

    @Override
    public List<User> getAllAdmin() {
        return userMapper.getUserList(Common.ADMIN_AUTH);
    }

    @Override
    public List<User> getUser() {
        return userMapper.getUserList(Common.USER_AUTH);
    }

    @Override
    public Map<String, Object> addUser(User user) {
        if (userMapper.isExsitUser(user.getUsernumber())>0){
            return RetrunUtil.ret(false,"该管理员已经存在");
        }else {
            user.setAuth(Common.USER_AUTH);
            userMapper.insertSelective(user);
            return RetrunUtil.ret(true,"添加成功");
        }
    }

    @Override
    public List<User> updateUser(User user) {
        Integer i=userMapper.updateByPrimaryKeySelective(user);
        if (i>0){
            return userMapper.getUserList(Common.USER_AUTH);
        }else {
            return null;
        }
    }

    @Override
    public User getOwn(Integer id) {
        return userMapper.selectByPrimaryKey(id);
    }

    @Override
    public Map<String, Object> saveOwn(User user) {

        if (userMapper.updateByPrimaryKeySelective(user)>0){
            return RetrunUtil.ret(true,"修改成功");
        }else {
            return RetrunUtil.ret(false,"修改失败");
        }

    }


}
