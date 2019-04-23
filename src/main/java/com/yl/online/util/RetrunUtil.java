package com.yl.online.util;

import java.util.LinkedHashMap;
import java.util.Map;

/**
 * @author yelei
 * @date 2019/4/5
 */
public class RetrunUtil {
    public static Map<String,Object> ret(boolean code,String message){
        Map<String,Object> resultMap=new LinkedHashMap<>();
        if (code){
            resultMap.put("status", 200);
        }else {
            resultMap.put("status",500);
        }
        resultMap.put("message",message);
        return resultMap;


    }
    public static Map<String,Object> ret(boolean code,String message,Object token){
        Map<String,Object> resultMap=new LinkedHashMap<>();
        if (code){
            resultMap.put("status",200);
        }else {
            resultMap.put("status",500);
        }
        resultMap.put("message",message);
        resultMap.put("token",token);
        return resultMap;

    }
}
