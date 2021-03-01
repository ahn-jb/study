package model.dto.board;

import java.sql.Date;

public class BoardDTO {
	//field
		private int no;
		private int num; 
		private String tbl; //
		private String writer;
		private String subject;
		private String content;
		private String email;
		private String passwd;
		private int	refNo; 
		private int	stepNo;
		private int	levelNo;
		private int p_no;
		private int	hit;
		private String ip;        //
		private int memberNo; //
		private int noticeNo; //
		private String secretGubun; //
		private Date regiDate;
		private int p_no_result;
		private String answer_boolean;
		
		private String noticeGubun; //
		private int child_counter; //
		
		private int preNo;
		private int nextNo;
		private String preSubject;
		private String nextSubject;
		
		
		//comment
		private int comment_no;
		private int board_no; 
		private String comment_writer;
		private String comment_content;
		private String comment_passwd;
		
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


		public String getAnswer_boolean() {
			return answer_boolean;
		}


		public void setAnswer_boolean(String answer_boolean) {
			this.answer_boolean = answer_boolean;
		}


		public String getTbl() {
			return tbl;
		}


		public void setTbl(String tbl) {
			this.tbl = tbl;
		}


		public String getIp() {
			return ip;
		}


		public void setIp(String ip) {
			this.ip = ip;
		}


		public int getMemberNo() {
			return memberNo;
		}


		public void setMemberNo(int memberNo) {
			this.memberNo = memberNo;
		}


		public int getNoticeNo() {
			return noticeNo;
		}


		public void setNoticeNo(int noticeNo) {
			this.noticeNo = noticeNo;
		}


		public String getSecretGubun() {
			return secretGubun;
		}


		public void setSecretGubun(String secretGubun) {
			this.secretGubun = secretGubun;
		}


		public String getNoticeGubun() {
			return noticeGubun;
		}


		public void setNoticeGubun(String noticeGubun) {
			this.noticeGubun = noticeGubun;
		}


		public int getChild_counter() {
			return child_counter;
		}


		public void setChild_counter(int child_counter) {
			this.child_counter = child_counter;
		}


		
		//Commnet
		
		public int getComment_no() {
			return comment_no;
		}


		public void setComment_no(int comment_no) {
			this.comment_no = comment_no;
		}


		public int getBoard_no() {
			return board_no;
		}


		public void setBoard_no(int board_no) {
			this.board_no = board_no;
		}


		public String getComment_writer() {
			return comment_writer;
		}


		public void setComment_writer(String comment_writer) {
			this.comment_writer = comment_writer;
		}


		public String getComment_content() {
			return comment_content;
		}


		public void setComment_content(String comment_content) {
			this.comment_content = comment_content;
		}


		public String getComment_passwd() {
			return comment_passwd;
		}


		public void setComment_passwd(String comment_passwd) {
			this.comment_passwd = comment_passwd;
		}
		
		
		
		
	}

