package com.husky.shopapp.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.google.common.base.Strings;
import com.husky.shopapp.dto.CommentDto;
import com.husky.shopapp.dto.NewsDto;
import com.husky.shopapp.entity.*;
import com.husky.shopapp.service.*;
import com.husky.shopapp.util.JwtUtil;
import com.husky.shopapp.util.ResultUtil;
import com.husky.shopapp.vo.UserTokenVO;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Objects;

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
    @Resource
    private IGoodsService goodsService;
    @Resource
    private IUserService userService;

    /**
     * 获取录播图信息
     * */
    @RequestMapping("/carouselInfo")
    public Result getCarouseInfo(@RequestParam(value = "goodsId",defaultValue = "-1") Integer goodsId){
        List<CarouseInfo> carouseInfoList = carouseInfoService.list(new QueryWrapper<CarouseInfo>().eq("goods_id",goodsId));
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
                                 @RequestParam("pageIndex")Integer pageIndex,
                                 @RequestParam("type")Integer type){
        List<CommentDto> commentDtoList = commentService.getCommentList(foreignId,type,pageIndex);
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

    /**
     * 获取商品列表
     * */
    @RequestMapping("/getGoodsList")
    public Result getGoodsList(@RequestParam("pageIndex")Integer pageIndex){
        List<Goods> goodsList = goodsService.getListByPageIndex(pageIndex);
        return Result.builder()
                .success(true)
                .msg("成功")
                .data(goodsList)
                .build();
    }

    /**
     * 获取商品详细
     * */
    @RequestMapping("/getGoodsInfo")
    public Result getGoodsInfo(@RequestParam("goodsId")Integer goodsId){
        Goods goods= goodsService.getById(goodsId);
        return Result.builder()
                .success(true)
                .msg("成功")
                .data(goods)
                .build();
    }

    /**
     * 登录
     * */
    @RequestMapping("/login")
    public Result login(@RequestParam(value = "username",defaultValue = "")String username,
                        @RequestParam(value = "password",defaultValue = "")String password){
        if(Strings.isNullOrEmpty(username)||Strings.isNullOrEmpty(password)){
            ResultUtil.setErrorResult("用户用户名或密码不能为空");
        }
        //匹配数据库
        User user = userService
                .getOne(new QueryWrapper<User>()
                        .eq("username",username)
                        .eq("password",password));
        if(Objects.isNull(user)){
            return ResultUtil.setErrorResult("不存在该用户");
        }
        //成功就返回token
        String token = JwtUtil.generateToken(user.getUsername(),user.getId());
        UserTokenVO userTokenVO = UserTokenVO.builder()
                .userId(user.getId())
                .token(token)
                .build();
        return ResultUtil.setResult(Boolean.TRUE,"登录成功",userTokenVO);
    }

    /**
     * 判断是否登录，是否过期
     * */
    @RequestMapping("/checkIsLogin")
    public Result checkIsLogin(@RequestParam(value = "token",defaultValue = "")String token){
        if(token.equals("")){
            return ResultUtil.setErrorResult("token为空");
        }
        Integer id = JwtUtil.validateToken(token);
        return ResultUtil.setResult(true,"成功",id);
    }

    /**
     * 查看username是否存在
     * */
    @RequestMapping("/isExist")
    public Result register(@RequestParam("username")String username){
        User user = userService.getOne(new QueryWrapper<User>().eq("username",username));
        if(!Objects.isNull(user)){
            return ResultUtil.setErrorResult("用户名已经存在");
        }
        return ResultUtil.setSuccessResult("成功");
    }

    /**
     * 注册
     * */
    @RequestMapping("/register")
    public Result register(@RequestParam("username")String username,
                           @RequestParam("password")String password,
                           @RequestParam("email")String email,
                           @RequestParam("birthday")String birthday) throws ParseException {
        Date date = new SimpleDateFormat("yyyy-mm-dd").parse(birthday);
        User user = new User();
        user.setUsername(username);
        user.setBirthday(date);
        user.setEmail(email);
        user.setPassword(password);
        if(userService.save(user)) {
            return ResultUtil.setSuccessResult("注册成功");
        }else{
            return ResultUtil.setErrorResult("注册失败");
        }
    }
}
