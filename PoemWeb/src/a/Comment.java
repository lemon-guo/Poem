package a;

import java.sql.Date;

public class Comment {
	    String Cname="����";          //������
	    Date Ctime;            //����ʱ��
	    String Ccontent[]= {"-1"};//��������
	    static int i=0;//�ۼ�������
	    public String get_Ccontent(int j) {   //�õ���������
	    	return Ccontent[j];
	    }
	    public int geti() {                   //�õ�������
	    	return i;
	    }
	    public void Publish(String b) {       //��������	    	
	    	this.Ccontent[i]=new String(b);	    	
	    	i++;
	    }
	    public void Delete(String b,int j) {   //ɾ������       
	    	this.Ccontent[i]="-1";
	    }

}
