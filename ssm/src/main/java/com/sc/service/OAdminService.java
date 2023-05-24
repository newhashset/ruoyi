package com.sc.service;

import com.github.pagehelper.PageInfo;
import com.sc.pojo.OAdmin;

import java.util.List;

public interface OAdminService {

    OAdmin login(OAdmin admin);

    PageInfo<OAdmin> show(Integer pageNumber);

    int add(OAdmin admin);

    int editPwd(OAdmin admin);

    int update(OAdmin admin);

    int delete(Integer id);

    OAdmin queryById(Integer id);

    int disableAll(Integer[] ids);

    int enableAll(Integer[] ids);

    int deleteAll(Integer[] ids);

    List<OAdmin> select(OAdmin admin);

    int profile(OAdmin admin);
}
