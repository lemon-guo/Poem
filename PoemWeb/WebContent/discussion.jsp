<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ page import="a.*"%>
<%@ page import="java.sql.*"%>

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>discussion</title>
<link href="css/style.css" rel="stylesheet" type="text/css">
</head>
 
<body>
 <header>
    <ul>
      <li class="banner">诗与远方</li>
      <li class="search"><form><input type="search" placeholder="请输入关键词..."></form></li>
    </ul>
    <nav>
      <ul>
         <li><a href="index.jsp">首页</a></li>
		<li><a href="searchs.jsp">藏诗苑</a></li>
        <li class="active"><a href="discussion.jsp">斗诗台</a></li>
        <li><a href="video.jsp">观影阁</a></li>
		<li>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; </li>
		<li ><a href="logon.jsp" style="color: #090505">登录/</a></li>
        <li><a href="logon.jsp" style="color: #090505">注销</a></li>
      </ul>
    </nav>
  </header>
<div class="container">
  <aside>
	  <style>
		  .ui
		  {
			  text-align: center;  
		  } 
		 textarea
		  {
			margin-top: 5px;
			margin-left: 110px;
			border-radius: 5px;
		  }		  
		  section input
		  {
			  position:absolute;
			  margin-top:160px;
			  margin-left:20px;
			  color:#FFFFFF;
			  width: 60px;
			  height: 35px;
			  border-color:dark;
			  background: #7C8383; 
		  }
		  b
		  {
			  color:dimgrey;
			  float: right;
		  }	 	
		  ul
		  {
			  margin-top: 2px;
		  }
		  nav ul>li c
		  {
			  font-size: 25px;
			  margin-left:-30px;
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
		Works ye=new Works();
  	   Cainiao yee=new Cainiao();
  	    final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";  
        final String DB_URL = "jdbc:mysql://localhost:3306/poem?useSSL=false&serverTimezone=UTC&&allowPublicKeyRetrieval=true";
        final String USER = "root";
        final String PASS = "980722gwy";
      String cname ;
     String time;
     String con[]= {"-1","-1"};
         Connection conn = null;
         Statement stmt = null;
         int i=0;
         try{
             // 注册 JDBC 驱动
             Class.forName(JDBC_DRIVER);// 打开链接
             conn = DriverManager.getConnection(DB_URL,USER,PASS);// 执行查询
             stmt = conn.createStatement();
             String sql;
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
	  <nav> 
      <ul>
		  <li><c>作品发布</c></li>
	
      </ul>
    </nav>
      <form action="discussion.jsp" method = "post">
		<textarea rows="10" cols="80" name = "content" placeholder="输入你的作品···"></textarea>
		<input type = "submit" value="submit" onclick="diag()"/>
	</form>
<script type="text/javascript">
<% 
request.setCharacterEncoding("utf-8");
final String content = request.getParameter("content");
out.print(content);
Cainiao co=new Cainiao();
	  if(content!=null){
	  co.put(content); 
	  co.get();
	  con=co.getcon();
	 // ye.Publish();
	  }
	//ye.init();
 // int i=ye.getti()-1;
  String str=ye.biaoti(con[i-1]);
  String[] ss=ye.body(con[i-1]);
  String str1=ye.biaoti(con[i-2]);
  String[] ss1=ye.body(con[i-2]);
%>
function diag() 
{  
    alert("发表成功！");
    window.location="discussion.jsp";
    window.event.returnValue=false;
} 
</script>
    <article>
       <h3><a href="#"><%=str%></a></h3>
<p class="ui">
<%=ss[2] %><br>
<%=ss[3] %><br>
<%=ss[4] %><br>
<%=ss[5] %><br>
</p>
		<a href="Poem.jsp">[ 查看全文 ]</a>
		<textarea1 rows="2" cols="40"> </textarea1>
    </article>
     <article>
	<br>
        <h3><a href="#"><%=str1%> </a></h3>
<p class="ui">
<%=ss1[2] %><br>
<%=ss1[3] %><br>
<%=ss1[4] %><br>
<%=ss1[5] %><br>
</p>
	 	<a href="Poem2.jsp">[ 查看全文 ]</a>
		<textarea1 rows="2" cols="40"> </textarea1>
   </article>
  </section>
</div>
	<footer style="float:left;text-align: inherit">website &copy; 2019 the nine team</footer>
</body>
</html>
