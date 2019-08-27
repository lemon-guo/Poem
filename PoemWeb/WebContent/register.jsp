<%@ page language="java" contentType="text/html; charset=gb2312"
    pageEncoding="utf-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>register</title>
<link href="css/style.css" rel="stylesheet" type="text/css">
<style type="text/css"> 
p{  color:#1A1A1C;
	font-size: 16px;
} 
</style> 
</head>

<body>
	<header>
    <ul>
      <li class="banner">诗与远方</li>
      <li class="search"><form><input type="search" placeholder="请输入关键词..."></form></li>
    </ul>
    <nav>
      <ul>
        <li><a href="index.html">首页</a></li>
		<li><a href="index.html">藏诗苑</a></li>
        <li><a href="index.html">斗诗台</a></li>
        <li><a href="index.html">观影阁</a></li>
		<li>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; </li>
		<li><a href="register.html" style="color: #090505">登录/</a></li>
        <li><a href="register.html" style="color: #090505">注销</a></li>
      </ul>
    </nav>
  </header>
<div class="container">
	<ul style=" border-radius: 20px;background-color:#FBFDFC;position: absolute; width: 20%;height: 350px;padding-left: 80px; margin-top:100px;margin-left: 450px;">
		<h2>注册</h2>
		<form id ="registerForm" name="registerForm" action="seccessregister.jsp">
        <p>*&nbsp; 用户名: <br>
          <input type="text" name="username" style="height: 25px;">&nbsp; *仅限英文字母
        </p>
        <p>*&nbsp; 密码:<br>
          <input type="password" name="password" style="height: 25px;">&nbsp; *仅限六位数
        </p>
		<p>*&nbsp; 请再次确认密码:<br>
		  <input type="password" name="password1" style="height: 25px;">&nbsp; *再填一次密码
        </p>
		<br>
        <!-- <button style="position: relative;margin-left: 100px;" >注册</button> -->
        <input value="注册" type ="submit"/>
        </form>
	</ul>
	
</div>
	<footer style="float:left;text-align: inherit">website &copy; 2019 the nine team</footer>
</body>
</html>
