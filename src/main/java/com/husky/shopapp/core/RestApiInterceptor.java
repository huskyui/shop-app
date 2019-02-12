package com.husky.shopapp.core;



import com.google.common.base.Strings;
import com.husky.shopapp.entity.Result;
import com.husky.shopapp.util.JwtUtil;
import com.husky.shopapp.util.RenderUtil;
import com.husky.shopapp.util.ResultUtil;
import io.jsonwebtoken.Jwt;
import io.jsonwebtoken.JwtException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.servlet.resource.ResourceHttpRequestHandler;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * @author huskyui
 * @date 2019-1-25
 */
public class RestApiInterceptor extends HandlerInterceptorAdapter {
    private Logger log = LoggerFactory.getLogger(this.getClass());


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
        if(request.getServletPath().equals(JwtUtil.AUTH_PATH)){
            return true;
        }
        final String token = request.getHeader(JwtUtil.AUTH_HEADER);
        log.info("token:" + token);
        if(!Strings.isNullOrEmpty(token)){
            try{
                boolean flag = JwtUtil.isTokenExpired(token);
                //此处超时，需要加入redis，redis里面缓存有效的token
                if(flag){
                    RenderUtil.renderJson(response, ResultUtil.setErrorResult("token超时"));
                    return false;
                }
            }catch (JwtException e){
                RenderUtil.renderJson(response, ResultUtil.setErrorResult("token解析失败"));
                return false;
            }
        }else{
            //header里面并没有携带token,response返回数据
            RenderUtil.renderJson(response,ResultUtil.setErrorResult("token不存在"));
            return false;
        }
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}
