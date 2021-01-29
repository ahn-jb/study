package student;

public class StudentDTO {
	// field
	
	private String sid; 
	private String sname;
	private String sphone;
	private String pname;
	private String pphone;
	private String addr;
	private int hackyun;
	 
	//constructor
	public StudentDTO() {}


	
	//method
	
	public String getSid() {
		return sid;
	}

	public void setSid(String sid) {
		this.sid = sid;
	}

	public String getSname() {
		return sname;
	}

	public void setSname(String sname) {
		this.sname = sname;
	}

	public String getSphone() {
		return sphone;
	}

	public void setSphone(String sphone) {
		this.sphone = sphone;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public String getPphone() {
		return pphone;
	}

	public void setPphone(String pphone) {
		this.pphone = pphone;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public int getHackyun() {
		return hackyun;
	}

	public void setHackyun(int hackyun) {
		this.hackyun = hackyun;
	}



	@Override
	public String toString() {
		return "StudentDTO [sid=" + sid + ", sname=" + sname + ", sphone=" + sphone + ", pname=" + pname + ", pphone="
				+ pphone + ", addr=" + addr + ", hackyun=" + hackyun + "]";
	}
	
	
}
