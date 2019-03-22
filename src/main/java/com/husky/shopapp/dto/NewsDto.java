package com.husky.shopapp.dto;

import com.husky.shopapp.entity.NewsBrief;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.time.LocalDateTime;

/**
 * @author husky
 * @date 2019/3/21 21:13
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@Builder
public class NewsDto{
    private String content;
    /**
     * 新闻id
     */
    private Integer id;

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
