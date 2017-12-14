package model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import model.CheckDTO;
import util.DBUtil;

public class CheckDAO {

	Connection conn;
	PreparedStatement st;
	ResultSet rs;
	int result;

	
	
	String showAll_sql = "select checkout_num, book_ID, book_name, checkout_date,return_date, due_date, extend_num, user_ID, copy_ID from BOOK inner join CHECKOut "
			+ " using(book_ID)";

	String myCheckOut_Sql = showAll_sql + " where user_ID=?";

	String update_Extend_date_sql = "update CHECKOUT "
			+ " set extend_num=extend_num+1, due_date = ((select due_date from CHECKOUT where checkout_num = ?)" + " + (select extend_days"
			+ "	from USERGRADE ug, users u" + "	where (ug.grade=u.grade) and user_ID=?))" + " where checkout_num = ?  and extend_num <2 and return_date is null " ;

	public int updateExtend(int checkout_num, String user_ID) {

		conn = DBUtil.getConnect();

		try {

			st = conn.prepareStatement(update_Extend_date_sql);

			st.setInt(1, checkout_num);
			st.setString(2, user_ID);
			st.setInt(3, checkout_num);
		

			result = st.executeUpdate();
			System.out.println(result);
			
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {

			DBUtil.dbClose(conn, st, rs);

		}
		return result;
	}

	
	
	public List<CheckDTO> showAll() {
		List<CheckDTO> checklist = new ArrayList<>();

		conn = DBUtil.getConnect();

		try {
			st = conn.prepareStatement(showAll_sql);
			rs = st.executeQuery();
			while (rs.next()) {
				CheckDTO check = makeCheck(rs);
				checklist.add(check);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(conn, st, rs);
		}

		return checklist;
	}

	
	
	public List<CheckDTO> myCheckOut(String user_ID) {
		List<CheckDTO> checklist = new ArrayList<>();
		conn = DBUtil.getConnect();
		try {
			st = conn.prepareStatement(myCheckOut_Sql);
			st.setString(1, user_ID);
			rs = st.executeQuery();
			while (rs.next()) {
				CheckDTO check = makeCheck(rs);
				checklist.add(check);

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(conn, st, rs);
		}

		return checklist;

	}


	
	private CheckDTO makeCheck(ResultSet rs) throws SQLException {
		
		int checkout_num=rs.getInt("checkout_num");
		String book_name = rs.getString("book_name");
		Date checkout_date = rs.getDate("checkout_date");
		Date return_date = rs.getDate("return_date");
		Date due_date = rs.getDate("due_date");
		int extend_num = rs.getInt("extend_num");
		String book_ID = rs.getString("book_ID");
		String user_ID = rs.getString("user_ID");
		String copy_ID = rs.getString("copy_ID");
		

		CheckDTO check = new CheckDTO(checkout_num, book_name, checkout_date, return_date, due_date, extend_num, user_ID, book_ID, copy_ID);
		return check;

	}

}
