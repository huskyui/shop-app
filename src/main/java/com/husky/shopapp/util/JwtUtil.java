package com.husky.shopapp.util;

import com.google.common.base.Strings;
import com.sun.org.apache.xml.internal.security.exceptions.Base64DecodingException;
import com.sun.org.apache.xml.internal.security.utils.Base64;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import io.jsonwebtoken.impl.TextCodec;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import sun.security.krb5.EncryptionKey;

import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;
import java.security.Key;
import java.security.PrivateKey;
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


    public static long getExpiretionTime(){
        return JwtUtil.EXPIRETION_TIME;
    }

    static class TokenValidationException extends RuntimeException{
        public TokenValidationException(String msg){
            super(msg);
        }
    }


}
