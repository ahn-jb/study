package iot;

public class Light implements RemoteControl{
	String aptId;
	
	
	public Light(String aptId) {
		this.aptId = aptId;
	}
	
	public boolean on() {
		System.out.println(aptId+" Light ON");
		
		return true;
	}
	public boolean off() {
		System.out.println(aptId+" Light OFF");
		
		return true;
	}
}
