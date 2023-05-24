package com.sc.service;

import com.github.pagehelper.PageInfo;
import com.sc.pojo.ORole;

import java.util.List;

public interface ORoleService {
    List<ORole> queryAll();

    PageInfo<ORole> show(Integer pageNum);

    int addMenu(Integer roleid, Integer[] menuids);

    ORole queryByRoleid(Integer roleid);
}
