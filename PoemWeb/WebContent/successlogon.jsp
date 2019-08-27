<%@ page language="java" contentType="text/html; charset=gb2312"
    pageEncoding="utf-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>判断用户是否登录成功</title>
</head>
<body>
<%
    Connection conn=null;
    final String User=request.getParameter("username");//取得用户名User
    final String Pwd=request.getParameter("password");//取得密码Pwd
    final String uri="jdbc:mysql://localhost:3306/poem?useSSL=false&serverTimezone=UTC&&allowPublicKeyRetrieval=true";
    //加载JDBC驱动
    try{
    	Statement stmt = null;
    	//加载注册驱动程序
    	Class.forName("com.mysql.cj.jdbc.Driver");
    	//注册URL取得对数据库的连接 获取连接对象
    	conn=DriverManager.getConnection(uri,"root","980722gwy");
        
        //查找相应的密码，用户类型
        String sql="select userpassword from users where username='"+User+"'";
        
        //创建Statement实例，并执行SQL语句
        stmt=conn.createStatement();
        ResultSet rs=stmt.executeQuery(sql);//执行select语句
        if(rs.next())//判断该用户是否已经注册过
        {
        	if(Pwd.equals(rs.getString("userpassword"))){//如果密码相匹配
        		//String usertype1=rs.getString("usertype");
        		//获取客户端的IP地址
        		//String lastIP=request.getRemoteAddr();
        		//java.text.SimpleDateFormat sdf=new java.text.SimpleDateFormat("yyyy/MM/dd hh:mm:ss");
        		//java.util.Date now=new java.util.Date();//获取当前登录时间
        		
        		//如果用户匹配，则更新用户表对应的用户IP信息、登录时间
        		//String sql1="update 'poem'.'users' set lastIP='"+lastIP+"',userstatus='1',lastLogon='"+sdf.format(now)+"'where username=User";
        		//stmt.executeUpdate(sql1);//执行update语句
        		
        		//session.setAttribute("usertype",usertype1);//设置session属性usertype为用户类型
        		session.setAttribute("login",User);//设置session属性login为用户名
        		
        		//登录验证通过，跳转到首页
        		response.sendRedirect("index.jsp");
        	}
        	else{
        		out.println("<script LANGUAGE='javascript'> alert('密码错误，登录失败');history.go(-1);</script>");
        	}
        }
        else
        {
        	out.println("<script LANGUAGE='javascript'> alert('用户名错误，登录失败');history.go(-1);</script>");
        }
        //关闭连接
        rs.close();
        conn.close();  
    }catch(SQLException se){                  // 处理 JDBC 错误
        se.printStackTrace();
    }catch(Exception e){                      // 处理 Class.forName 错误
        e.printStackTrace(); }
%>
</body>
</html>