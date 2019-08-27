package a;

import java.sql.Date;

public class Comment {
	    String Cname="匿名";          //发表人
	    Date Ctime;            //发表时间
	    String Ccontent[]= {"-1"};//评论内容
	    static int i=0;//累计评论数
	    public String get_Ccontent(int j) {   //得到评论内容
	    	return Ccontent[j];
	    }
	    public int geti() {                   //得到评论数
	    	return i;
	    }
	    public void Publish(String b) {       //发表评论	    	
	    	this.Ccontent[i]=new String(b);	    	
	    	i++;
	    }
	    public void Delete(String b,int j) {   //删除评论       
	    	this.Ccontent[i]="-1";
	    }

}
