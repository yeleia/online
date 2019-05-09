package com.yl.online.service.impl;

import com.yl.online.dao.*;
import com.yl.online.entity.*;
import com.yl.online.service.DocService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author yelei
 * @date 2019/5/8
 */
@Service("docService")
public class DocServiceImpl implements DocService {

    @Autowired
    private UserMapper userMapper;
    @Autowired
    private GroupMapper groupMapper;
    @Autowired
    private DocGroupMapper docGroupMapper;
    @Autowired
    private DocMapper docMapper;
    @Autowired
    private DocUserMapper docUserMapper;
    @Autowired
    private GroupUserMapper groupUserMapper;
    @Override
    public User getUserById(Integer id) {
        return userMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<Group> getGroupId(Integer id) {
        return groupMapper.getGroupId(id);
    }

    @Override
    public List<Integer> getDocId(Integer id) {
        return docGroupMapper.getDocId(id);
    }

    @Override
    public Doc getDocById(Integer integer) {
        return docMapper.selectByPrimaryKey(integer);
    }

    @Override
    public List<Integer> getDocIdByUserId(Integer id) {
        return docUserMapper.getDocId(id);
    }

    @Override
    public List<Integer> getGroupIdByUserId(Integer id) {
        return groupUserMapper.getByUser(id);
    }

    @Override
    public void addGroupDoc(Doc doc, Integer id, Integer groupId) {
        docMapper.insert(doc);
        DocGroup docGroup=new DocGroup();
        docGroup.setDocid(docMapper.getTopOne());
        docGroup.setGroupid(groupId);
        docGroupMapper.insertSelective(docGroup);
    }

    @Override
    public Group getGroupById(Integer integer) {
        return groupMapper.selectByPrimaryKey(integer);
    }

    @Override
    public void addUserDoc(Doc doc, Integer id) {
        docMapper.insert(doc);
        DocUser docUser=new DocUser();
        docUser.setDocid(docMapper.getTopOne());
        docUser.setUserid(id);
        docUserMapper.insert(docUser);

    }
}
