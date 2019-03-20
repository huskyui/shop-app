package com.husky.shopapp;

import com.nimbusds.jose.*;
import com.nimbusds.jose.crypto.MACSigner;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.security.SecureRandom;

@RunWith(SpringRunner.class)
@SpringBootTest
public class ShopAppApplicationTests {

    @Test
    public void contextLoads() {
    }
    /**
     *jwt测试
     */

    @Test
    public void testJwt() throws JOSEException {
        //Create an HMAC-protected JWS object with some payload
        JWSObject jwsObject = new JWSObject(new JWSHeader(JWSAlgorithm.HS256),new Payload("hello,world"));
        //we need a 256-bit key for HS256 which must be pre-shared
        byte[] sharedKey = new byte[32];
        new SecureRandom().nextBytes(sharedKey);
        //apply the HAMC to the JWS object
        jwsObject.sign(new MACSigner(sharedKey));
        //output in URL-safe format
        System.out.println(jwsObject.serialize());
    }

}
