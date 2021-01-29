package iot;

public class Aircondiition implements RemoteControl{

	String aptId;
	double desiredTemperature = 23.0;
	
	public Aircondiition(String aptId) {
		this.aptId = aptId;
	}
	
	public boolean on() {
		System.out.println(aptId+" Aircon ON (설정온도: "+
		desiredTemperature+")");
		return true;
	}
	
	public boolean off() {
		System.out.println(aptId+" Aircon OFF (설정온도: "+
		desiredTemperature+")");
		return true;
	}
	
	
}
