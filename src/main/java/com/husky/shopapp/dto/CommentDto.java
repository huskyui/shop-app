package com.husky.shopapp.dto;

import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

import java.time.LocalDateTime;
import java.util.Date;

/**
 * @author husky
 * @date 2019/3/22 14:36
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class CommentDto {

    private String username;
    /**
     * 创建时间
     */
    private Date createtime;
    /**
     * 评论内容
     * */
    private String content;
}
