package com.yl.online.service.impl;

import com.yl.online.dao.GroupMapper;
import com.yl.online.dao.GroupUserMapper;
import com.yl.online.dao.UserMapper;
import com.yl.online.entity.Group;
import com.yl.online.entity.GroupUser;
import com.yl.online.entity.User;
import com.yl.online.service.AdminService;
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
            userMapper.insertSelective(user);
            return RetrunUtil.ret(true,"添加成功");
        }
    }

    @Override
    public Map<String, Object> updateAdmin(User user) {
        Integer i=userMapper.updateByPrimaryKeySelective(user);
        if (i>0){
            return RetrunUtil.ret(true,"更新成功");
        }else {
            return RetrunUtil.ret(false,"更新失败");
        }

    }

    @Override
    public Map<String, Object> deleteAdmin(Integer id) {
        Integer i=userMapper.deleteByPrimaryKey(id);
        if (i>0){
            return RetrunUtil.ret(true,"删除成功");
        }else {
            return RetrunUtil.ret(false,"删除失败");
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
    public Map<String, Object> addGroupUser(Integer groupid, String userid) {
        JSONArray jsonArray=JSONArray.fromObject(userid);
        List<GroupUser> groupUsers=new ArrayList<>();
        for (int i = 0; i <jsonArray.size() ; i++) {
            JSONObject json=JSONObject.fromObject(jsonArray.getString(i));
            GroupUser groupUser=new GroupUser();
            groupUser.setGroupid(groupid);
            groupUser.setUserid(json.getInt(userid));
            groupUsers.add(groupUser);
        }
        //添加到数据库，并判断该小组成员是否已经添加
        for (GroupUser groupUser : groupUsers) {
            //判断小组成员是否存在
            if (groupUserMapper.getByGroupIdUserId(groupUser.getGroupid(),groupUser.getUserid())<1){
                groupUserMapper.insertSelective(groupUser);
            }
        }
        return RetrunUtil.ret(true,"添加成功");
    }

    @Override
    public Map<String, Object> deleteGroupUser(Integer id) {
        Integer i=groupUserMapper.deleteGroupUser(id);
        return null;
    }


}
