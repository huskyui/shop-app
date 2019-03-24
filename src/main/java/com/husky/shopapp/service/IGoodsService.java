package com.husky.shopapp.service;

import com.husky.shopapp.entity.Goods;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 * 商品 服务类
 * </p>
 *
 * @author huskyui
 * @since 2019-03-23
 */
public interface IGoodsService extends IService<Goods> {
    /**
     * 根据
     * @param pageIndex
     * @return List<Goods>
     */
    List<Goods> getListByPageIndex(Integer pageIndex);
}
