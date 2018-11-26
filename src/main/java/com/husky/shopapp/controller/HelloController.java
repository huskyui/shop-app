package com.husky.shopapp.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author husky
 * @date 2018/11/26 15:54
 */
@RestController
@RequestMapping("/shop")
public class HelloController {
    @RequestMapping("/hello")
    public String sayHello(){
        return "hello world";
    }
}
