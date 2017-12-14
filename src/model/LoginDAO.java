package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.UserDTO;
import util.DBUtil;

public class LoginDAO {
	
	Connection conn;
	PreparedStatement st;
	ResultSet rs;

	String login_sql = "select * from Users where user_ID =? and user_pass = ? ";
	
	public UserDTO login(String user_ID, String user_pass){ //int로 반환하는거 맞는가??
		
		UserDTO login = null;
		
		System.out.println(user_ID + ":" + user_pass);
		conn = DBUtil.getConnect();
		try {
			st= conn.prepareStatement(login_sql);
			st.setString(1,user_ID);
			st.setString(2,user_pass);
			
			rs=st.executeQuery();
			while(rs.next()){
				login = makeLogin(rs);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			DBUtil.dbClose(conn, st, rs);
			
		}
		return login;
	}	
	

	
	private UserDTO makeLogin(ResultSet rs) throws SQLException{

		 String user_ID =rs.getString("user_ID");
		 String user_pass=rs.getString("user_pass");
		 String user_name=rs.getString("user_name");
		 String user_addr=rs.getString("user_addr");
		 String user_tel=rs.getString("user_tel");
		 String grade   =rs.getString("grade");
		 String univ_ID=rs.getString("univ_ID");
		 String univ_num=rs.getString("univ_num");
		 
		 UserDTO login = new UserDTO(user_ID, user_pass, user_name, user_addr, user_tel, grade, univ_ID, univ_num);
		 
		 return login;
	}
	
}





