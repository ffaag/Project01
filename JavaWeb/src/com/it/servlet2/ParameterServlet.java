package com.it.servlet;

/**
 * @author ZuYingFang
 * @time 2021-04-14 19:49
 */

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 用来接收表单发过来的数据，表单里面的action就写这个类的地址
 */
public class ParameterServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //getParameter() 获取请求的参数
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        //getParameterValues() 获取请求的参数（多个值的时候使用）
        String[] hobbies = req.getParameterValues("hobby");

        //setAttribute(key, value); 设置域数据


        //getAttribute(key); 获取域数据


        //getRequestDispatcher() 获取请求转发对象

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //get方式表单里有中文不会乱码，而post会乱码，我们要设置一下字符集
        req.setCharacterEncoding("UTF-8");
    }
}
