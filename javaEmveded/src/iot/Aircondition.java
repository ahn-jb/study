package iot;

public class Aircondition implements Remotecontrol {
	
	
	//Field
	String aptId;
	
	
	
	//Constructor
	public Aircondition(String aptId) {
		this.aptId = aptId;
		
	}
	
	
	
	//Method
	public boolean on() {
		
		System.out.println(aptId+"- Aircondition ON : 23'C");
		
		return true;
	}
	public boolean off() {
		
		System.out.println(aptId+"- Aircondition OFF");
		
		return true;
	}
	
	
}
