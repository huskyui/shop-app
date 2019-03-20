package com.husky.shopapp.controller;

import com.husky.shopapp.entity.CarouseInfo;
import com.husky.shopapp.entity.Result;
import com.husky.shopapp.service.ICarouseInfoService;
import com.husky.shopapp.util.ResultUtil;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
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

    /**
     * 获取录播图信息
     * */
    @RequestMapping("/carouselInfo")
    public Result getCarouseInfo(){
        List<CarouseInfo> carouseInfoList = carouseInfoService.list();
        if(Objects.isNull(carouseInfoList)||carouseInfoList.size()==0){
            return ResultUtil.setErrorResult("数据不存在");
        }
        return Result.builder()
                .success(true)
                .msg("获取成功")
                .data(carouseInfoList)
                .build();
    }
}
