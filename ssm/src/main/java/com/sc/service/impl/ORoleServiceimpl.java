package com.sc.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sc.mapper.ORoleMapper;
import com.sc.pojo.OMenu;
import com.sc.pojo.ORole;
import com.sc.service.ORoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Service
@Transactional
public class ORoleServiceimpl implements ORoleService {
    @Autowired
    ORoleMapper orm;

    @Override
    public List<ORole> queryAll() {
        return orm.queryAll();
    }

    @Override
    public PageInfo<ORole> show(Integer pageNum) {
        PageHelper.startPage(pageNum,3);
        return new PageInfo<ORole>(orm.show());
    }
    //添加权限的业务功能？
    @Override
    public int addMenu(Integer roleid, Integer[] menuids) {
        //1.先删除角色原来的权限 防止重复
        orm.deleteMenuRole(roleid);
        //2.再批量新增多个权限数据
        return orm.addMenu(roleid,menuids);
        //insert into 表 values(1,2),(1,3),(1,4)
        //insert into 表 select 1,2 union,
        //select 1,3 union,select 1,4 union,select 1,5
    }

    @Override
    public ORole queryByRoleid(Integer roleid) {
        return orm.selectByPrimaryKey(roleid);
    }
}
