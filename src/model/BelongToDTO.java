package model;

public class BelongToDTO {
	private String univ_num;
	private String univ_ID;
	private String grade;
	
	public BelongToDTO() {
	}
	public BelongToDTO(String univ_num, String univ_ID, String grade) {
		super();
		this.univ_num = univ_num;
		this.univ_ID = univ_ID;
		this.grade = grade;
	}
	public String getUniv_num() {
		return univ_num;
	}
	public void setUniv_num(String univ_num) {
		this.univ_num = univ_num;
	}
	public String getUniv_ID() {
		return univ_ID;
	}
	public void setUniv_ID(String univ_ID) {
		this.univ_ID = univ_ID;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	
}
