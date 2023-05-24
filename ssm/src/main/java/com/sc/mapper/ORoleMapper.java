package com.sc.mapper;

import com.sc.pojo.OMenu;
import com.sc.pojo.ORole;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

public interface ORoleMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(ORole record);

    int insertSelective(ORole record);

    ORole selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ORole record);

    int updateByPrimaryKey(ORole record);

    List<ORole> queryAll();

    List<ORole> show();

    int deleteMenuRole(Integer roleid);

    int addMenu(@Param("roleid") Integer roleid,@Param("menuids") Integer[] menuids);

    int addMenu2(@Param("roleid") Integer roleid,@Param("menuids") Integer[] menuids);
}