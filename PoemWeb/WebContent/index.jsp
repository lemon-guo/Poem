<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>index</title>
<link href="css/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/jquery.min.js"></script>
</head>
	
<body>
  <header>
    <ul>
      <li class="banner">诗与远方</li>
      <form id="indexform" name="indexform" action="searchs.jsp">
       <input type="search" name="poemnamed" placeholder="请输入关键词...">
       </form>
    </ul>
    <nav>
      <ul>
        <li class="active"><a href="index.jsp">首页</a></li>
		<li><a href="searchs.jsp">藏诗苑</a></li>
        <li><a href="discussion.jsp">斗诗台</a></li>
        <li><a href="video.jsp">观影阁</a></li>
		<li>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; </li>
		<li class="active"><a href="logon.jsp" style="color: #090505">登录/</a></li>
        <li><a href="logon.jsp" style="color: #090505">注销</a></li>
      </ul>
    </nav>
  </header>
<div class="container" style="background-color: #DAE4E1;">
  <aside style="background-color: #F3F4F3">
	  <h2>个人中心</h2>
	 <img src="images/07.jpg" width="100" height="100" >
    <p style="align-content: center;font-size: 20px;">账号</p>
    <ul style="border-color: #0D0C0C">
      <li><a href="#">修改资料</a></li>
      <li><a href="#">我的作品</a></li>
      <li><a href="#">我的收藏</a></li>
	  <li><a href="logon.jsp">退出登录</a></li>
    </ul>
  </aside>
</div>
  <!--<section style="background-image::url(images/lion.jpg);background-position:100px 160px">-->
	<div class="container" >
	<section>
	  <h3>诗歌推荐</h3>
		<hr>
    <article style="position: relative;margin-left:300px;">
      <h3><a href="#">一剪梅</a></h3>
        <p>我有万古宅，嵩阳玉女峰。</p>
		<p>长留一片月，挂在东溪松。</p>
		<p>尔去掇仙草，菖蒲花紫茸。</p>
		<p>岁晚或相访，青天骑白龙。</p>
      <a href="1.html">[ 查看全文 ]</a>
    </article>
		<hr>
     <article style="position: relative;margin-left:300px;">
        <h3><a href="#">黄葛篇</a></h3>
		 <p>黄葛生洛溪，黄花自绵幂。</p>
         <p>青烟蔓长条，缭绕几百尺。</p>
		 <p>闺人费素手，采缉作絺绤。</p>
		 <p>缝为绝国衣，远寄日南客。</p>
		<a href="2.html">[ 查看全文 ]</a>
    </article>
  </section>
	</div>
<footer style="float:left;text-align: inherit">website &copy; 2019 the nine team</footer>
</body>
</html>
