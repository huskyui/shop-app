package com.husky.shopapp.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.husky.shopapp.entity.OrderBrief;
import com.husky.shopapp.entity.OrderDetail;
import com.husky.shopapp.entity.Result;
import com.husky.shopapp.service.IOrderBriefService;
import com.husky.shopapp.service.IOrderDetailService;
import com.husky.shopapp.util.OrderUtil;
import com.husky.shopapp.util.ResultUtil;
import com.husky.shopapp.vo.GoodsVo;
import com.husky.shopapp.vo.OrderVO;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.time.LocalDateTime;
import java.util.List;

/**
 * <p>
 * 订单表 前端控制器
 * </p>
 *
 * @author huskyui
 * @since 2019-04-01
 */
@RestController
@RequestMapping("/order")
public class OrderBriefController {
    @Resource
    private IOrderBriefService orderBriefService;
    @Resource
    private IOrderDetailService orderDetailService;

    /**
     * 购物车购买
     * */
    @RequestMapping("/addOrder/{userId}")
    public Result addOrder(@RequestBody List<GoodsVo> goodsList, @PathVariable Integer userId){
        OrderBrief orderBrief = new OrderBrief();
        orderBrief.setId(OrderUtil.getOrderId());
        orderBrief.setUserId(userId);
        orderBrief.setCreatetime(LocalDateTime.now());
        orderBriefService.save(orderBrief);
        for(GoodsVo goodsVo: goodsList){
            OrderDetail orderDetail = OrderDetail.builder()
                    .orderId(orderBrief.getId())
                    .count(goodsVo.getCount())
                    .goodsId(goodsVo.getGoodsId())
                    .createtime(LocalDateTime.now())
                    .build();
            orderDetailService.save(orderDetail);
        }
        return ResultUtil.setSuccessResult("购买成功");
    }

    @RequestMapping("/getOrderList")
    public Result getOrderList(@RequestParam("userId")Integer userId){
        List<OrderBrief> orderBriefList = orderBriefService.list(new QueryWrapper<OrderBrief>().eq("user_id",userId).orderByDesc("createtime"));
        return Result.builder()
                .success(true)
                .data(orderBriefList)
                .msg("成功")
                .build();
    }

    @RequestMapping("/getOrderInfo")
    public Result getOrderInfo(@RequestParam("orderId")String orderId){
        OrderVO orderVO = orderDetailService.getOrderVOByOrderId(orderId);
        return Result.builder()
                .success(true)
                .data(orderVO)
                .msg("获取成功")
                .build();
    }

}
