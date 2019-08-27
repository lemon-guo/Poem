package a;
import java.sql.*;

public class Cainiao {
    static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
    static final String DB_URL = "jdbc:mysql://localhost:3306/poem?useSSL=false&useUnicode=true&characterEncoding=UTF-8";
    static final String USER = "root";
    static final String PASS = "d030903.";
    static String cname ;
    static String time;
    static String[] con= {"-1","-1","-1","-1","-1"};
    public static void get() {
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
    }
	    public void put(String s) {
    	 Connection conn = null;
         Statement stm = null;
         try{
             // 注册 JDBC 驱动
             Class.forName(JDBC_DRIVER);// 打开链接
             conn = DriverManager.getConnection(DB_URL,USER,PASS);// 执行查询
             stm = conn.createStatement();
             String sql;
             sql = "INSERT INTO `Works` VALUES ('"+s+"')";      
             stm.executeUpdate(sql);            
             stm.close();
             conn.close();
         }catch(SQLException se){                  // 处理 JDBC 错误
             se.printStackTrace();
         }catch(Exception e){                      // 处理 Class.forName 错误
             e.printStackTrace();                  // 关闭资源
             try{
                 if(stm!=null) stm.close();
             }catch(SQLException se2){
             }// 什么都不做
             try{
                 if(conn!=null) conn.close();
             }catch(SQLException se){
                 se.printStackTrace();
             }
         }
    }
	    public String[] getcon() {
	    	return con;
	    }
}

