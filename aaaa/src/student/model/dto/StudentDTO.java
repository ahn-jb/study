package student.model.dto;

import java.sql.Date;


public class StudentDTO {
	
	private int no;
	private int year;
	private String s_class;
	private String num;
	private String name;
	private String born;
	private String s_phone; 
	private String p_phone;
	private String adr;
	private Date regidate;
	
	private int test_no;
	private String test_name;
	private Date test_regidate;
	
	private int SJ_no;
	private int kor;
	private int eng;
	private int mat;
	private int sci;
	private int his;
	private int total;
	private double avg;
	private Date SJ_regidate;
	
	
	
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public String getS_class() {
		return s_class;
	}
	public void setS_class(String s_class) {
		this.s_class = s_class;
	}
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getBorn() {
		return born;
	}
	public void setBorn(String born) {
		this.born = born;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

	public String getS_phone() {
		return s_phone;
	}
	public void setS_phone(String s_phone) {
		this.s_phone = s_phone;
	}
	public String getP_phone() {
		return p_phone;
	}
	public void setP_phone(String p_phone) {
		this.p_phone = p_phone;
	}
	public String getAdr() {
		return adr;
	}
	public void setAdr(String adr) {
		this.adr = adr;
	}
	public Date getRegidate() {
		return regidate;
	}
	public void setRegidate(Date regidate) {
		this.regidate = regidate;
	}
	public int getTest_no() {
		return test_no;
	}
	
	
	
	public void setTest_no(int test_no) {
		this.test_no = test_no;
	}
	public String getTest_name() {
		return test_name;
	}
	public void setTest_name(String test_name) {
		this.test_name = test_name;
	}
	public Date getTest_regidate() {
		return test_regidate;
	}
	public void setTest_regidate(Date test_regidate) {
		this.test_regidate = test_regidate;
	}
	
	
	
	
	
	public int getSJ_no() {
		return SJ_no;
	}
	public void setSJ_no(int sJ_no) {
		SJ_no = sJ_no;
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
	public int getHis() {
		return his;
	}
	public void setHis(int his) {
		this.his = his;
	}
	public Date getSJ_regidate() {
		return SJ_regidate;
	}
	public void setSJ_regidate(Date sJ_regidate) {
		SJ_regidate = sJ_regidate;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public double getAvg() {
		return avg;
	}
	public void setAvg(double avg) {
		this.avg = avg;
	}

	
	
	
	
	
}
