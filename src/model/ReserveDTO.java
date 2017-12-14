package model;

public class ReserveDTO {
	private int reserve_num;
	private int wait_num;
	private String user_ID;
	private String book_ID;
	private String copy_ID;

	public ReserveDTO() {
		super();
	}

	public ReserveDTO(int reserve_num, int wait_num, String user_ID, String book_ID, String copy_ID) {
		super();
		this.reserve_num = reserve_num;
		this.wait_num = wait_num;
		this.user_ID = user_ID;
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

	public String getUser_ID() {
		return user_ID;
	}

	public void setUser_ID(String user_ID) {
		this.user_ID = user_ID;
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
