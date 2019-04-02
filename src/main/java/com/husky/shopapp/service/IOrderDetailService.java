package com.husky.shopapp.service;

import com.husky.shopapp.entity.OrderDetail;
import com.baomidou.mybatisplus.extension.service.IService;
import com.husky.shopapp.vo.OrderVO;

/**
 * <p>
 * 商品详情 服务类
 * </p>
 *
 * @author huskyui
 * @since 2019-04-01
 */
public interface IOrderDetailService extends IService<OrderDetail> {
    /**
     * 根据订单号获取
     * @param orderId
     * @return OrderVO
     */
    OrderVO getOrderVOByOrderId(String orderId);
}
