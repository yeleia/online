package com.yl.online;
import com.yl.online.service.LoginService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import javax.servlet.http.HttpServletRequest;

/**
 * @author yelei
 * @date 2019/4/4
 */
@RunWith(SpringRunner.class)
@SpringBootTest
public class MyTest {
    @Autowired
    private LoginService loginService;
    @Test
    public void testLogin(){
        HttpServletRequest request=null;
        String usernumber="20158618";
        String userpass="123";

    }
}
