package iot;

public class Television implements Remotecontrol {
	
	//Field
	String aptId;
	
	
	//Constructor
	public Television(String aptId) {
		this.aptId = aptId;
		
	}
	
	
	
	//Method
	public boolean on() {
		
		System.out.println(aptId+"- Television ON");
		
		return true;
	}
	public boolean off() {
		
		System.out.println(aptId+"- Television OFF");
		
		return true;
	}
}
