package a;

public class Works extends Comment{
	Cainiao conn;
	static int i=2;//累计作品数量
	static int number_of_likes=0;
/*	 public String get_Content(String s) {
		 String[] ss = null;
		 int  j=0;
		 String[] c=conn.get();              //查找作品内容
		 for(;j<c.length;j++) {
		    ss=c[j].split("\\s+");
			 if(ss[0].equals(s)==true);	
		        return c[j];
		  }
	     return c[j]; 
	    }*/
	public void init() {
		i=2;
	}
	    public int getti() {                   //得到评论数
	    	return i;
	    }
	 public void Publish(String b) {           //发表作品	    	
		 conn=new Cainiao();
		 conn.put(b);    	
	     i++;
	    }
	public  String biaoti(String a) {          //将标题与诗的内容分离，返回
    	String[] s = null;
    	s=a.split("\\s+");
    	return s[0]+"     --"+s[1];
    }
    public String[] body(String a) {           //将诗的主体部分与标题分离
    	String[] s = null;
    	s=a.split("\\s+");
    	return s;
    }
}
