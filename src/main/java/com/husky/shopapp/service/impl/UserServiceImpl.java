package com.husky.shopapp.service.impl;

import com.husky.shopapp.entity.User;
import com.husky.shopapp.mapper.UserMapper;
import com.husky.shopapp.service.IUserService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author huskyui
 * @since 2019-03-29
 */
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements IUserService {

}
