package model.board;

import java.util.Date;

public class BoardDTO {
	//field
	private int    no;
	private int 	num; 
	private String writer;
	private String subject;
	private String content;
	private String email;
	private String passwd;
	private int		refNo; 
	private int		stepNo;
	private int		levelNo;
	private int 	p_no;
	private int		hit;
	private Date	regiDate;
	private int 	service;
	private int p_no_result;
	
	private int preNo;
	private int nextNo;
	private String preSubject;
	private String nextSubject;
	//Constructor
	public BoardDTO() {
		
	}
	
	
	//Method
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	
	
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
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
	
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	
	
	public int getRefNo() {
		return refNo;
	}
	public void setRefNo(int refNo) {
		this.refNo = refNo;
	}
	
	

	
	
	public int getStepNo() {
		return stepNo;
	}


	public void setStepNo(int stepNo) {
		this.stepNo = stepNo;
	}


	public int getLevelNo() {
		return levelNo;
	}


	public void setLevelNo(int levelNo) {
		this.levelNo = levelNo;
	}


	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	
	
	public Date getRegiDate() {
		return regiDate;
	}
	public void setRegiDate(Date regiDate) {
		this.regiDate = regiDate;
	}


	public int getService() {
		return service;
	}


	public void setService(int service) {
		this.service = service;
	}


	public int getP_no() {
		return p_no;
	}


	public void setP_no(int p_no) {
		this.p_no = p_no;
	}


	public int getP_no_result() {
		return p_no_result;
	}


	public void setP_no_result(int p_no_result) {
		this.p_no_result = p_no_result;
	}


	public int getPreNo() {
		return preNo;
	}


	public void setPreNo(int preNo) {
		this.preNo = preNo;
	}


	public int getNextNo() {
		return nextNo;
	}


	public void setNextNo(int nextNo) {
		this.nextNo = nextNo;
	}


	public String getPreSubject() {
		return preSubject;
	}


	public void setPreSubject(String preSubject) {
		this.preSubject = preSubject;
	}


	public String getNextSubject() {
		return nextSubject;
	}


	public void setNextSubject(String nextSubject) {
		this.nextSubject = nextSubject;
	}

	


	
	
	
	
	
	
	
}
