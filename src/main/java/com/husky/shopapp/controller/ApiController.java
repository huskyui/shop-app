package com.husky.shopapp.controller;

import com.husky.shopapp.dto.CommentDto;
import com.husky.shopapp.dto.NewsDto;
import com.husky.shopapp.entity.*;
import com.husky.shopapp.service.ICarouseInfoService;
import com.husky.shopapp.service.ICommentService;
import com.husky.shopapp.service.INewsBriefService;
import com.husky.shopapp.service.INewsService;
import com.husky.shopapp.util.ResultUtil;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

/**
 * @author husky
 * @date 2019/3/19 17:28
 * @message 此controller下都是无需登录即可获取到的信息
 */
@RestController
@RequestMapping("/api")
public class ApiController {
    @Resource
    private ICarouseInfoService carouseInfoService;
    @Resource
    private INewsBriefService newsBriefService;
    @Resource
    private INewsService newsService;
    @Resource
    private ICommentService commentService;

    /**
     * 获取录播图信息
     * */
    @RequestMapping("/carouselInfo")
    public Result getCarouseInfo(){
        List<CarouseInfo> carouseInfoList = carouseInfoService.list();
        return Result.builder()
                .success(true)
                .msg("获取成功")
                .data(carouseInfoList)
                .build();
    }

    /**
     * 获取新闻列表
     * */
    @RequestMapping("/getNewsList")
    public Result getNewsList(){
        List<NewsBrief> newsBriefList = newsBriefService.list();
        return Result.builder()
                .success(true)
                .msg("获取成功")
                .data(newsBriefList)
                .build();
    }

    /**
     * 获取新闻详情
     * */
    @RequestMapping("/getNews")
    public Result getNews(@RequestParam(value = "id",defaultValue = "0")Integer id){

       NewsBrief newsBrief = newsBriefService.getById(id);
       newsBrief.setClickTimes(newsBrief.getClickTimes()+1);
       newsBriefService.updateById(newsBrief);
       News news = newsService.getById(id);
        NewsDto newsDto = NewsDto.builder()
                                .id(news.getId())
                                .content(news.getContent())
                                .clickTimes(newsBrief.getClickTimes())
                                .createtime(newsBrief.getCreatetime())
                                .title(newsBrief.getTitle())
                                .build();
       return Result.builder()
                    .success(true)
                    .msg("获取成功")
                    .data(newsDto)
                    .build();
    }

    /**
     * 获取评论
     * */
    @RequestMapping("/getCommentList/{foreignId}")
    public Result getCommentList(@PathVariable("foreignId")Integer foreignId,
                                 @RequestParam("pageIndex")Integer pageIndex){
        List<CommentDto> commentDtoList = commentService.getCommentList(foreignId,pageIndex);
        return Result.builder()
                .success(true)
                .msg("成功")
                .data(commentDtoList)
                .build();
    }

    /**
     * 添加评论
     * */
    @RequestMapping("/addComment")
    public Result addComment(@RequestParam("foreignId")Integer foreignId,
                             @RequestParam("userId")Integer userId,
                             @RequestParam("content")String content,
                             @RequestParam("type")Integer type){
        boolean result = commentService.save(Comment.builder().createtime(new Date())
                .content(content)
                .foreignId(foreignId)
                .type(type)
                .userId(userId)
                .build());
        if(!result){
            return ResultUtil.setErrorResult("插入错误");
        }else{
            return ResultUtil.setSuccessResult("插入成功");
        }

    }
}
