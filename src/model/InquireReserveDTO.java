package model;

public class InquireReserveDTO {
	private int reserve_num;
	private int wait_num;
	private String book_name; 
	private String book_ID;
	private String copy_ID;
	
	public InquireReserveDTO() {
		
	}
	public InquireReserveDTO(int reserve_num, int wait_num, String book_name, String book_ID, String copy_ID) {
		super();
		this.reserve_num = reserve_num;
		this.wait_num = wait_num;
		this.book_name = book_name;
		this.book_ID = book_ID;
		this.copy_ID = copy_ID;
	}
	public int getReserve_num() {
		return reserve_num;
	}
	public void setReserve_num(int reserve_num) {
		this.reserve_num = reserve_num;
	}
	public int getWait_num() {
		return wait_num;
	}
	public void setWait_num(int wait_num) {
		this.wait_num = wait_num;
	}
	public String getBook_name() {
		return book_name;
	}
	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}
	public String getBook_ID() {
		return book_ID;
	}
	public void setBook_ID(String book_ID) {
		this.book_ID = book_ID;
	}
	public String getCopy_ID() {
		return copy_ID;
	}
	public void setCopy_ID(String copy_ID) {
		this.copy_ID = copy_ID;
	}
	
	
}
