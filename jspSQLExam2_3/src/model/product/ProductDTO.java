package model.product;

import java.sql.Timestamp;

public class ProductDTO {

	private int no;
	private String p_code;
	private String p_name;
	private int p_price;
	private int p_count;
	private Timestamp regidate;
	private String member_id;
	private String member_addr;
	private int p_NOP;
	
	
	
	public ProductDTO() {}

	
	
	
	
	// G & S
	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getP_code() {
		return p_code;
	}

	public void setP_code(String p_code) {
		this.p_code = p_code;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public int getP_price() {
		return p_price;
	}

	public void setP_price(int p_price) {
		this.p_price = p_price;
	}

	public int getP_count() {
		return p_count;
	}

	public void setP_count(int p_count) {
		this.p_count = p_count;
	}

	public Timestamp getRegidate() {
		return regidate;
	}

	public void setRegidate(Timestamp regidate) {
		this.regidate = regidate;
	}





	public String getMember_id() {
		return member_id;
	}





	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}





	public String getMember_addr() {
		return member_addr;
	}





	public void setMember_addr(String member_addr) {
		this.member_addr = member_addr;
	}





	public int getP_NOP() {
		return p_NOP;
	}





	public void setP_NOP(int p_NOP) {
		this.p_NOP = p_NOP;
	}
	
	
	
}
