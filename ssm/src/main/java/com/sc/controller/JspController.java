package com.sc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class JspController {
    @RequestMapping("/toLogin")
    public String toLogin(){
        return "/login";
    }
    @RequestMapping("/toHome")
    public String toHome(){
        return "/home";
    }
    @RequestMapping("/toIndex")
    public String toIndex(){
        return "/index";
    }
    @RequestMapping("/toProfile")
    public String  toProfile(){ return "/profile";}
    @RequestMapping("/toEditPwd")
    public String toEditPwd(){ return "/editPwd";}
    @RequestMapping("/toError")
    public String toError(){ return "/error";}

}
