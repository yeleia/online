package com.yl.online.dao;

import com.yl.online.entity.DocGroup;

public interface DocGroupMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(DocGroup record);

    int insertSelective(DocGroup record);

    DocGroup selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(DocGroup record);

    int updateByPrimaryKey(DocGroup record);
}