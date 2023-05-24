package com.sc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/article")
public class OAritcleController {
    @RequestMapping("/toList")
    public String toList(){return "/article/list";}
}
