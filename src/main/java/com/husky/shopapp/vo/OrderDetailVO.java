package com.husky.shopapp.vo;

import lombok.Data;

import java.math.BigDecimal;

/**
 * @author husky
 * @date 2019/4/2 12:08
 */
@Data
public class OrderDetailVO {
    private String imgUrl;
    private BigDecimal sellPrice;
    private String title;
    private Integer count;
}
