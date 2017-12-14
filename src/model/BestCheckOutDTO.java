package model;

import java.sql.Date;

public class BestCheckOutDTO {
	private int rownum;
	private String book_name;
	private String book_author;
	private Date book_year;
	private String book_pub; 
	private String book_ID;

	
	public BestCheckOutDTO() {
		super();
	}


	public BestCheckOutDTO(int rownum, String book_name, String book_author, Date book_year, String book_pub,
			String book_ID) {
		super();
		this.rownum = rownum;
		this.book_name = book_name;
		this.book_author = book_author;
		this.book_year = book_year;
		this.book_pub = book_pub;
		this.book_ID = book_ID;
	}


	public int getRownum() {
		return rownum;
	}


	public void setRownum(int rownum) {
		this.rownum = rownum;
	}


	public String getBook_name() {
		return book_name;
	}


	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}


	public String getBook_author() {
		return book_author;
	}


	public void setBook_author(String book_author) {
		this.book_author = book_author;
	}


	public Date getBook_year() {
		return book_year;
	}


	public void setBook_year(Date book_year) {
		this.book_year = book_year;
	}


	public String getBook_pub() {
		return book_pub;
	}


	public void setBook_pub(String book_pub) {
		this.book_pub = book_pub;
	}


	public String getBook_ID() {
		return book_ID;
	}


	public void setBook_ID(String book_ID) {
		this.book_ID = book_ID;
	}

	

}
