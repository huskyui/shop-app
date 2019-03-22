package com.husky.shopapp.entity;

import java.time.LocalDateTime;
import java.io.Serializable;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 新闻列表
 * </p>
 *
 * @author huskyui
 * @since 2019-03-21
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class NewsBrief implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 主键
     * */
    private Integer id;

    /**
     * 新闻id
     */
    private Integer newsId;

    /**
     * 标题
     */
    private String title;

    /**
     * 摘要
     */
    private String summary;

    /**
     * 图片地址
     */
    private String imgUrl;

    /**
     * 点击次数
     */
    private Integer clickTimes;

    /**
     * 创建时间
     */
    private LocalDateTime createtime;


}
