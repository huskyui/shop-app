package com.husky.shopapp.util;

import com.google.common.base.Strings;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

/**
 * @author huskyui
 * @date 2019-1-23
 */
@Configuration
public class JwtUtil {
    /**
     * EXPIRETION_TIME
     * 过期时间
     * */
    private static long EXPIRETION_TIME;
    /**
     * SECRET
     * 密钥
     * */
    private static String SECRET;


    @Value("${jwt.expire_time}")
    public void setExpiretionTime(long expiretionTime){
        EXPIRETION_TIME = expiretionTime;
    }



    @Value("${jwt.secret}")
    public void setSECRET(String secret){
        SECRET = secret;
    }

    /**
     * 生成token
     * @param username 用户名
     * */
    public static String generateToken(String username,Integer userId){
        HashMap<String,Object> map = new HashMap<>();
        map.put("username",username);
        map.put("userId",userId);
        String jwt = Jwts.builder()
                .setClaims(map)
                .setExpiration(new Date(System.currentTimeMillis()+EXPIRETION_TIME))
                .signWith(SignatureAlgorithm.ES256,SECRET).compact();
        return jwt;
    }

    /**
     *验证jwtToken
     * */
    public static Integer validateToken(String token){
        if(!Strings.isNullOrEmpty(token)){
            Map<String,Object> body = Jwts.parser().setSigningKey(SECRET).parseClaimsJws(token).getBody();
            String username = (String)(body.get("username"));
            Integer userId = (Integer)(body.get("userId"));
            if(Strings.isNullOrEmpty(username)|| Objects.isNull(userId)){
                throw new TokenValidationException("查无此人");
            }else{
                return userId;
            }
        }else{
            throw new TokenValidationException("token无效");
        }
    }


    public static long getExpiretionTime(){
        return JwtUtil.EXPIRETION_TIME;
    }

    static class TokenValidationException extends RuntimeException{
        public TokenValidationException(String msg){
            super(msg);
        }
    }


}
