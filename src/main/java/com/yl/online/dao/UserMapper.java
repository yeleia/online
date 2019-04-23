package com.yl.online.dao;

import com.yl.online.entity.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface UserMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

    User getByNP(@Param("usernumber") String usernumber,@Param("userpass") String userpass);

    Integer isExsitUser(@Param("usernumber") String usernumber);

    List<User> getUserList(@Param("auth")Integer auth);

}