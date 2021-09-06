package com.it.cookie;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

/**
 * @author ZuYingFang
 * @time 2021-04-22 16:26
 */
public abstract class BaseServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");

        String action = req.getParameter("action");
        /*if (action.equals("login")){
            login(req,resp);
        }else if(action.equals("regist")){
            regist(req,resp);
        }*/

        // 使用反射的思想可解决大量的if else问题，直接自己进行匹配
        Method declaredMethod = null;
        try {
            // 首先根据action鉴别字符串，获取相应的业务方法反射对象
            // 第一个参数为对应的字符串，后面的参数为对应的方法的参数所属的类
            declaredMethod = this.getClass().getDeclaredMethod(action, HttpServletRequest.class, HttpServletResponse.class);

            try {
                // 调用目标业务方法
                // 第一个参数为这些方法所属的类的对象，后面的参数为方法的参数
                declaredMethod.invoke(this, req, resp);
            } catch (IllegalAccessException e) {
                e.printStackTrace();
            } catch (InvocationTargetException e) {
                e.printStackTrace();
            }
        } catch (NoSuchMethodException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       doPost(req,resp);
    }
}
