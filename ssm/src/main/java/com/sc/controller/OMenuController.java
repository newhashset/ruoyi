package com.sc.controller;

import com.github.pagehelper.PageInfo;
import com.sc.pojo.OMenu;
import com.sc.service.OMenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;

@Controller
@RequestMapping("/menu")
public class OMenuController {
    @Autowired
    OMenuService oms;
    @RequestMapping("/toList")
    public String toList(){return "/menu/list";}

    @RequestMapping("/show")
    public String show(@RequestParam(defaultValue = "1") Integer pageNum, Map map){
        PageInfo<OMenu> pageInfo=oms.show(pageNum);
        map.put("p",pageInfo);
        return "/menu/list";}

    @RequestMapping("/toAdd")
    public String toAdd(){
        return "/menu/add";
    }

    @RequestMapping("/add")
    public String add(OMenu menu) {
        oms.add(menu);
        return "redirect:/menu/show";
    }
}
