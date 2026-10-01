package com.adarsh.shopkart.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ErrorController {

    @org.springframework.web.bind.annotation.RequestMapping("/403")
    public String accessDenied() {
        return "403"; 
    }
}
