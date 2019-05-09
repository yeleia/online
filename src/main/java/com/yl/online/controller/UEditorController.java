package com.yl.online.controller;

import com.baidu.ueditor.ActionEnter;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author yelei
 * @date 2019/5/6
 */
@Controller
@RequestMapping("/static/ueditor")
public class UEditorController {
    @RequestMapping("/jsp/controller")
    public void writePage(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        request.setCharacterEncoding( "utf-8" );
        response.setHeader("Content-Type" , "text/html");
        String rootPath = request.getSession().getServletContext().getRealPath("/");
        response.getWriter().write(new ActionEnter(request, rootPath).exec());
    }

}
