package com.sc.mapper;

import com.sc.pojo.OMenu;

import java.util.List;

public interface OMenuMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(OMenu record);

    int insertSelective(OMenu record);

    OMenu selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(OMenu record);

    int updateByPrimaryKey(OMenu record);

    List<OMenu> queryAll();

    List<OMenu> queryByRoleId(Integer roleid);



}