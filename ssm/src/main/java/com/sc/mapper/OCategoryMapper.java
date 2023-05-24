package com.sc.mapper;

import com.sc.pojo.OCategory;

public interface OCategoryMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(OCategory record);

    int insertSelective(OCategory record);

    OCategory selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(OCategory record);

    int updateByPrimaryKey(OCategory record);
}