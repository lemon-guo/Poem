package a;

public class Works extends Comment{
	Cainiao conn;
	static int i=2;//�ۼ���Ʒ����
	static int number_of_likes=0;
/*	 public String get_Content(String s) {
		 String[] ss = null;
		 int  j=0;
		 String[] c=conn.get();              //������Ʒ����
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
	    public int getti() {                   //�õ�������
	    	return i;
	    }
	 public void Publish(String b) {           //������Ʒ	    	
		 conn=new Cainiao();
		 conn.put(b);    	
	     i++;
	    }
	public  String biaoti(String a) {          //��������ʫ�����ݷ��룬����
    	String[] s = null;
    	s=a.split("\\s+");
    	return s[0]+"     --"+s[1];
    }
    public String[] body(String a) {           //��ʫ�����岿����������
    	String[] s = null;
    	s=a.split("\\s+");
    	return s;
    }
}
