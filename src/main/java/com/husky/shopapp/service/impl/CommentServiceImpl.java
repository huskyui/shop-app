package com.husky.shopapp.service.impl;

import com.husky.shopapp.dto.CommentDto;
import com.husky.shopapp.entity.Comment;
import com.husky.shopapp.mapper.CommentMapper;
import com.husky.shopapp.service.ICommentService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * <p>
 * 评论 服务实现类
 * </p>
 *
 * @author huskyui
 * @since 2019-03-22
 */
@Service
public class CommentServiceImpl extends ServiceImpl<CommentMapper, Comment> implements ICommentService {
    private Integer STEP = 5;
    @Resource
    private CommentMapper commentMapper;

    @Override
    public List<CommentDto> getCommentList(Integer foreignId,Integer pageIndex) {
        Integer start = (pageIndex -1) * STEP;
        return commentMapper.getCommentList(foreignId,start,STEP);
    }
}
