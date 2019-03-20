package com.husky.shopapp.config;

import com.husky.shopapp.core.RestApiInterceptor;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * @author huskyui
 * @date 2019-2-11
 * 拦截器配置类
 */
@Configuration
public class WebConfig implements WebMvcConfigurer {


    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        System.out.println("拦截器已经注册");


        registry.addInterceptor(new RestApiInterceptor())
                .addPathPatterns("/**").excludePathPatterns("/api/**");
    }
}
