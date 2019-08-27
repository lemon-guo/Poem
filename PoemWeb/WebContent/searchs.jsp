<%@ page language="java" contentType="text/html; charset=gb2312"
    pageEncoding="utf-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="uft-8">
<title>searchs</title>
<link href="css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
   <header>
    <ul>
      <li class="banner">诗与远方</li>
      <!--  <input type="search"  name="poemnamed" placeholder="请输入关键词..."></a> -->
    </ul>
    <%request.setCharacterEncoding("utf-8");
     final String poemname1=request.getParameter("poemnamed");
    %>
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
   
<%

  try{
	  
		String url = "jdbc:mysql://localhost:3306/poem?serverTimezone=UTC&useUnicode = true&characterEncoding = utf-8&useSSL = false";
	    String user ="root";//替换成你自已的数据库用户名
	    String password = "980722gwy";//这里替换成你自已的数据库用户密码
	   // String poemname1=request.getParameter("poemnamed");
	    String sqlStr = "select * from mypoem where poemname='"+poemname1+"'";
	    
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
                <h3><a><%out.println(rs.getString("poemname")); %></a></h3>
                <p><% out.println(rs.getString("poemcontent"));%></p>
                <a href="details.jsp">[ 查看详情 ]</a>
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
		   %>
	       <div class="container">
	       <aside>
               <h2>诗人列表</h2>
               <ul>
               <li class="active"><a href="#">李清照</a><>
               <li><a href="#">纳兰性德</a><>
               <li><a href="#">李白</a><>
               <li><a href="#">岳飞</a><>
               <li><a href="#">苏轼</a><>
               <li><a href="#">苏辙</a><>
               <li><a href="#">苏洵</a><>
               </ul>
               </aside>	
	            <section>
	            
                <a><% out.println("这首古诗还没有收录！");%></a>
               
                </section>
                
	        	    </div>
  	<%  }
	        rs.close();
	        st.close();
	        con.close();

  }catch(Exception e){e.printStackTrace();}
%>

</body>
</html></span><span style="font-size:24px;color: rgb(255, 0, 0);">
</span></span>






</body>
</html>