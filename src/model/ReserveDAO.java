package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import util.DBUtil;

public class ReserveDAO {
	
	Connection conn;
	PreparedStatement st;
	ResultSet rs;
	int result;
	
	String doReserve_sql = "insert into RESERVE values(seq_reserve.nextval, ("
			+" select count(*) from reserve where book_ID = ? and copy_ID = ?"
			+" ) , ? , ? , ? ) ";
	// 책아이디/카피아이디/아이디/책아이디/카피아이디
	
	
	String cancelReserve_sql_update = "update reserve set wait_num = wait_num - 1"
			+" where book_ID = ? and copy_ID = ? and wait_num > ("
			+" select wait_num"
			+" from RESERVE"
			+" where reserve_num = ? and user_ID = ?)";
	// 북아이디/카피아이디/예약번호(int)/
	
	String cancelReserve_sql_delete = "delete from RESERVE where reserve_num = ? and user_ID = ?";
	// 예약번호(int)/유저아이디
	
	public int doReserve_sql(String book_ID, String copy_ID, String user_ID){
		ReserveDTO reserve = new ReserveDTO();
		
		conn = DBUtil.getConnect();
		try {
			st = conn.prepareStatement(doReserve_sql);
			st.setString(1, book_ID);
			st.setString(2, copy_ID);
			st.setString(3, user_ID);
			st.setString(4, book_ID);
			st.setString(5, copy_ID);
			
			result = st.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			DBUtil.dbClose(conn, st, rs);
		}
		
		
		
		return result;
		
	}
	
	public int cancelReserve_sql_update(String book_ID, String copy_ID, int reserve_num, String user_Id){
		
		conn = DBUtil.getConnect();
		
		try {
			st = conn.prepareStatement(cancelReserve_sql_update);
			st.setString(1, book_ID);
			st.setString(2, copy_ID);
			st.setInt(3, reserve_num);
			st.setString(4, user_Id);
		
			
			result = st.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			DBUtil.dbClose(conn, st, rs);
		}
		
		return result;
	}
	
	public int cancelReserve_sql_delete(int reserve_num, String user_ID){
		
		conn = DBUtil.getConnect();
		
		try {
			st = conn.prepareStatement(cancelReserve_sql_delete);
			st.setInt(1, reserve_num);
			st.setString(2, user_ID);
			rs = st.executeQuery();
			
			result = st.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			DBUtil.dbClose(conn, st, rs);
		}
		
		return result;
	}
	
	
	private ReserveDTO makelog(ResultSet rs) throws SQLException {
		
		int reserve_num = rs.getInt("reserve_num");
		int wait_num = rs.getInt("wait_num");
		String user_ID = rs.getString("user_ID");
		String book_ID = rs.getString("book_ID");
		String copy_ID = rs.getString("copy_ID");

		ReserveDTO log = new ReserveDTO(reserve_num, wait_num, user_ID, book_ID, copy_ID);
		return log;
	}
}
