package com.husky.shopapp.service.impl;

import com.husky.shopapp.entity.OrderDetail;
import com.husky.shopapp.mapper.OrderDetailMapper;
import com.husky.shopapp.service.IOrderDetailService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.husky.shopapp.vo.OrderDetailVO;
import com.husky.shopapp.vo.OrderVO;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.math.BigDecimal;
import java.util.List;
import java.util.Objects;

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
    @Resource
    private OrderDetailMapper orderDetailMapper;

    @Override
    public OrderVO getOrderVOByOrderId(String orderId) {
        OrderVO orderVO = new OrderVO();
        List<OrderDetailVO> orderDetailVOList = orderDetailMapper.selectByOrderId(orderId);
        orderVO.setOrderDetailVOList(orderDetailVOList);
        Integer count = 0;
        BigDecimal totalAmount = new BigDecimal(0);
        if(orderDetailVOList.size()>0){
            for(OrderDetailVO orderDetailVO: orderDetailVOList){
                count += orderDetailVO.getCount();
                BigDecimal sell = orderDetailVO.getSellPrice().multiply(new BigDecimal(orderDetailVO.getCount()));
                totalAmount = totalAmount.add(sell);
            }
        }
        orderVO.setCount(count);
        orderVO.setTotalAmount(totalAmount);
        return orderVO;
    }
}
