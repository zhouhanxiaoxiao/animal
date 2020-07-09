package com.cibr.animal.demo.controller;

import com.cibr.animal.demo.service.EmailService;
import com.cibr.animal.demo.service.LoginService;
import com.cibr.animal.demo.util.RedisUtil;
import io.lettuce.core.dynamic.annotation.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;

@RestController
public class LoginController {

    @Autowired
    private LoginService loginService;

    @Autowired
    private RedisUtil redisUtil;

    @Autowired
    private EmailService emailService;

    @RequestMapping("/login")
    public String login(@Param("username") String username, @Param("password") String password,HttpServletRequest request){

        return "xxx";
    }
}

