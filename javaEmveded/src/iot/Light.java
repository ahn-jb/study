package iot;

public class Light implements Remotecontrol {
	
	//Field
	String aptId;
	
	
	//Constructor
	public Light(String aptId) {
		this.aptId = aptId;
		
	}
	
	
	//Method
	public boolean on() {
		
		System.out.println(aptId+"- Light ON");
		
		return true;
	}
	public boolean off() {
		
		System.out.println(aptId+"- Light OFF");
		
		return true;
	}
}
