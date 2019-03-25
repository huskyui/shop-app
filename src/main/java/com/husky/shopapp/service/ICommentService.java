package com.husky.shopapp.service;

import com.husky.shopapp.dto.CommentDto;
import com.husky.shopapp.entity.Comment;
import com.baomidou.mybatisplus.extension.service.IService;
import org.springframework.data.repository.query.Param;

import java.util.List;

/**
 * <p>
 * 评论 服务类
 * </p>
 *
 * @author huskyui
 * @since 2019-03-22
 */
public interface ICommentService extends IService<Comment> {
    /**
     * 获取评论列表
     * @param foreignId 外键
     * @param pageIndex 页数
     * @param type 评论类型
     * @return List<CommentDto>
     */
    List<CommentDto> getCommentList(Integer foreignId,Integer type,Integer pageIndex);
}
