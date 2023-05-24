package com.sc.mapper;

import com.github.pagehelper.PageInfo;
import com.sc.pojo.OAdmin;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OAdminMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(OAdmin record);

    int insertSelective(OAdmin record);

    OAdmin selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(OAdmin record);

    int updateByPrimaryKey(OAdmin record);

    OAdmin login(OAdmin admin);

    List<OAdmin> show();

    int updateDisableAll(Integer[] ids);

    int updateEnableAll(Integer[] ids);

    int deleteAll(Integer[] ids);

    List<OAdmin> select(OAdmin admin);
}