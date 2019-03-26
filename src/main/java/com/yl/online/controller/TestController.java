package com.yl.online.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * @author yelei
 * @date 2019/3/17
 */
@Controller
@RequestMapping(value = "/test")
public class TestController {
    @RequestMapping("/test")
    public ModelAndView test(ModelAndView modelAndView){
        modelAndView.addObject("name","test");
        modelAndView.setViewName("index");
        return modelAndView;
    }

}
