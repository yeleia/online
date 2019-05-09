package com.yl.online.dao;

import com.yl.online.entity.GroupUser;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface GroupUserMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(GroupUser record);

    int insertSelective(GroupUser record);

    GroupUser selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(GroupUser record);

    int updateByPrimaryKey(GroupUser record);

    List<GroupUser> getByGroupId(@Param("groupid") Integer groupid);

    List<GroupUser> getByUserId(@Param("userid") Integer userid);

    Integer getByGroupIdUserId(@Param("groupid")Integer groupid, @Param("userid")Integer userid);

    Integer deleteByGroupId(@Param("groupid")Integer groupid);

    Integer deleteGroupUser(@Param("id") Integer id);

    List<Integer> getByUser(@Param("userid") Integer userid);
}