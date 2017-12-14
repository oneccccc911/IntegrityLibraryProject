package model;

import java.sql.Date;

public class BookNewDTO {
	private String book_ID;
	private String book_name;
	private String book_author;
	private String book_cate;
	private Date book_year;
	private int book_page;
	private String book_pub;
	private String lib_ID;
	private String lib_name;
	
	public BookNewDTO() {

	}
	
	public BookNewDTO(String book_ID, String book_name, String book_author, String book_cate, Date book_year,
			int book_page, String book_pub, String lib_ID, String lib_name) {
		super();
		this.book_ID = book_ID;
		this.book_name = book_name;
		this.book_author = book_author;
		this.book_cate = book_cate;
		this.book_year = book_year;
		this.book_page = book_page;
		this.book_pub = book_pub;
		this.lib_ID = lib_ID;
		this.lib_name = lib_name;
	}

	public String getBook_ID() {
		return book_ID;
	}
	public void setBook_ID(String book_ID) {
		this.book_ID = book_ID;
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
	public String getBook_cate() {
		return book_cate;
	}
	public void setBook_cate(String book_cate) {
		this.book_cate = book_cate;
	}
	public Date getBook_year() {
		return book_year;
	}
	public void setBook_year(Date book_year) {
		this.book_year = book_year;
	}
	public int getBook_page() {
		return book_page;
	}
	public void setBook_page(int book_page) {
		this.book_page = book_page;
	}
	public String getBook_pub() {
		return book_pub;
	}
	public void setBook_pub(String book_pub) {
		this.book_pub = book_pub;
	}
	public String getLib_ID() {
		return lib_ID;
	}
	public void setLib_ID(String lib_ID) {
		this.lib_ID = lib_ID;
	}

	public String getLib_name() {
		return lib_name;
	}

	public void setLib_name(String lib_name) {
		this.lib_name = lib_name;
	}
	
	
	
}
