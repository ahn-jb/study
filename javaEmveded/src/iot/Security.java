package iot;

public class Security implements Remotecontrol {
	
	//Field
	String aptId;
	
	
	//Constructor
	public Security(String aptId) {
		this.aptId = aptId;
		
	}
	
	
	//Method
	public boolean on() {
		
		System.out.println(aptId+"- Security ON");
		
		return true;
	}
	public boolean off() {
		
		System.out.println(aptId+"- Security OFF");
		
		return true;
	}
}
