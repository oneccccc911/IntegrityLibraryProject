package model;


public class LibraryDTO {
	private String lib_ID;
	private String lib_name;
	private String lib_addr;
	private String lib_tel;
	private String lib_open;
	private String lib_close;
	private String univ_name;
	
	
	public LibraryDTO() {
		super();
	}


	public LibraryDTO(String lib_ID, String lib_name, String lib_addr, String lib_tel, String lib_open, String lib_close,
			String univ_name) {
		super();
		this.lib_ID = lib_ID;
		this.lib_name = lib_name;
		this.lib_addr = lib_addr;
		this.lib_tel = lib_tel;
		this.lib_open = lib_open;
		this.lib_close = lib_close;
		this.univ_name = univ_name;
		
		
		
		
		
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


	public String getLib_addr() {
		return lib_addr;
	}


	public void setLib_addr(String lib_addr) {
		this.lib_addr = lib_addr;
	}


	public String getLib_tel() {
		return lib_tel;
	}


	public void setLib_tel(String lib_tel) {
		this.lib_tel = lib_tel;
	}


	public String getLib_open() {
		return lib_open;
	}


	public void setLib_open(String lib_open) {
		this.lib_open = lib_open;
	}


	public String getLib_close() {
		return lib_close;
	}


	public void setLib_close(String lib_close) {
		this.lib_close = lib_close;
	}


	public String getUniv_name() {
		return univ_name;
	}


	public void setUniv_name(String univ_name) {
		this.univ_name = univ_name;
	}


	
	
	
}
