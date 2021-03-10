package email.model.dto;

import java.sql.Timestamp;

public class EmailDTO {
	
	private String fromName;
	private	String fromEmail;
	private	String toEmail;
	private String subject;
	private String content;
	private Timestamp regi_date;
	
	private String memberName;
	private String memberEmail;
	private String memberbirthday;
	
	
	
	public String getMemberbirthday() {
		return memberbirthday;
	}
	public void setMemberbirthday(String memberbirthday) {
		this.memberbirthday = memberbirthday;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getMemberEmail() {
		return memberEmail;
	}
	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}
	public String getFromName() {
		return fromName;
	}
	public void setFromName(String fromName) {
		this.fromName = fromName;
	}
	public String getFromEmail() {
		return fromEmail;
	}
	public void setFromEmail(String fromEmail) {
		this.fromEmail = fromEmail;
	}
	public String getToEmail() {
		return toEmail;
	}
	public void setToEmail(String toEmail) {
		this.toEmail = toEmail;
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
	public Timestamp getRegi_date() {
		return regi_date;
	}
	public void setRegi_date(Timestamp regi_date) {
		this.regi_date = regi_date;
	}
	
	
	
}
