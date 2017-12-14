package model;

public class GradeDTO {
	private String grade;
	private int checkout_num;
	private int checkout_days;
	private int extend_days;
		
	public GradeDTO() {

	}
	public GradeDTO(String grade, int checkout_num, int checkout_days, int extend_days) {
		super();
		this.grade = grade;
		this.checkout_num = checkout_num;
		this.checkout_days = checkout_days;
		this.extend_days = extend_days;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public int getCheckout_num() {
		return checkout_num;
	}
	public void setCheckout_num(int checkout_num) {
		this.checkout_num = checkout_num;
	}
	public int getCheckout_days() {
		return checkout_days;
	}
	public void setCheckout_days(int checkout_days) {
		this.checkout_days = checkout_days;
	}
	public int getExtend_days() {
		return extend_days;
	}
	public void setExtend_days(int extend_days) {
		this.extend_days = extend_days;
	}
	
}
