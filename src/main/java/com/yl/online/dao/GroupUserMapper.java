package com.yl.online.dao;

import com.yl.online.entity.GroupUser;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface GroupUserMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(GroupUser record);

    int insertSelective(GroupUser record);

    GroupUser selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(GroupUser record);

    int updateByPrimaryKey(GroupUser record);
}