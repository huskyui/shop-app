package com.husky.shopapp.controller;

import com.google.common.base.Strings;
import com.husky.shopapp.entity.Result;
import com.husky.shopapp.entity.User;
import com.husky.shopapp.service.IUserService;
import com.husky.shopapp.util.JwtUtil;
import com.husky.shopapp.util.ResultUtil;
import com.husky.shopapp.vo.UserTokenVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

/**
 * @author huskyui
 * @date 2019-1-23
 */
@Controller
@RequestMapping("/user")
public class UserController {

    @Resource
    private StringRedisTemplate stringRedisTemplate;
    @Resource
    private IUserService userService;


    @RequestMapping("/login")
    @ResponseBody
    public Result login(@RequestParam(value = "username",defaultValue = "")String username, @RequestParam(value = "password",defaultValue = "")String password){
        if(Strings.isNullOrEmpty(username)||Strings.isNullOrEmpty(password)){
            ResultUtil.setErrorResult("用户用户名或密码不能为空");
        }
        //匹配数据库

        //成功就返回token
        String token = JwtUtil.generateToken(username,10001);
        UserTokenVO userTokenVO = UserTokenVO.builder()
                .username(username)
                .userId(10001)
                .token(token)
                .build();
        return ResultUtil.setResult(Boolean.TRUE,"登录成功",userTokenVO);

    }

    @ResponseBody
    @RequestMapping("/check")
    public Result tokenCheck(@RequestParam(value = "token",defaultValue = "")String token){
        Integer id = JwtUtil.validateToken(token);
        return ResultUtil.setResult(true,"成功",id);
    }

    @ResponseBody
    @RequestMapping("/getUserInfo")
    public Result getUserInfo(@RequestParam("userId")Integer userId){
        User user = userService.getById(userId);
        return Result.builder()
                .success(true)
                .msg("获取成功")
                .data(user)
                .build();
    }




}
