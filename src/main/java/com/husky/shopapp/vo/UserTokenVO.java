package com.husky.shopapp.vo;

import lombok.Builder;
import lombok.Data;

/**
 * @author huskyui
 * @date 2019-1-23
 */
@Data
@Builder
public class UserTokenVO {
    private String username;
    private Integer userId;
    private String token;
}
