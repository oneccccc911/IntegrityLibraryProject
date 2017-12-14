package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import util.DBUtil;

public class MyPageDAO {
	Connection conn;
	PreparedStatement st;
	ResultSet rs;
	int result;

	String selectAll_user = "select distinct us.user_ID, us.user_pass, us.user_name, "
			+ "us.user_addr, us.user_tel, us.grade, un.univ_name, us.univ_num" + " from University un, Users us"
			+ " where un.univ_id = us.univ_id";

	String delete_user = "delete from users where user_ID=?";

	String update_users = "update Users set user_pass=?, user_addr=?, user_tel=?, user_name=? where user_id=?";

	String selectByid_users = "select us.user_ID, us.user_pass, us.user_name, us.user_addr, "
			+ "us.user_tel, us.grade, un.univ_name, us.univ_num" + " from University un, Users us"
			+ " where un.univ_id = us.univ_id and user_id = ?";

	public List<MyPageDTO> selectAll_user() {

		List<MyPageDTO> userlist = new ArrayList<>();

		conn = DBUtil.getConnect();

		try {
			st = conn.prepareStatement(selectAll_user);
			rs = st.executeQuery();
			while (rs.next()) {
				MyPageDTO user = makeMyPage(rs);
				userlist.add(user);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(conn, st, rs);
		}

		return userlist;
	}

	public int delete_user(String user_ID) {

		conn = DBUtil.getConnect();

		try {
			st = conn.prepareStatement(delete_user);
			st.setString(1, user_ID);

			result = st.executeUpdate(); // 영향은 받은 건수를 리턴

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(conn, st, rs);
		}

		return result;

	}

	public int update_users(MyPageDTO user) {

		conn = DBUtil.getConnect();

		try {
			st = conn.prepareStatement(update_users);
			st.setString(1, user.getUser_pass());
			st.setString(2, user.getUser_addr());
			st.setString(3, user.getUser_tel());
			st.setString(4, user.getUser_name());
			st.setString(5, user.getUser_ID());

			result = st.executeUpdate(); // 영향은 받은 건수를 리턴

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(conn, st, rs);
		}

		return result;

	}

	public MyPageDTO selectByid_users(String user_ID) {

		MyPageDTO user = null;

		conn = DBUtil.getConnect();

		try {
			st = conn.prepareStatement(selectByid_users);
			st.setString(1, user_ID);
			rs = st.executeQuery();
			if (rs.next()) {
				user = makeMyPage(rs);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(conn, st, rs);
		}

		return user;
	}

	public List<MyPageDTO> selectBykeyword_user(String search, String keyword) {
		String selectBykeyword_user = "select distinct us.user_ID, us.user_pass, us.user_name, "
				+ "us.user_addr, us.user_tel, us.grade, un.univ_name, us.univ_num" + " from University un, Users us"
				+ " where (un.univ_id = us.univ_id) ";

		if (search.equals("all")) {
			selectBykeyword_user = selectBykeyword_user  + "and (user_name like ? or univ_name like ? or lower(user_id) like ?"
					+ " or user_addr like ? or user_tel like ? or grade like ? or univ_num like ?)";
		} else {

			selectBykeyword_user = selectBykeyword_user + " and " + search + " like ?";

		}
        System.out.println(selectBykeyword_user);
		List<MyPageDTO> userlist = new ArrayList<>();

		conn = DBUtil.getConnect();

		try {
			st = conn.prepareStatement(selectBykeyword_user);
			if (search.equals("all")) {
				st.setString(1, "%" + keyword + "%");
				st.setString(2, "%" + keyword + "%");
				st.setString(3, "%" + keyword.toLowerCase() + "%");
				st.setString(4, "%" + keyword + "%");
				st.setString(5, "%" + keyword + "%");
				st.setString(6, "%" + keyword + "%");
				st.setString(7, "%" + keyword + "%");
			}else{
				st.setString(1, "%" + keyword.toLowerCase() + "%");
			}
			 
			rs = st.executeQuery();
			while (rs.next()) {

				MyPageDTO user = makeMyPage(rs);
				userlist.add(user);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(conn, st, rs);
		}

		return userlist;
	}

	private MyPageDTO makeMyPage(ResultSet rs) throws SQLException {

		String user_ID = rs.getString("user_ID");
		String user_pass = rs.getString("user_pass");
		String user_name = rs.getString("user_name");
		String user_addr = rs.getString("user_addr");
		String user_tel = rs.getString("user_tel");
		String grade = rs.getString("grade");
		String univ_name = rs.getString("univ_name");
		String univ_num = rs.getString("univ_num");

		MyPageDTO user = new MyPageDTO(user_ID, user_pass, user_name, user_addr, user_tel, grade, univ_name, univ_num);
		return user;
	}

}
