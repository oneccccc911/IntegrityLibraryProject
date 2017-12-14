package model;

public class UserDTO {
	private String user_ID; 
	private String user_pass; 
	private String user_name; 
	private String user_addr; 
	private String user_tel; 
	private String grade;    
	private String univ_ID;
	private String univ_num;
	
	public UserDTO() {
	}

	public UserDTO(String user_ID, String user_pass, String user_name, String user_addr, String user_tel, String grade,
			String univ_ID, String univ_num) {
		super();
		this.user_ID = user_ID;
		this.user_pass = user_pass;
		this.user_name = user_name;
		this.user_addr = user_addr;
		this.user_tel = user_tel;
		this.grade = grade;
		this.univ_ID = univ_ID;
		this.univ_num = univ_num;
	}

	public String getUser_ID() {
		return user_ID;
	}

	public void setUser_ID(String user_ID) {
		this.user_ID = user_ID;
	}

	public String getUser_pass() {
		return user_pass;
	}

	public void setUser_pass(String user_pass) {
		this.user_pass = user_pass;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_addr() {
		return user_addr;
	}

	public void setUser_addr(String user_addr) {
		this.user_addr = user_addr;
	}

	public String getUser_tel() {
		return user_tel;
	}

	public void setUser_tel(String user_tel) {
		this.user_tel = user_tel;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getUniv_ID() {
		return univ_ID;
	}

	public void setUniv_ID(String univ_ID) {
		this.univ_ID = univ_ID;
	}

	public String getUniv_num() {
		return univ_num;
	}

	public void setUniv_num(String univ_num) {
		this.univ_num = univ_num;
	}

	@Override
	public String toString() {
		return "UserDTO [user_ID=" + user_ID + ", user_pass=" + user_pass + ", user_name=" + user_name + ", user_addr="
				+ user_addr + ", user_tel=" + user_tel + ", grade=" + grade + ", univ_ID=" + univ_ID + ", univ_num="
				+ univ_num + "]";
	} 
	
	
	
	
	
}
