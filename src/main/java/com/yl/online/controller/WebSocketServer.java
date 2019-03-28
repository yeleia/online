package com.yl.online.controller;


import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Component;

import javax.websocket.*;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.concurrent.CopyOnWriteArraySet;

/**
 * @author yelei
 * @date 2019/3/28
 */
@ServerEndpoint("/websocket/{sid}")
@Component
public class WebSocketServer {
    static Log log=LogFactory.getLog(WebSocketServer.class);
    private static int onlineCount = 0;
    private static CopyOnWriteArraySet<WebSocketServer> webSocketSet=new CopyOnWriteArraySet<>();
    private Session session;
    private String sid="";
    //链接成功调用方法
    @OnOpen
    public void onOpen(Session session, @PathParam("sid")String sid){
        this.session=session;
        webSocketSet.add(this);
        addOnlineCount();
        log.info("有新窗口开始监听:"+sid+"，在线人数为"+getOnlineCount());
        this.sid=sid;
        try {
            senMessage("连接成功");
        }catch (IOException e){
            log.error("io异常");
        }
    }
    @OnClose
    public void onClose(){
        webSocketSet.remove(this);
        subOnlineCount();
        log.info("有一连接关闭，当前在线人数为:"+getOnlineCount());
    }
    @OnMessage
    public void onMessage(String message,Session session){
        log.info("收到来自窗口"+sid+"的信息"+message);
        //群发消息
        for (WebSocketServer item:webSocketSet){
            try{
                item.sendMessage(message);

            }catch (IOException e){
                e.printStackTrace();
            }
        }
    }
    @OnError
    public void onError(Session session,Throwable throwable){
        log.error("发生错误");
        throwable.printStackTrace();
    }
    //实现服务器主动推送


}
