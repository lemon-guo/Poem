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
            // ע�� JDBC ����
            Class.forName(JDBC_DRIVER);// ������
            conn = DriverManager.getConnection(DB_URL,USER,PASS);// ִ�в�ѯ
            stmt = conn.createStatement();
            String sql;
            int i=0;
            sql = "SELECT Content FROM Works";
            ResultSet rs = stmt.executeQuery(sql);// չ����������ݿ�
            while(rs.next()){                     // ͨ���ֶμ���
                con[i] = rs.getString("Content");
                i++;
            }                                     // ��ɺ�ر�
            rs.close();   
            stmt.close();
            conn.close();
        }catch(SQLException se){                  // ���� JDBC ����
            se.printStackTrace();
        }catch(Exception e){                      // ���� Class.forName ����
            e.printStackTrace();                  // �ر���Դ
            try{
                if(stmt!=null) stmt.close();
            }catch(SQLException se2){
            }// ʲô������
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
             // ע�� JDBC ����
             Class.forName(JDBC_DRIVER);// ������
             conn = DriverManager.getConnection(DB_URL,USER,PASS);// ִ�в�ѯ
             stm = conn.createStatement();
             String sql;
             sql = "INSERT INTO `Works` VALUES ('"+s+"')";      
             stm.executeUpdate(sql);            
             stm.close();
             conn.close();
         }catch(SQLException se){                  // ���� JDBC ����
             se.printStackTrace();
         }catch(Exception e){                      // ���� Class.forName ����
             e.printStackTrace();                  // �ر���Դ
             try{
                 if(stm!=null) stm.close();
             }catch(SQLException se2){
             }// ʲô������
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

