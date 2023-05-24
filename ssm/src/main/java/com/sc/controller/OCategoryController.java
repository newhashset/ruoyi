package com.sc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/category")
public class OCategoryController {
    @RequestMapping("/toList")
    public String toList(){return "/category/list";}
}
