package com.sc.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.pagehelper.PageInfo;
import com.sc.pojo.ORole;
import com.sc.service.ORoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;

@Controller
@RequestMapping("/role")
public class ORoleController {
    @Autowired
    ORoleService ors;
    @RequestMapping("/toList")
    public String toList(){return "/role/list";}

    @RequestMapping("/show")
    public String show(@RequestParam(defaultValue = "1")Integer pageNum, Map map){
        PageInfo<ORole> pageInfo=ors.show(pageNum);
        map.put("p",pageInfo);
        return "/role/list";}

    @RequestMapping("/toAdd")
    public String toAdd(){
        return "/role/add";
    }

    @RequestMapping("/toResources")
    public String toResources(){
        return "/role/resources";
    }

    @RequestMapping("/queryByRoleid")
    public String queryByRoleid(Integer roleid,Map map) throws JsonProcessingException {
        ORole role=ors.queryByRoleid(roleid);
        map.put("r",role);
        //手动将r包含的menus集合转换成json保存
        ObjectMapper obj=new ObjectMapper();
        String json = obj.writeValueAsString(role.getMenus());
        map.put("json",json);
        return "/role/resources";
    }

    @RequestMapping("/addMenu")
    public String addMenu(Integer roleid,Integer[] menuids){
       ors.addMenu(roleid,menuids);
       return "redirect:/role/show";
    }



}
