package model;

import java.sql.Date;

public class CopyDTO {
	private String book_ID;
	private String copy_ID;
	private Date buy_date;
	
	public CopyDTO() {
	}

	public CopyDTO(String book_ID, String copy_ID, Date buy_date) {
		super();
		this.book_ID = book_ID;
		this.copy_ID = copy_ID;
		this.buy_date = buy_date;
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

	public Date getBuy_date() {
		return buy_date;
	}

	public void setBuy_date(Date buy_date) {
		this.buy_date = buy_date;
	}
	
	
}
