package com.it.servlet2;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * @author ZuYingFang
 * @time 2021-04-16 0:07
 */
public class ResponseIOServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //ServletOutputStream outputStream = resp.getOutputStream();
        PrintWriter writer = resp.getWriter();

        // 输出时都设置输出流为UTF-8，不管是get方法还是post方法，这里设置客户端
        resp.setCharacterEncoding("UTF-8");
        //但是浏览器端可能使用的是GBK，因此还要将浏览器编码设为UTF-8，通过响应头操作，这里设置服务器端
        resp.setHeader("Content-Type","text/html; charset=UTF-8");

        // 可以同时设置客户端和服务器端，一条语句搞定
        // 缺点，这个方法必须要在获取流对象之前调用才有效，所以我们可以写在第一句
        resp.setContentType("text/html; charset=UTF-8");

        //往客户端回应数据，先得到输出流，然后调用方法输出数据
        writer.write("hello");
    }
}
