package com.husky.shopapp.config;

import com.husky.shopapp.core.RestApiInterceptor;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * @author huskyui
 * @date 2019-2-11
 */
@Configuration
public class webConfig implements WebMvcConfigurer {


    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        System.out.println("拦截器已经注册");
        registry.addInterceptor(new RestApiInterceptor()).addPathPatterns("/**");
    }
}
