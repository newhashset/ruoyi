package com.sc.service.impl;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sc.mapper.OAdminMapper;
import com.sc.pojo.OAdmin;
import com.sc.service.OAdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("oas")
@Transactional
public class OAdminServiceimpl implements OAdminService {
    //依赖于mapper层
    @Autowired
    OAdminMapper oam;
    @Override
    public OAdmin login(OAdmin admin) {
        return oam.login(admin);
    }

    @Override
    public PageInfo<OAdmin> show(Integer pageNumber) {
        PageHelper.startPage(pageNumber,3);//分页
        return new PageInfo<OAdmin>(oam.show());//封装所有数据
    }

    @Override
    public int add(OAdmin admin) {
        return oam.insertSelective(admin);
    }

    @Override
    public int editPwd(OAdmin admin) {
        return oam.updateByPrimaryKeySelective(admin);
    }

    @Override
    public int update(OAdmin admin) {
        return oam.updateByPrimaryKeySelective(admin);
    }

    @Override
    public int delete(Integer id) {
        return oam.deleteByPrimaryKey(id);
    }

    @Override
    public OAdmin queryById(Integer id) {
        return oam.selectByPrimaryKey(id);
    }

    @Override
    public int disableAll(Integer[] ids) {
        return oam.updateDisableAll(ids);
    }

    @Override
    public int enableAll(Integer[] ids) {
        return oam.updateEnableAll(ids);
    }

    @Override
    public int deleteAll(Integer[] ids) {
        return oam.deleteAll(ids);
    }

    @Override
    public List<OAdmin> select(OAdmin admin) {
        return oam.select(admin);
    }

    @Override
    public int profile(OAdmin admin) {
        return oam.updateByPrimaryKeySelective(admin);
    }
}
