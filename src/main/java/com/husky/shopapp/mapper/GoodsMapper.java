package com.husky.shopapp.mapper;

import com.husky.shopapp.entity.Goods;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 * 商品 Mapper 接口
 * </p>
 *
 * @author huskyui
 * @since 2019-03-23
 */
public interface GoodsMapper extends BaseMapper<Goods> {

    /**
     * 通过limit
     * @param start
     * @param step
     * @return List<Goods>
     */
    List<Goods> getListByLimit(@Param("start")Integer start,@Param("step")Integer step);
}
