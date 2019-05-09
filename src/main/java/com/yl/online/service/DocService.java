package com.yl.online.service;

import com.yl.online.entity.Doc;
import com.yl.online.entity.Group;
import com.yl.online.entity.User;

import java.util.List;

/**
 * @author yelei
 * @date 2019/5/8
 */
public interface DocService {
    User getUserById(Integer id);

    List<Group> getGroupId(Integer id);

    List<Integer> getDocId(Integer id);

    Doc getDocById(Integer integer);

    List<Integer> getDocIdByUserId(Integer id);

    List<Integer> getGroupIdByUserId(Integer id);

    void addGroupDoc(Doc doc, Integer id, Integer groupId);

    Group getGroupById(Integer integer);

    void addUserDoc(Doc doc, Integer id);
}
