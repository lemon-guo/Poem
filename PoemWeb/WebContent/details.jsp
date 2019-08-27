<%@ page language="java" contentType="text/html; charset=gb2312"
    pageEncoding="utf-8" import="java.sql.*"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>details</title>
<link href="css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
   <header>
    <ul>
      <li class="banner">诗与远方</li>
        <a href="search.jsp"><input type="search" placeholder="请输入关键词..."></a>
    </ul>
	<nav>
      <ul>
        <li ><a href="index.html">首页</a></li>
		<li class="active"><a href="searchs.jsp">藏诗苑</a></li>
        <li><a href="discussion.jsp">斗诗台</a></li>
        <li><a href="video.jsp">观影阁</a></li>
		<li>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; </li>
		<li class="active"><a href="logon.jsp" style="color: #090505">登录/</a></li>
        <li><a href="logon.jsp" style="color: #090505">注销</a></li>
      </ul>
    </nav>
   </header> 
<%

  try{
		String url = "jdbc:mysql://localhost:3306/poem?serverTimezone=UTC&useUnicode = true&characterEncoding = utf-8&useSSL = false";
	    String user ="root";//替换成你自已的数据库用户名
	    String password = "980722gwy";//这里替换成你自已的数据库用户密码
	   // String poemname1=request.getParameter("poemnamed");
	    String sqlStr = "select * from mypoem ";
	    
	        Class.forName("com.mysql.cj.jdbc.Driver");
	     //   out.println( "加载驱动成功!" );
	      
           
	        Connection con = DriverManager.getConnection(url, user, password);
	   //    out.println( "连接数据库成功!" );

	        Statement st = con.createStatement();
	    //    out.println( "创建Statement成功!" );
           
	        //查询数据
	        ResultSet rs = st.executeQuery( sqlStr );
	       // out.println( "查询数据操作成功!" );
	   //     out.println( "----------------!" );
    
	while(rs.next())
	        {
	        	%>
	        	<div class="container">
	      <aside style="background-color: #F3F4F3">
	  <h2>诗人简介</h2>
      <h3><a><%out.println(rs.getString("poemwriter")); %></a></h3>
    </ul>
  </aside>
	            <section>
	            <article>
                <h3><a><%out.println(rs.getString("poemname")); %></a></h3>
                <p><% out.println(rs.getString("poemcontent"));%></p>
                <a href="#">译文</a></h3>
               <p><% out.println(rs.getString("poemtranslation")); %></p>
               <a href="#">赏析</a></h3>
               <p><% out.println(rs.getString("poemappreciation")); %></p>
                </article>
                </section>
                
                </div>
	<%       
	
	        }%>
<script type="text/javascript">
function diag()
   {
	alert("检索失败");
	window.location="search.jsp";
	window.event.returnValue=false;
	}
	</script>
<%
	   if(!rs.next()) 
	  {
		  // diag();
	       %>
	    <section>
		<article>
	     <p><%out.println(rs.getString("SHIBAI"));%>
		  </p>  
	    </article>
		  
	  </section>
	        	
	 <%        	 }
	        rs.close();
	        st.close();
	        con.close();

  }catch(Exception e){e.printStackTrace();}
%>


<footer style="float:left;text-align: inherit">website &copy; 2019 the nine team</footer>
</body>
</html>