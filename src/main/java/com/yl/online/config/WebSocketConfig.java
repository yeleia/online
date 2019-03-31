package com.yl.online.config;

import com.yl.online.service.MyHandler;
import com.yl.online.service.MyHandshake;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;
import org.springframework.web.socket.server.standard.ServerEndpointExporter;


/**
 * @author yelei
 * @date 2019/3/23
 */
@Slf4j
@Configuration
@EnableWebSocket
public class WebSocketConfig implements WebSocketConfigurer {
    @Autowired
    private MyHandshake handshake;

    @Autowired
    private MyHandler handler;
    @Override
    public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
        //添加处理器
        //部分 支持websocket 的访问链接,允许跨域
        registry.addHandler(handler, "/echo").addInterceptors(handshake).setAllowedOrigins("/socket/*");
        //部分 不支持websocket的访问链接,允许跨域
        registry.addHandler(handler, "/sockjs/echo").addInterceptors(handshake).setAllowedOrigins("/socket/*").withSockJS();
    }
}
