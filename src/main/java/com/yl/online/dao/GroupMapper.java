package com.yl.online.dao;

import com.yl.online.entity.Group;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
@Mapper
public interface GroupMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Group record);

    int insertSelective(Group record);

    Group selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Group record);

    int updateByPrimaryKey(Group record);


    List<Group> getByCreator(@Param("creator") Integer creator);

    Group getById(@Param("id") Integer id);

    Integer updateGroupNameById(@Param("id") Integer id, @Param("groupname") String groupname);

    Integer getByGroupIdUserId(@Param("id") Integer id, @Param("creator") Integer creator);

    List<Group> getGroupId(@Param("creator") Integer creator);
}