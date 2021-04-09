package com.test.spring01;

public class Test04DTO {
	
	private String name;
	private String gender;
	private String jumin;
	private int age;
	
	private int kor;
	private int eng;
	private int mat;
	private int sci;
	private int his;
	private int total;
	private double avg;
	
	
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
	public String getJumin() {
		return jumin;
	}
	public void setJumin(String jumin) {
		this.jumin = jumin;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public int getKor() {
		return kor;
	}
	public void setKor(int kor) {
		this.kor = kor;
	}
	public int getEng() {
		return eng;
	}
	public void setEng(int eng) {
		this.eng = eng;
	}
	public int getMat() {
		return mat;
	}
	public void setMat(int mat) {
		this.mat = mat;
	}
	public int getSci() {
		return sci;
	}
	public void setSci(int sci) {
		this.sci = sci;
	}
	public int getHis() {
		return his;
	}
	public void setHis(int his) {
		this.his = his;
	}
	public int getTotal() {
		this.total = this.kor + this.eng + this.mat + this.sci + this.his; 
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public double getAvg() {
		this.avg = this.total/5.0;
		return avg;
	}
	public void setAvg(double avg) {
		this.avg = avg;
	}
	
	
	
	
}
