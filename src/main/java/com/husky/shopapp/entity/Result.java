package com.husky.shopapp.entity;

import lombok.Builder;
import lombok.Data;

/**
 * @author huskyui
 * @date 2019-1-23
 */
@Data
@Builder
public class Result {
    private Boolean success;
    private String msg;
    private Object data;
}
