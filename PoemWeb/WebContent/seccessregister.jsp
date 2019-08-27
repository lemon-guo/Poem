<%@ page language="java" contentType="text/html; charset=gb2312"
    pageEncoding="utf-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>判断用户是否注册成功</title>
</head>
<body>
<%      Connection con=null;
		
		final String uri="jdbc:mysql://localhost:3306/poem?useSSL=false&serverTimezone=UTC&&allowPublicKeyRetrieval=true";
		
		final String User =request.getParameter("username");//得到注册的用户名
		final String Pwd =request.getParameter("password");//得到注册密码
		final String Pwd1=request.getParameter("password1");//得到再次确认的注册密码 
		//判断用户名长度是否符合规定，超过则注册失败，重新输入
		try{if(User.length()>20){
			out.println("<script LANGUAGE='javascript'> alert('用户名过长，请重新输入！');history.go(-1);</script>");
			con.close();
		}
		//判断密码长度是否符合规定，超过则注册失败，重新输入
		else if(Pwd.length()>6){
			out.println("<script LANGUAGE='javascript'> alert('密码过长，请重新输入！');history.go(-1);</script>");
			con.close();
		}
		//再判断密码和再次确认的密码是否一致,如果不一致，重新输入
		else if(Pwd1.compareTo(Pwd)==0){
			out.println("<script LANGUAGE='javascript'> alert('密码前后不一致，请重新输入！');history.go(-1);</script>");
			con.close();  
		}}catch(Exception e){                      // 处理 Class.forName 错误
            e.printStackTrace();                  // 关闭资源
        }
		//长度满足，密码相符，继续执行
	try{
		Statement stmt = null;
		//加载JDBC驱动
		Class.forName("com.mysql.cj.jdbc.Driver");
		con=DriverManager.getConnection(uri,"root","980722gwy");
		//在数据库中查找，判断该用户名是否已被注册
		stmt=con.createStatement();
		ResultSet rs=stmt.executeQuery("select username from users");
		//判断该用户是否存在
			int flag=0;
			while(rs.next()){
				if(User==rs.getString("username"))
				{
					flag=1;
					break;
				}
			}
			//获取客户端的IP地址
			if(flag==0){
			String lastIP=request.getRemoteAddr();
			//java.text.SimpleDateFormat sdf=new java.text.SimpleDateFormat("yyyy/MM/dd hh:mm:ss");
			//java.util.Date now=new java.util.Date();//获取当前登录时间
			//将该注册用户的信息写到用户信息表中
			String sql1="insert into users values ('" +User+"','"+Pwd+"','普通用户','"+lastIP+"','1')";
			//String sql1="insert into users values('端木磊','123123')";
	    	stmt.executeUpdate(sql1);//执行update语句
			session.setAttribute("login",User);//设置session属性login为用户名
	    	
			//登录验证通过，跳转到首页
			response.sendRedirect("index.jsp");
			
		}
		else//该用户名已被使用
		{
			out.println("<script LANGUAGE='javascript'> alert('该用户名已被注册，请换一个！');history.go(-1);</script>");
		}
		//关闭连接
	    rs.close();
	    con.close();  }catch(SQLException se){                  // 处理 JDBC 错误
            se.printStackTrace();
        }catch(Exception e){                      // 处理 Class.forName 错误
            e.printStackTrace();                  // 关闭资源
        }
%>
</body>
</html>