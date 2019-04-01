package com.husky.shopapp.service.impl;

import com.husky.shopapp.entity.OrderDetail;
import com.husky.shopapp.mapper.OrderDetailMapper;
import com.husky.shopapp.service.IOrderDetailService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 商品详情 服务实现类
 * </p>
 *
 * @author huskyui
 * @since 2019-04-01
 */
@Service
public class OrderDetailServiceImpl extends ServiceImpl<OrderDetailMapper, OrderDetail> implements IOrderDetailService {

}
