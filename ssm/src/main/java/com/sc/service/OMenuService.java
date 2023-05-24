package com.sc.service;

import com.github.pagehelper.PageInfo;
import com.sc.pojo.OMenu;

import java.util.List;

public interface OMenuService {
    PageInfo<OMenu> show(Integer pageNum);

    List<OMenu> queryAll();

    int add(OMenu menu);
}
