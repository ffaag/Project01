<%@ page import="com.it.jsp.Student" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: 1
  Date: 2021/4/17
  Time: 14:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <% List<Student> studentList = (List<Student>) request.getAttribute("stuList");  %>

    1、EL 表达式
    <%
        request.setAttribute("key","值");
    %>
    表达式脚本输出key 的值是：
    <%=request.getAttribute("key1")==null?"":request.getAttribute("key1")%><br/>
    EL 表达式输出key 的值是：${key1}
    EL 表达式的格式是：${表达式}
    EL 表达式在输出null 值的时候，输出的是空串。jsp 表达式脚本输出null 值的时候，输出的是null 字符串。

    2、EL 表达式主要是在jsp 页面中输出数据。
    主要是输出域对象中的数据。
    当四个域中都有相同的key的数据的时候，EL表达式会按照四个域的从小到大的顺序去进行搜索，找到就输出。

    3、EL 表达式输出Bean 的普通属性，数组属性。List 集合属性，map 集合属性
    这里的p是java代码中pageContext.setAttribute("p", person);
    输出Person：${ p }<br/>
    输出Person 的name 属性：${p.name} <br>
    输出Person 的pnones 数组属性值：${p.phones[2]} <br>
    输出Person 的cities 集合中的元素值：${p.cities} <br>
    输出Person 的List 集合中个别元素值：${p.cities[2]} <br>
    输出Person 的Map 集合: ${p.map} <br>
    输出Person 的Map 集合中某个key 的值: ${p.map.key3} <br>
    输出Person 的age 属性：${p.age} <br>
    要注意的是一定在javaBean类中要有set/get方法

    4、EL 表达式——运算
    语法：${ 运算表达式} ， EL 表达式支持如下运算符  ${ 5 == 5 }
    1）关系运算
    2）逻辑运算
    3）算数运算
    i. empty 运算
    empty 运算可以判断一个数据是否为空，如果为空，则输出true,不为空输出false。 以下几种情况为空：
    1、值为null 值的时候，为空
    2、值为空串的时候，为空
    3、值是Object 类型数组，长度为零的时候
    4、list 集合，元素个数为零
    5、map 集合，元素个数为零
    如：${ empty emptyNull } <br/>  这里emptyNull是setAttribute的关键字
    ii. 三元运算
    表达式1？表达式2：表达式3
    如果表达式1 的值为真，返回表达式2 的值，如果表达式1 的值为假，返回表达式3 的值。
    如${ 12 != 12 ? "国哥帅呆":"国哥又骗人啦" }
    iii. “.”点运算和[] 中括号运算符
    .点运算，可以输出Bean 对象中某个属性的值。
    []中括号运算，可以输出有序集合中某个元素的值。
    并且[]中括号运算，还可以输出map 集合中key 里含有特殊字符的key 的值。中括号里面要引起来

    5、EL 表达式的11 个隐含对象
</body>
</html>
