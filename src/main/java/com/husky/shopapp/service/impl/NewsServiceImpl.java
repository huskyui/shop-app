package com.husky.shopapp.service.impl;

import com.husky.shopapp.entity.News;
import com.husky.shopapp.mapper.NewsMapper;
import com.husky.shopapp.service.INewsService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * new表 服务实现类
 * </p>
 *
 * @author huskyui
 * @since 2019-03-21
 */
@Service
public class NewsServiceImpl extends ServiceImpl<NewsMapper, News> implements INewsService {

}
