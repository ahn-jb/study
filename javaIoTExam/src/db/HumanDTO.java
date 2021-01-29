package db;

public class HumanDTO {
	
	private String aptId;
	private String security;
	private String light;
	private String aircondition;
	private String telecision;
	private String cucu;

	
	
	
	
	
	public HumanDTO(String aptId,String security, String aircondition, String light, String telecision, String cucu) {
		this.aptId = aptId;
		this.security = security;
		this.light = light;
		this.aircondition = aircondition;
		this.telecision = telecision;
		this.cucu = cucu;
	}

	
	
	
	
	
	public String getAptId() {
		return aptId;
	}

	public void setAptId(String aptId) {
		this.aptId = aptId;
	}

	public String getSecurity() {
		return security;
	}

	public void setSecurity(String security) {
		this.security = security;
	}

	public String getLight() {
		return light;
	}

	public void setLight(String light) {
		this.light = light;
	}

	public String getAircondition() {
		return aircondition;
	}

	public void setAircondition(String aircondition) {
		this.aircondition = aircondition;
	}

	public String getTelecision() {
		return telecision;
	}

	public void setTelecision(String telecision) {
		this.telecision = telecision;
	}

	public String getCucu() {
		return cucu;
	}

	public void setCucu(String cucu) {
		this.cucu = cucu;
	}
	
}
