package com.husky.shopapp.util;

import com.husky.shopapp.entity.Result;
import lombok.Data;

/**
 * @author huskyui
 * @date 2019-1-23
 */

public class ResultUtil<T> {
    public static Result setResult(boolean flag, String msg,Object data){
        return Result.builder()
                .success(flag)
                .msg(msg)
                .data(data)
                .build();
    }

    public static Result setErrorResult(String msg){
        return Result.builder()
                .success(Boolean.FALSE)
                .msg(msg)
                .build();
    }

    public static Result setSuccessResult(String msg){
        return Result.builder()
                .success(Boolean.TRUE)
                .msg(msg)
                .build();
    }


}
