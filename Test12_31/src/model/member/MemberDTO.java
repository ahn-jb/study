package model.member;

import java.sql.Timestamp;

public class MemberDTO {
	private int no;
	private String id;
	private String pw;
	private String name;
	private String gender;
	private int bornYear;
	private Timestamp regidate;
	private int LoginCounter;
	private int grade;
	private String ip;
	
	
	
	public MemberDTO() {}

	
	
	
	
	
	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public int getBornYear() {
		return bornYear;
	}

	public void setBornYear(int bornYear) {
		this.bornYear = bornYear;
	}

	public Timestamp getRegidate() {
		return regidate;
	}

	public void setRegidate(Timestamp regidate) {
		this.regidate = regidate;
	}

	public int getLoginCounter() {
		return LoginCounter;
	}

	public void setLoginCounter(int loginCounter) {
		LoginCounter = loginCounter;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}
	
	
	
	
	
	
	
	

}
