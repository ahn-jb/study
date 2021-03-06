package model.dto.member;

import java.sql.Timestamp;

public class MemberDTO {
	//field
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
	
	/////ask
	private String bunryu;
	private String subject;
	private String content;
	private String rank;
	private String answer;
	//member no
	private int no_member;
	
	
	//constructor
	
	public MemberDTO() {}

	
	//getter & setter

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


	
	
	//////////////ask//////////////
	
	
	public String getBunryu() {
		return bunryu;
	}




	public void setBunryu(String bunryu) {
		this.bunryu = bunryu;
	}




	public String getSubject() {
		return subject;
	}




	public void setSubject(String subject) {
		this.subject = subject;
	}




	public String getContent() {
		return content;
	}




	public void setContent(String content) {
		this.content = content;
	}

	
	
	public String getAnswer() {
		return answer;
	}


	public void setAnswer(String answer) {
		this.answer = answer;
	}


	public String getRank() {
		return rank;
	}


	public void setRank(String rank) {
		this.rank = rank;
	}


	//no_member
	public int getNo_member() {
		return no_member;
	}


	public void setNo_member(int no_member) {
		this.no_member = no_member;
	}
	
	
	
	
	
}
