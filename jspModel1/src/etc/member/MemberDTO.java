package etc.member;

import java.sql.Date;

public class MemberDTO {
	
	//Field
	private int no;
	private String id; 
	private String pw;
	private String name;
	private String nickname;
	private String email;
	private String phone;
	private String address;
	private String gender;
	private String job;
	private String grade;
	private String ip;
	private int loginCounter;
	private Date regi_date; //Date, Timestamp
	
	
	
	//Constructor
	public MemberDTO() {}


	
	
	
	
	
	// Getter & Setter
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


	public String getNickname() {
		return nickname;
	}


	public void setNickname(String nickname) {
		this.nickname = nickname;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public String getGender() {
		return gender;
	}


	public void setGender(String gender) {
		this.gender = gender;
	}


	public String getJob() {
		return job;
	}


	public void setJob(String job) {
		this.job = job;
	}


	public String getGrade() {
		return grade;
	}


	public void setGrade(String grade) {
		this.grade = grade;
	}


	public Date getRegi_date() {
		return regi_date;
	}



	public void setRegi_date(Date regi_date) {
		this.regi_date = regi_date;
	}







	public String getIp() {
		return ip;
	}







	public void setIp(String ip) {
		this.ip = ip;
	}







	public int getLoginCounter() {
		return loginCounter;
	}







	public void setLoginCounter(int loginCounter) {
		this.loginCounter = loginCounter;
	}


	
	
	
	
	
	
}
