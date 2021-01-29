package test_loop;

import java.sql.Timestamp;

public class transactionTBLDTO {
	
	private int no;
	private String name;
	private Timestamp regidate;
	
	
	public transactionTBLDTO() {
		// TODO Auto-generated constructor stub
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

	public Timestamp getRegidate() {
		return regidate;
	}

	public void setRegidate(Timestamp regidate) {
		this.regidate = regidate;
	}
	
	
	
	
	
}
