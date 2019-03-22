package com.husky.shopapp.mapper;

import com.husky.shopapp.dto.CommentDto;
import com.husky.shopapp.entity.Comment;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;
import java.util.List;

/**
 * <p>
 * 评论 Mapper 接口
 * </p>
 *
 * @author huskyui
 * @since 2019-03-22
 */
public interface CommentMapper extends BaseMapper<Comment> {
    /**
     * 获取评论列表
     * @param foreignId 外键
     * @param start 起始值
     * @param step 步数
     * @return List<CommentDto>
     */
    List<CommentDto> getCommentList(@Param("foreignId")Integer foreignId, @Param("start")Integer start, @Param("step")Integer step);
}
