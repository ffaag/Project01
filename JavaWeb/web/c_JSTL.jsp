<%--
  Created by IntelliJ IDEA.
  User: 1
  Date: 2021/4/21
  Time: 14:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    EL 表达式主要是为了替换jsp 中的表达式脚本，而标签库则是为了替换代码脚本。这样使得整个jsp 页面
    变得更佳简洁。
    JSTL 由五个不同功能的标签库组成。
    功能范围URI 前缀
    核心标签库--重点http://java.sun.com/jsp/jstl/core       c
    格式化     http://java.sun.com/jsp/jstl/fmt            fmt
    函数       http://java.sun.com/jsp/jstl/functions      fn
    在jsp 标签库中使用taglib 指令引入标签库
    CORE 标签库
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    FUNCTIONS 标签库
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    FMT 标签库
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

    <%--
    i.<c:set />
    作用：set 标签可以往域中保存数据
    域对象.setAttribute(key,value);
    scope 属性设置保存到哪个域
    page 表示PageContext 域（默认值）
    request 表示Request 域
    session 表示Session 域
    application 表示ServletContext 域
    var 属性设置key 是多少
    value 属性设置值
    --%>
    保存之前：${ sessionScope.abc } <br>
    <c:set scope="session" var="abc" value="abcValue"/>
    保存之后：${ sessionScope.abc } <br>

    <%--
    ii.<c:if />
    if 标签用来做if 判断。
    test 属性表示判断的条件（使用EL 表达式输出）
    --%>
    <c:if test="${ 12 == 12 }">
        <h1>12 等于12</h1>
    </c:if>
    <c:if test="${ 12 != 12 }">
        <h1>12 不等于12</h1>
    </c:if>

    <%--
    iii.<c:choose> <c:when> <c:otherwise>标签
    作用：多路判断。跟switch ... case .... default 非常接近
    choose 标签开始选择判断
    when 标签表示每一种判断情况
    test 属性表示当前这种判断情况的值
    otherwise 标签表示剩下的情况
    <c:choose> <c:when> <c:otherwise>标签使用时需要注意的点：
    1、标签里不能使用html 注释，要使用jsp 注释
    2、when 标签的父标签一定要是choose 标签
    --%>

    <%--1.遍历1 到10，输出
    begin 属性设置开始的索引
    end 属性设置结束的索引
    var 属性表示循环的变量(也是当前正在遍历到的数据)
    for (int i = 1; i < 10; i++)
    <c:forEach begin="1" end="10" var="i">
--%>
    <%-- 2.遍历Object 数组
    for (Object item: arr)
    items 表示遍历的数据源（遍历的集合）
    var 表示当前遍历到的数据
    <c:forEach items="${ requestScope.arr }" var="item">
--%>
    3. 遍历Map 集合
    <c:forEach items="${ requestScope.map }" var="entry">
        <h1>${entry.key} = ${entry.value}</h1>
    </c:forEach>
    4. 遍历List 集合
    <%--
    items 表示遍历的集合
    var 表示遍历到的数据
    begin 表示遍历的开始索引值
    end 表示结束的索引值
    step 属性表示遍历的步长值
    varStatus 属性表示当前遍历到的数据的状态
--%>
    <c:forEach begin="2" end="7" step="2" varStatus="status" items="${requestScope.stus}" var="stu">
</body>
</html>
