package com.study.spring01.product.model.dto;

import org.springframework.web.multipart.MultipartFile;

public class ProductDTO {
	private int product_no;
	private String product_name;
	private int product_price;
	private String product_description;
	private String product_img;
	private String product_img_type;
	private String product_img_oldName;
	private MultipartFile file1; //상품이미지 파일
	
	public int getProduct_no() {
		return product_no;
	}
	public void setProduct_no(int product_no) {
		this.product_no = product_no;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public int getProduct_price() {
		return product_price;
	}
	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}
	public String getProduct_description() {
		return product_description;
	}
	public void setProduct_description(String product_description) {
		this.product_description = product_description;
	}
	public String getProduct_img() {
		return product_img;
	}
	public void setProduct_img(String product_img) {
		this.product_img = product_img;
	}
	public String getProduct_img_type() {
		return product_img_type;
	}
	public void setProduct_img_type(String product_img_type) {
		this.product_img_type = product_img_type;
	}
	public String getProduct_img_oldName() {
		return product_img_oldName;
	}
	public void setProduct_img_oldName(String product_img_oldName) {
		this.product_img_oldName = product_img_oldName;
	}
	public MultipartFile getFile1() {
		return file1;
	}
	public void setFile1(MultipartFile file1) {
		this.file1 = file1;
	}
}
