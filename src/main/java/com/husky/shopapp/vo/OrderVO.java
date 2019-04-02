package com.husky.shopapp.vo;

import com.husky.shopapp.entity.OrderDetail;
import lombok.Data;

import java.math.BigDecimal;
import java.util.List;

/**
 * @author husky
 * @date 2019/4/2 13:24
 */
@Data
public class OrderVO {
    List<OrderDetailVO> orderDetailVOList;
    private Integer count;
    private BigDecimal totalAmount;
}
