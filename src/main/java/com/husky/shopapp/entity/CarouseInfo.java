package com.husky.shopapp.entity;

import java.time.LocalDateTime;
import java.io.Serializable;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 录播图
 * </p>
 *
 * @author huskyui
 * @since 2019-03-19
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class CarouseInfo implements Serializable {

    private static final long serialVersionUID = 1L;
    /**
     * id
     * */
    private Integer id;
    /**
     * 超链接地址
     */
    private String url;

    /**
     * 图片地址
     */
    private String img;

    /**
     * 创建时间
     */
    private LocalDateTime createtime;

    /**
     * type -1为首页轮播图地址
     * */
    private Integer goodsId;

}
