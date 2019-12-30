package com.hsbc.embassy;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.oauth2.config.annotation.web.configuration.EnableAuthorizationServer;
import org.springframework.security.oauth2.config.annotation.web.configuration.EnableResourceServer;
import org.springframework.security.oauth2.provider.OAuth2Authentication;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

@SpringBootApplication
@RestController
@EnableResourceServer
@EnableAuthorizationServer

/**
curl --location --request POST 'http://localhost:8080/auth/oauth/token' \
--header 'Authorization: Basic ZW1iYXNzeTp0aGlzaXNzZWNyZXQ=' \
--header 'Content-Type: multipart/form-data; boundary=--------------------------727087620079613204050588' \
--form 'grant_type=password' \
--form 'scope=webclient' \
--form 'username=robert.wang' \
--form 'password=password2'
 * @author chengwang2019
 *
 *
 *curl --location --request GET 'http://localhost:8084/hive/list/foodmart/customer' \
--header 'Authorization: Bearer d2beaa3b-c103-4b05-b6b9-0cf78a01b53b'
 */
public class Application {
    @RequestMapping(value = { "/user" }, produces = "application/json")
    public Map<String, Object> user(OAuth2Authentication user) {
        Map<String, Object> userInfo = new HashMap<>();
        userInfo.put("user", user.getUserAuthentication().getPrincipal());
        userInfo.put("authorities", AuthorityUtils.authorityListToSet(user.getUserAuthentication().getAuthorities()));
        return userInfo;
    }


    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);
    }


}
