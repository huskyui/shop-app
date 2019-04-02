package com.husky.shopapp.mapper;

import com.husky.shopapp.entity.OrderDetail;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.husky.shopapp.vo.OrderDetailVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 * 商品详情 Mapper 接口
 * </p>
 *
 * @author huskyui
 * @since 2019-04-01
 */
public interface OrderDetailMapper extends BaseMapper<OrderDetail> {
    /**
     * 根据订单号查找点单详情
     * */
    List<OrderDetailVO> selectByOrderId(@Param("orderId")String orderId);
}
