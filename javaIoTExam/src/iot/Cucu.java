package iot;

public class Cucu implements RemoteControl{
	String aptId;
	
	public Cucu(String aptId) {
		this.aptId=aptId;
	}
	
	public boolean on() {
		System.out.println(aptId+" Cucu: 취사시작");
		
		return true;
	}
	public boolean off() {
		System.out.println(aptId+" Cucu: 취사취소");
		return true;
	}
}
