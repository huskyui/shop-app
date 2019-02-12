package com.husky.shopapp.util;

import com.google.common.base.Strings;
import com.sun.org.apache.xml.internal.security.exceptions.Base64DecodingException;
import com.sun.org.apache.xml.internal.security.utils.Base64;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.ExpiredJwtException;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;
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
    public static long EXPIRETION_TIME;
    /**
     * SECRET
     * 密钥
     * */
    public static String SECRET;

    public  String getAuthPath() {
        return AUTH_PATH;
    }

    /**
     * auth_path
     * 授权路径
     * */
    public static String AUTH_PATH;

    /**
     * auth_header
     * 前段头部
     * */
    public static String AUTH_HEADER;


    @Value("${jwt.expire_time}")
    public void setExpiretionTime(long expiretionTime){
        EXPIRETION_TIME = expiretionTime;
    }



    @Value("${jwt.secret}")
    public void setSECRET(String secret){
        SECRET = secret;
    }

    @Value("${jwt.auth_path}")
    public  void setAuthPath(String authPath) {
        AUTH_PATH = authPath;
    }


    public static String getAuthHeader() {
        return AUTH_HEADER;
    }

    @Value("${jwt.auth_header}")
    public  void setAuthHeader(String authHeader) {
        AUTH_HEADER = authHeader;
    }

    public static SecretKey generalKey() {
        byte[] encodeKey = new byte[0];
        try {
            encodeKey = Base64.decode(SECRET);
        } catch (Base64DecodingException e) {
            e.printStackTrace();
        }
        SecretKey key = new SecretKeySpec(encodeKey,0,encodeKey.length,"AES");
        return key;
    }

    /**
     * 生成token
     * @param username 用户名
     * */
    public static String generateToken(String username,Integer userId){
        HashMap<String,Object> map = new HashMap<>();
        map.put("username",username);
        map.put("userId",userId);
        SecretKey secretKey = generalKey();
        String jwt = Jwts.builder()
                .setClaims(map)
                .setExpiration(new Date(System.currentTimeMillis()+EXPIRETION_TIME))
                .signWith(SignatureAlgorithm.HS256,secretKey).compact();
        return jwt;
    }

    /**
     *验证jwtToken
     * */
    public static Integer validateToken(String token){
        if(!Strings.isNullOrEmpty(token)){
            SecretKey secret = generalKey();
            Map<String,Object> body = Jwts.parser().setSigningKey(secret).parseClaimsJws(token).getBody();
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


    /**
     * 获取jwt的payload部分
     * */
    public static Claims getClaimFromToken(String token){
        SecretKey secret = generalKey();
        return Jwts.parser()
                .setSigningKey(secret)
                .parseClaimsJws(token)
                .getBody();
    }

    public static Date getExpiretionDateFromToken(String token){
        return getClaimFromToken(token).getExpiration();
    }


    /**
     * 验证token是否过期
     * */
    public static Boolean isTokenExpired(String token){
        try{
            final Date expiredDate = getExpiretionDateFromToken(token);
            return expiredDate.before(new Date());
        }catch (ExpiredJwtException expiredJwtException){
            return true;
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
