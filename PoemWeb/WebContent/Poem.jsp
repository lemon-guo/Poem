<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="a.*"%>
<%@ page import="java.sql.*"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>poem</title>
<link href="css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
 <%
		Works ye=new Works();
  	    final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";  
        final String DB_URL = "jdbc:mysql://localhost:3306/poem?useSSL=false&serverTimezone=UTC&&allowPublicKeyRetrieval=true";
        final String USER = "root";
        final String PASS = "980722gwy";
         String con[]= {"-1","-1","-1","-1","-1"};
         Connection conn = null;
         Statement stmt = null;
         try{
             // 注册 JDBC 驱动
             Class.forName(JDBC_DRIVER);// 打开链接
             conn = DriverManager.getConnection(DB_URL,USER,PASS);// 执行查询
             stmt = conn.createStatement();
             String sql;
             int i=0;
             sql = "SELECT Content FROM Works";
             ResultSet rs = stmt.executeQuery(sql);// 展开结果集数据库
             while(rs.next()){                     // 通过字段检索
                 con[i] = rs.getString("Content");
                 i++;
             }                                     // 完成后关闭
             rs.close();   
             stmt.close();
             conn.close();
         }catch(SQLException se){                  // 处理 JDBC 错误
             se.printStackTrace();
         }catch(Exception e){                      // 处理 Class.forName 错误
             e.printStackTrace();                  // 关闭资源
             try{
                 if(stmt!=null) stmt.close();
             }catch(SQLException se2){
             }// 什么都不做
             try{
                 if(conn!=null) conn.close();
             }catch(SQLException se){
                 se.printStackTrace();
             }
         }
         %>
	<header>
    <ul>
      <li class="banner">诗与远方</li>
      <li class="search"><form><input type="search" placeholder="请输入关键词..."></form></li>
    </ul>
    <nav>
      <ul>
        <li ><a href="index.jsp">首页</a></li>
		<li><a href="search.jsp">藏诗苑</a></li>
        <li class="active"><a href="discussion.jsp">斗诗台</a></li>
        <li><a href="video.jsp">观影阁</a></li>
		<li>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; </li>
		<li class="active"><a href="logon.html" style="color: #090505">登录/</a></li>
        <li><a href="logon.jsp" style="color: #090505">注销</a></li>
      </ul>
    </nav>
  </header>
<div class="container">
  <aside>
	   <style>
		  .ui
		  {
			  margin-top: 30px;
			  text-align: center; 
			  font-size: 20px;
		  }
		  textarea
		  {
			 margin-top: 100px;
			margin-left: 110px;
			border-radius: 0px;
		  }
		    ul
		  {
			  margin-top: 2px;
		  }
		  nav ul>li c
		  {
			  font-size: 20px;
			  margin-left:-10px；
		  }
		   
		   </style>
    <h2>最新作品发布</h2>
    <ul>
      <li><a href="#">春雨</a></li>
      <li><a href="#"> 燕子</a></li>
      <li><a href="#">七绝·梅</a></li>
      <li><a href="#">远方</a></li>
      <li><a href="#">古风</a></li>
      <li><a href="#">村口</a></li>
      <li><a href="#">初夏农家</a></li>
      <li><a href="#">乡村四月</a></li>
      <li><a href="#">在水一方</a></li>
    </ul>
  </aside>
	<section>
	  	<%
	  	int i=ye.getti()-1;
	    String str=ye.biaoti(con[i]);
	    String[] ss=ye.body(con[i]);
        %>
     <article>
        <h3><a href="#"><%=str%></a></h3>
       <p class="ui">
<%=ss[2]%><br>
<%=ss[3]%><br>
<%=ss[4]%><br>
<%=ss[5]%><br>
		</p>
   </article>
		<br>
   <img src="images/s7.jpg" width="20" height="20" /><a> 喜欢</a>
   <img src="images/s8.jpg" width="20" height="20" /><a> 收藏</a><br><br>

		<a>评论区:</a>
		<br>
   <input type="text" name="text" placeholder="输入你的评论内容···" size="50" style="height:80px;" > 
<script type="text/javascript">
function diag()
{  
    alert("发表成功！");
    window.location="Poem.jsp";
    window.event.returnValue=false;
}
</script>
<input type="submit" value="发表" name="submit" onclick="diag()"> <br><br>
		<a>评论列表:</a>
		<p >

		</p>
 </section>  
</div>
	
	
	<footer style="float:none;text-align:"> website &copy; 2019 the nine team</footer>
</body>
</html>

 
