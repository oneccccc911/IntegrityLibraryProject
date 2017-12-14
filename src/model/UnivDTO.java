package model;

public class UnivDTO {
	private String univ_ID;
	private String univ_name;
	
	public UnivDTO() {
	}
	
	public UnivDTO(String univ_ID, String univ_name) {
		super();
		this.univ_ID = univ_ID;
		this.univ_name = univ_name;
	}
	
	public String getUniv_ID() {
		return univ_ID;
	}
	
	public void setUniv_ID(String univ_ID) {
		this.univ_ID = univ_ID;
	}
	
	public String getUniv_name() {
		return univ_name;
	}
	
	public void setUniv_name(String univ_name) {
		this.univ_name = univ_name;
	}
	
	
}
