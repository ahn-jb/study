package iot;

public class Elevator {
	
	//Field
	String aptId;
	
	//Constructor
	public Elevator(String aptId) {
		this.aptId = aptId;
	}
	
	
	
	//Method
	public boolean goingUp(int startFloor,int nowFloor,int stopFloor) {
		System.out.println(this.aptId+" - "+ nowFloor+"층에서 "+startFloor+"층으로 와서 "+stopFloor+"층으로 올라갑니다.");
		
		return true;
	}
	public boolean goingDown(int startFloor,int nowFloor,int stopFloor) {
		System.out.println(this.aptId+" - "+ nowFloor+"층에서 "+startFloor+"층으로 와서 "+stopFloor+"층으로 내려갑니다.");
		
		return true;
	}
	public boolean goingNone(int startFloor,int stopFloor) {
		System.out.println("현재 층 입니다.");
		
		return true;
	}

}
