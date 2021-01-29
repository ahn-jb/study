package iot;

public class TV implements RemoteControl{
	String aptId;
	int chanel = 41; //채널
	public TV(String aptId) {
		this.aptId=aptId;
	}
	
	public boolean on() {
		System.out.println(aptId+" TV ON (chanel:"+chanel+")");
		
		return true;
	}
	public boolean off() {
		System.out.println(aptId+" TV OFF(chanel:"+chanel+")");
		
		return true;
	}
}
