package com.husky.shopapp.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.husky.shopapp.entity.Goods;
import com.husky.shopapp.mapper.GoodsMapper;
import com.husky.shopapp.service.IGoodsService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * <p>
 * 商品 服务实现类
 * </p>
 *
 * @author huskyui
 * @since 2019-03-23
 */
@Service
public class GoodsServiceImpl extends ServiceImpl<GoodsMapper, Goods> implements IGoodsService {
    private Integer STEP = 10;
    @Resource
    private GoodsMapper goodsMapper;

    @Override
    public List<Goods> getListByPageIndex(Integer pageIndex) {
        Integer start = (pageIndex-1)*STEP;
        return goodsMapper.getListByLimit(start,STEP);
    }
}
