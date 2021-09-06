package com.it.servlet2;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author ZuYingFang
 * @time 2021-04-16 0:37
 */
public class Response1 extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");

        resp.getWriter().write("response1-1");

        /**
         * 请求转发是客户端请求一个servlet程序，这个servlet处理完之后还需要进一步交给另一个servlet程序处理
         * 就进行请求转发
         * 首先获得转发对象 RequestDispatcher requestDispatcher = request.getRequestDispatcher("/servlet2");
         * 然后forward    requestDispatcher.forward(request,response);
         * 1、浏览器地址栏没有改变
         * 2、他们是一次请求
         * 3、他们共享request域中的数据
         * 4、可以访问到WEB-INF域下
         * 5、不可以访问工程以外的资源
         */

        /**
         * 请求重定向是指客户端给服务器发请求，然后服务器告诉客户端说。我给你一些地址。你去新地址访问。叫请求
         * 重定向（因为之前的地址可能已经被废弃）
         * 首先发送响应码302        resp.setStatus(302);
         * 然后发送响应头Location   resp.setHeader("Location","http://localhost:8080/JavaWeb/response2");
         * 1、浏览器地址栏改变
         * 2、他们是两次请求
         * 3、不共享request域中的数据
         * 4、不可以访问到WEB-INF域下
         * 5、可以访问工程以外的资源
         */
        resp.setStatus(302);
        resp.setHeader("Location","http://localhost:8080/JavaWeb/response2");

        resp.getWriter().write("response1-2");
    }
}
