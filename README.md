# shop-app
提供测试接口
###jar包
    orm:mybatis-plus
    lombok
###token
    
    关于token,现在是后端 login接口,成功返回token，
    前段每次请求，都带上userid，token
    拦截器判断token是否过期来鉴权
    前段将token，可以保存在store,localStorage,sessionStorage三者皆可，看需求
    
    
