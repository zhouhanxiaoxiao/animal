package com.cibr.animal.demo.config;

import com.cibr.animal.demo.util.RedisUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Objects;

public class AuthInterceptor implements HandlerInterceptor {
    @Autowired
    private RedisUtil redisUtil;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=utf-8");
        if (request.getMethod().equals("OPTIONS")){
            response.setStatus(200);
            return true;
        }
        String token = request.getHeader("token");
        if (StringUtils.isEmpty(token)) {
            response.setStatus(401);
            return false;
        }
        Object loginStatus = redisUtil.get(token);
        if(Objects.isNull(loginStatus)){
            response.setStatus(401);
            return false;
        }
        redisUtil.set(token,loginStatus);
        request.setAttribute("user", loginStatus);
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}
