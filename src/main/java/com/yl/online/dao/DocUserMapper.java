package com.yl.online.dao;

import com.yl.online.entity.DocUser;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
@Mapper
public interface DocUserMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(DocUser record);

    int insertSelective(DocUser record);

    DocUser selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(DocUser record);

    int updateByPrimaryKey(DocUser record);

    List<Integer> getDocId(@Param("userid") Integer userid);
}