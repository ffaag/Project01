package com.it.servlet3;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author ZuYingFang
 * @time 2021-04-14 15:55
 */
public class RequestAPIServlet1 extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //getRequestURI() 获取请求的资源路径，从工程名开始，如/JavaWeb/requestAPIServlet1
        System.out.println("URI->" + req.getRequestURI());

        //getRequestURL() 获取请求的统一资源定位符（绝对路径），如http://localhost:8080/JavaWeb/requestAPIServlet1
        System.out.println("URL->" + req.getRequestURL());

        //getRemoteHost() 获取客户端的ip 地址
        System.out.println("客户端的ip地址->" + req.getRemoteHost());

        //getHeader() 获取请求头
        System.out.println("请求头User-agent->" + req.getHeader("User-agent"));

        //getMethod() 获取请求的方式GET 或POST
        System.out.println("获取请求的方式->" + req.getMethod());

        //getParameter() 获取请求的参数
        

        //getParameterValues() 获取请求的参数（多个值的时候使用）
        //setAttribute(key, value); 设置域数据
        //getAttribute(key); 获取域数据
        //getRequestDispatcher() 获取请求转发对象
    }

}
