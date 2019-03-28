package com.yl.online.dao;

import com.yl.online.entity.GroupDoc;

public interface GroupDocMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(GroupDoc record);

    int insertSelective(GroupDoc record);

    GroupDoc selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(GroupDoc record);

    int updateByPrimaryKey(GroupDoc record);
}