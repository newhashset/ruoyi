package com.sc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/freedback")
public class OFeedbackController {
    @RequestMapping("/toList")
    public String toList(){return "/freedback/freedBack";}
}
