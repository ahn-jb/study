package model.product;

import java.sql.Timestamp;

public class ProductDTO {

	private int no;
	private String p_code;
	private String p_name;
	private int p_price;
	private int p_count;
	private Timestamp regidate;
	
	
	
	
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
	
	
	
}
