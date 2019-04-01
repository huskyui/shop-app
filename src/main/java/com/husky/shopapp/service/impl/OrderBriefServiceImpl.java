package com.husky.shopapp.service.impl;

import com.husky.shopapp.entity.OrderBrief;
import com.husky.shopapp.mapper.OrderBriefMapper;
import com.husky.shopapp.service.IOrderBriefService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 订单表 服务实现类
 * </p>
 *
 * @author huskyui
 * @since 2019-04-01
 */
@Service
public class OrderBriefServiceImpl extends ServiceImpl<OrderBriefMapper, OrderBrief> implements IOrderBriefService {

}
