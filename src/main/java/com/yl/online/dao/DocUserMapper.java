package com.yl.online.dao;

import com.yl.online.entity.DocUser;

public interface DocUserMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(DocUser record);

    int insertSelective(DocUser record);

    DocUser selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(DocUser record);

    int updateByPrimaryKey(DocUser record);
}