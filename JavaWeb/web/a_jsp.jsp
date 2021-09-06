<%--
  Created by IntelliJ IDEA.
  User: 1
  Date: 2021/4/16
  Time: 21:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
jsp 中的常用脚本
      i. 声明脚本(极少使用)
         声明脚本的格式是： <%! 声明java 代码%>
         作用：可以给jsp 翻译出来的java 类定义属性和方法甚至是静态代码块。内部类等。

      ii. 表达式脚本（常用）
      表达式脚本的格式是：<%=表达式%>
      表达式脚本的作用是：在jsp 页面上输出数据(包括对象)。
      表达式脚本的特点：
      1、所有的表达式脚本都会被翻译到_jspService() 方法中
      2、表达式脚本都会被翻译成为out.print()输出到页面上
      3、由于表达式脚本翻译的内容都在_jspService() 方法中,所以_jspService()方法中的对象都可以直接使用。如req.getParameter()
      4、表达式脚本中的表达式不能以分号结束。

      iii. 代码脚本
      代码脚本的格式是：
      <%
          java 语句
      %>
      代码脚本的作用是：可以在jsp 页面中，编写我们自己需要的功能（写的是java 语句）。
      代码脚本的特点是：
      1、代码脚本翻译之后都在_jspService 方法中
      2、代码脚本由于翻译到_jspService()方法中，所以在_jspService()方法中的现有对象都可以直接使用。req.getParameter()
      3、还可以由多个代码脚本块组合完成一个完整的java 语句。
      4、代码脚本还可以和表达式脚本一起组合使用，在jsp 页面上输出数据

jsp 中的内置对象，是指Tomcat 在翻译jsp页面成为Servlet 源代码后，内部提供的九大对象，叫内置对象
    jsp的九大内置对象
    request        请求对象
    response       响应对象
    pageContext    jsp的上下文对象
    session        会话对象
    application    ServletContext对象
    config         ServletConfig对象
    out            jsp输出流对象
    page           指向当前jsp的对象
    exception      异常对象

四个域对象分别是：
    pageContext (PageContextImpl 类) 当前jsp页面范围内有效
    request (HttpServletRequest 类)  一次请求内有效
    session (HttpSession 类)   一个会话范围内有效（打开浏览器访问服务器，直到关闭浏览器）
    application (ServletContext 类)  整个web 工程范围内都有效（只要web 工程不停止，数据都在）
    域对象是可以像Map一样存取数据的对象。四个域对象功能一样。不同的是它们对数据的存取范围。
    虽然四个域对象都可以存取数据set/getAttribute()。在使用上它们是有优先顺序的。
    四个域在使用的时候，优先顺序分别是，他们从小到大的范围的顺序。
    pageContext ====>>> request ====>>> session ====>>> application

jsp 中的out 输出和response.getWriter 输出的区别
    response.getWrite().write("Hello");
    out.write("Hello");
    首先执行out.flush()把out缓冲区的数据追加到response缓冲区末尾，然后刷新response，将输出写给客户端
    由于jsp 翻译之后，底层源代码都是使用out 来进行输出，所以一般情况下。我们在jsp 页面中统一使用out 来进行输出。
    避免打乱页面输出内容的顺序。
    out.write() 输出字符串没有问题
    out.print() 输出任意数据都没有问题（都转换成为字符串后调用的write 输出）
    在jsp 页面中，可以统一使用out.print()来进行输出

jsp 的常用标签，即多个页面都相同的部分，直接把一个单独的Jsp页面包含进去
    a)jsp 静态包含，用的最多，常用
    示例说明：
        <%@ include file=""%> 就是静态包含，写在要包含的位置
        file 属性指定你要包含的jsp 页面的路径
        地址中第一个斜杠/ 表示为http://ip:port/工程路径/ 映射到代码的web 目录
        静态包含的特点：
            1、静态包含不会翻译被包含的jsp 页面。
            2、静态包含其实是把被包含的jsp 页面的代码拷贝到包含的位置执行输出。
    b)jsp 动态包含
    示例说明：
        <jsp:include page=""></jsp:include> 这是动态包含
        page 属性是指定你要包含的jsp 页面的路径
        动态包含也可以像静态包含一样。把被包含的内容执行输出到包含位置
        动态包含的特点：
            1、动态包含会把包含的jsp 页面也翻译成为java 代码
            2、动态包含底层代码使用如下代码去调用被包含的jsp 页面执行输出。
            JspRuntimeLibrary.include(request, response, "/include/footer.jsp", out, false);
            3、动态包含，还可以传递参数
    c)jsp 标签-转发
    示例说明：
        <jsp:forward page=""></jsp:forward> 是请求转发标签，它的功能就是请求转发
        page 属性设置请求转发的路径

什么是Listener 监听器？
    1、Listener 监听器它是JavaWeb 的三大组件之一。JavaWeb 的三大组件分别是：Servlet 程序、Filter 过滤器、Listener 监
       听器。
    2、Listener 它是JavaEE 的规范，就是接口
    3、监听器的作用是，监听某种事物的变化。然后通过回调函数，反馈给客户（程序）去做一些相应的处理。
    ServletContextListener 监听器
    ServletContextListener 它可以监听ServletContext 对象的创建和销毁。
    ServletContext 对象在web 工程启动的时候创建，在web 工程停止的时候销毁。
    监听到创建和销毁之后都会分别调用ServletContextListener 监听器的方法反馈。
    两个方法分别是
    contextInitialized(ServletContextEvent sce)
    contextDestroyed(ServletContextEvent sce)
    如何使用ServletContextListener 监听器监听ServletContext 对象。
    使用步骤如下：
        1、编写一个类去实现ServletContextListener接口
        2、实现其两个回调方法
        3、到web.xml 中去配置监听器
        <listener>
            <listener-class>com.it.jsp.MyServletContextListener</listener-class>
        </listener>
</body>
</html>
