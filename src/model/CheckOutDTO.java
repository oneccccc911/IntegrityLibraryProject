package model;

import java.sql.Date;

public class CheckOutDTO {
	private int checkout_num;
	private Date checkout_date;
	private Date return_date;  
	private Date due_date;   
	private int extend_num;   
	private String user_ID;      
	private String book_ID;     
	private String copy_ID;
	
	public CheckOutDTO() {
	}
	
	public CheckOutDTO(int checkout_num, Date checkout_date, Date return_date, Date due_date, int extend_num,
			String user_ID, String book_ID, String copy_ID) {
		super();
		this.checkout_num = checkout_num;
		this.checkout_date = checkout_date;
		this.return_date = return_date;
		this.due_date = due_date;
		this.extend_num = extend_num;
		this.user_ID = user_ID;
		this.book_ID = book_ID;
		this.copy_ID = copy_ID;
	}
	public int getCheckout_num() {
		return checkout_num;
	}
	public void setCheckout_num(int checkout_num) {
		this.checkout_num = checkout_num;
	}
	public Date getCheckout_date() {
		return checkout_date;
	}
	public void setCheckout_date(Date checkout_date) {
		this.checkout_date = checkout_date;
	}
	public Date getReturn_date() {
		return return_date;
	}
	public void setReturn_date(Date return_date) {
		this.return_date = return_date;
	}
	public Date getDue_date() {
		return due_date;
	}
	public void setDue_date(Date due_date) {
		this.due_date = due_date;
	}
	public int getExtend_num() {
		return extend_num;
	}
	public void setExtend_num(int extend_num) {
		this.extend_num = extend_num;
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
