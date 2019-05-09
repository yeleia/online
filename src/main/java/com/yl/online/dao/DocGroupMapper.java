package com.yl.online.dao;

import com.yl.online.entity.DocGroup;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
@Mapper
public interface DocGroupMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(DocGroup record);

    int insertSelective(DocGroup record);

    DocGroup selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(DocGroup record);

    int updateByPrimaryKey(DocGroup record);

    List<Integer> getDocId(@Param("groupid") Integer groupid);
}