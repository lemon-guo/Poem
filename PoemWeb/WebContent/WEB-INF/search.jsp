<%@ page language="java" contentType="text/html; charset=gb2312"
    pageEncoding="utf-8" import="java.sql.*"  import="java.util.*" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>search</title>
<link href="css/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/jquery.min.js"></script>
</head>
<body>
   <header>
    <ul>
      <li class="banner">诗与远方</li>
      <form id="searchform" name="searchform" action="searchs.jsp">
        <input type="search" name="poemnamed" placeholder="请输入关键词...">
    </form>
    </ul>
	<nav>
      <ul>
        <li ><a href="index.jsp">首页</a></li>
		<li class="active"><a href="search.jsp">藏诗苑</a></li>
        <li><a href="discussion.jsp">斗诗台</a></li>
        <li><a href="video.jsp">观影阁</a></li>
		<li>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; </li>
		<li class="active"><a href="logon.jsp" style="color: #090505">登录/</a></li>
        <li><a href="logon.jsp" style="color: #090505">注销</a></li>
      </ul>
    </nav>
   </header>
 
<div class="container">
 <aside>
    <h2>诗人列表</h2>
    <ul>
      <li class="active"><a href="#">李清照</a></li>
      <li><a href="#">纳兰性德</a></li>
      <li><a href="#">李白</a></li>
      <li><a href="#">岳飞</a></li>
      <li><a href="#">苏轼</a></li>
      <li><a href="#">苏辙</a></li>
      <li><a href="#">苏洵</a></li>
    </ul>
  </aside>	
	
  <section>
    <article>
      <h3><a>《一剪梅》</a></h3>
      <p>红藕香残玉潭秋，轻解罗裳，独上兰舟。<br>云中谁寄锦书来？雁字回时，月满西楼。<br>花自飘零水自流，一种相思，两处闲愁。<br>此情无计可消除，才下眉头，却上心头。</p>
		<a href="details.jsp">[ 查看详情 ]</a>
    </article>
		
	<article>	
      <h3><a>《声声慢》</a></h3>
      <p>寻寻觅觅，冷冷清清，凄凄惨惨戚戚。<br>乍暖还寒时候，最难将息。<br>三杯两盏淡酒，怎敌他、晚来风急？<br>雁过也，正伤心，却是旧时相识。<br>满地黄花堆积。憔悴损，如今有谁堪摘？<br>守著窗儿，独自怎生得黑？<br>梧桐更兼细雨，到黄昏、点点滴滴。<br>这次第，怎一个、愁字了得！</p>
		<a href="details.jsp">[ 查看详情 ]</a>
   </article>
	  
  </section>
</div>
<footer style="float:left;text-align: inherit">website &copy; 2019 the nine team</footer>
</body>
</html>