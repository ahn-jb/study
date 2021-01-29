package iot;

public class Security implements RemoteControl{
	String aptId;
	
	public Security(String aptId) {
		this.aptId = aptId;
	}
	
	public boolean on() {
		System.out.println(aptId+" Securit ON");
		
		return true;
	}
	
	public boolean off() {
		System.out.println(aptId+" Securit OFF");
		
		return true;
	}
	
	
}
