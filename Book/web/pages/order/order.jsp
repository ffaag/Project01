<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>我的订单</title>
<link type="text/css" rel="stylesheet" href="http://localhost:8080/Book/static/css/style.css" >
<style type="text/css">
	h1 {
		text-align: center;
		margin-top: 200px;
	}
</style>
</head>
<body>
	
	<div id="header">
			<img class="logo_img" alt="" src="http://localhost:8080/Book/static/img/logo.gif" >
			<span class="wel_word">我的订单</span>
			<div>
				<span>欢迎<span class="um_span">韩总</span>光临尚硅谷书城</span>
				<a href="http://localhost:8080/Book/pages/order/order.html">我的订单</a>
				<a href="http://localhost:8080/Book/index.html">注销</a>&nbsp;&nbsp;
				<a href="http://localhost:8080/Book/index.html">返回</a>
			</div>
	</div>
	
	<div id="main">
		
		<table>
			<tr>
				<td>日期</td>
				<td>金额</td>
				<td>状态</td>
				<td>详情</td>
			</tr>		
			<tr>
				<td>2015.04.23</td>
				<td>90.00</td>
				<td>未发货</td>
				<td><a href="#">查看详情</a></td>
			</tr>	
			
			<tr>
				<td>2015.04.20</td>
				<td>20.00</td>
				<td>已发货</td>
				<td><a href="#">查看详情</a></td>
			</tr>	
			
			<tr>
				<td>2014.01.23</td>
				<td>190.00</td>
				<td>已完成</td>
				<td><a href="#">查看详情</a></td>
			</tr>		
		</table>
		
	
	</div>
	
	<div id="bottom">
		<span>
			尚硅谷书城.Copyright &copy;2021
		</span>
	</div>
</body>
</html>