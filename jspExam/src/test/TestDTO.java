package test;

public class TestDTO {

	private int		hackyun;	
	private String	test;
	private String 	sid;
	private int 	kor;
	private int		eng;
	private int		mat;
	private int		sci;
	private int 	tot;
	private double 	avg;
	private String 	sname;
	
	
	
	
	public TestDTO() {}
	
	
	
	
	

	public int getHackyun() {
		return hackyun;
	}

	public void setHackyun(int hackyun) {
		this.hackyun = hackyun;
	}

	public String getTest() {
		return test;
	}

	public void setTest(String test) {
		this.test = test;
	}
	



	public String getSname() {
		return sname;
	}






	public void setSname(String sname) {
		this.sname = sname;
	}






	public String getSid() {
		return sid;
	}
	public void setSid(String sid) {
		this.sid = sid;
	}

	
	public int getKor() {
		return kor;
	}

	public void setKor(int kor) {
		this.kor = kor;
	}

	public int getEng() {
		return eng;
	}

	public void setEng(int eng) {
		this.eng = eng;
	}

	public int getMat() {
		return mat;
	}

	public void setMat(int mat) {
		this.mat = mat;
	}

	public int getSci() {
		return sci;
	}

	public void setSci(int sci) {
		this.sci = sci;
	}

	public int getTot() {
		return tot;
	}

	public void setTot(int tot) {
		this.tot = tot;
	}

	public double getAvg() {
		return avg;
	}

	public void setAvg(double avg) {
		this.avg = avg;
	}






	@Override
	public String toString() {
		return "TestDTO [hackyun=" + hackyun + ", test=" + test + ", sid=" + sid + ", kor=" + kor + ", eng=" + eng
				+ ", mat=" + mat + ", sci=" + sci + ", tot=" + tot + ", avg=" + avg + "]";
	}
	
	
	
	
}
