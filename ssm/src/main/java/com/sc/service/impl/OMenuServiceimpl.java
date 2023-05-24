package com.sc.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sc.mapper.OMenuMapper;
import com.sc.pojo.OMenu;
import com.sc.service.OMenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class OMenuServiceimpl implements OMenuService {
    @Autowired
    OMenuMapper omm;
    @Override
    public PageInfo<OMenu> show(Integer pageNum) {
        PageHelper.startPage(pageNum,3);
        return new PageInfo<OMenu>(omm.queryAll());
    }

    @Override
    public List<OMenu> queryAll() {
        return omm.queryAll();
    }

    @Override
    public int add(OMenu menu) {
        return omm.insertSelective(menu);
    }
}
