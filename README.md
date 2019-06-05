# shop-app
### 构建项目

1. 下载项目,并导入
2. 在项目下有shop.sql,可以自行运行,数据库mysql
3. maven里面的包请自行下载
4. 报错请自行查看报错信息



### jar包
    orm:mybatis-plus
    lombok
### token

    关于token,现在是后端 login接口,成功返回token，
    前段每次请求，都带上userid，token
    拦截器判断token是否过期来鉴权
    前段将token，可以保存在store,localStorage,sessionStorage三者皆可，看需求

### 信息保存

    前段，在获取到userId，userName，token时候，
    可以保存在localStorage里面，http://jerryzou.com/posts/cookie-and-web-storage/
    当然在上面这篇文章里面也看到，购物车的信息也可以存放在里面，而不用每次都进行修改


​    
    后端，每次请求的头部都带有token以及userId
    如果有部分controller接口需要获取用户信息，
    可以通过request获取相关信息。    
### 拦截器部分
```java
registry.addInterceptor(new RestApiInterceptor())
                .addPathPatterns("/**").excludePathPatterns("/api/**");
 addPathPatterns是配置拦截的路径
 excludePathPatterns是配置不拦截的路径
```
