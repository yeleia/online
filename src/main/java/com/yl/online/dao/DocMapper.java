package com.yl.online.dao;

import com.yl.online.entity.Doc;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface DocMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Doc record);

    int insertSelective(Doc record);

    Doc selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Doc record);

    int updateByPrimaryKeyWithBLOBs(Doc record);

    int updateByPrimaryKey(Doc record);


    Integer getTopOne();

}