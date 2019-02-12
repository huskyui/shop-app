package com.husky.shopapp.util;

import com.alibaba.fastjson.JSON;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * 渲染工具
 *
 * @author huskyui
 * @date 2019-2-12
 */
public class RenderUtil {

    /**
     * 渲染json对象
     * */
    public static void renderJson(HttpServletResponse response,Object jsonObject){
        try{
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            PrintWriter writer = response.getWriter();
            writer.write(JSON.toJSONString(jsonObject));
        }catch (IOException e){
            throw new RuntimeException("写错误");
        }
    }

}
