package com.husky.shopapp.core;



import com.husky.shopapp.util.JwtUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.servlet.resource.ResourceHttpRequestHandler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * @author huskyui
 * @date 2019-1-25
 */
public class RestApiInterceptor extends HandlerInterceptorAdapter {
    private Logger log = LoggerFactory.getLogger(this.getClass());
    @Autowired
    private JwtUtil jwtUtil;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        if(handler instanceof ResourceHttpRequestHandler){
            return true;
        }
        return check(request,response);
    }

    private boolean check(HttpServletRequest request,HttpServletResponse response){
        log.info("当前拦截器拦截路径"+request.getServletPath());
        //如果是登录界面
        if(request.getServletPath().equals(jwtUtil.getAuthPath())){
            return true;
        }
        final String requestHeader = request.getHeader(jwtUtil.getAuthPath());
        /**
         * 此处需要更新代码
         * */





        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}
