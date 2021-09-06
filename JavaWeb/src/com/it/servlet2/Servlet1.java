package com.it.servlet3; /**
 * @author ZuYingFang
 * @time 2021-04-14 20:29
 */

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class Servlet1 extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 请求转发

        //servlet1获取到材料
        String username = request.getParameter("username");
        System.out.println(username);

        // 给材料盖一个章，然后传给servlet2
        request.setAttribute("key1", "servlet1的数据");

        // 问去servlet2的路   首先以/打头，代表http://localhost:8080/工程名/，也就是web的目录
        // 这里写的/servlet2是web.xml工程里面配置的别名
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/servlet2");

        // 走向servlet2
        requestDispatcher.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
