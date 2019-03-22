package com.husky.shopapp.util;

import com.husky.shopapp.entity.Result;

import java.util.List;
import java.util.Objects;

/**
 * list工具类
 * @author husky
 * @date 2019/3/21 15:56
 */
public class ListUtil {
    public static boolean checkList(List list){
        boolean result = true;
        if(Objects.isNull(list)||list.size()==0){
            result = false;
        }
        return result;
    }
}
