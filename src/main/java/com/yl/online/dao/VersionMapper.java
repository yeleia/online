package com.yl.online.dao;

import com.yl.online.entity.Version;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface VersionMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Version record);

    int insertSelective(Version record);

    Version selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Version record);

    int updateByPrimaryKeyWithBLOBs(Version record);

    int updateByPrimaryKey(Version record);
}