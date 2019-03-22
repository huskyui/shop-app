package com.husky.shopapp.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import java.time.LocalDateTime;
import java.io.Serializable;
import java.util.Date;

import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 评论
 * </p>
 *
 * @author huskyui
 * @since 2019-03-22
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@Builder
public class Comment implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    /**
     * 用户id| -1为匿名用户
     */
    private Integer userId;

    /**
     * 评论内容
     */
    private String content;

    /**
     * 类似 ： 0：新闻评论
     */
    private Integer type;

    /**
     * 外键id
     */
    private Integer foreignId;

    /**
     * 创建时间
     */
    private Date createtime;


}
