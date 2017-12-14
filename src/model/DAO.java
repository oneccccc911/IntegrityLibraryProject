package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import util.DBUtil;

public class DAO {
	Connection conn;
	PreparedStatement st;
	ResultSet rs;
	int result;

	String certificate1_sql = "select univ_num, univ_name, grade " 
						+ "from BelongTo b join University u "
						+ "on b.univ_ID = u.univ_ID " 
						+ "where b.univ_num = ? " + "and u.univ_name = ?";
						//가입유효한지 인증
	
	String certificate2_sql = "select user_ID " 
						+ "from Users "
						+ "where univ_num = ? ";
						// 회원가입 여부 인증
	
	String joining_sql = "insert into Users values(?,?,?,?,?,?," 
						+ "(select univ_ID " 
						+ "from University "
						+ "where univ_name = ?)" 
						+ ",?)";
						// ID,Password,이름,주소,연락처,등급,학교ID,학번

	String inquireReserve_sql = "select reserve_num, wait_num, book_name, r.book_ID, copy_ID "
						+ "from Reserve r join Book b " 
						+ "on r.book_ID = b.book_ID " 
						+ "where user_ID = ?";
						// 예약번호,대기번호,도서이름,도서ID,사본ID

	String deleteInquire_sql = "delete from Reserve where reserve_num = ?";
	
	String adminInquireReserve_sql = "select reserve_num, wait_num, book_name, r.book_ID, copy_ID "
						+ "from Reserve r join Book b " 
						+ "on r.book_ID = b.book_ID";
	
	String idCheck_sql = "select * from Users where user_ID = ?";
	
	public CertificateDTO certificate(String univ_num, String univ_name) {
		conn = DBUtil.getConnect();
		CertificateDTO certi = null;

		try {
			st = conn.prepareStatement(certificate1_sql);
			st.setString(1, univ_num);
			st.setString(2, univ_name);
			rs = st.executeQuery();
			while (rs.next()) {
				certi = new CertificateDTO(rs.getString(1), rs.getString(2), rs.getString(3));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(conn, st, rs);
		}

		return certi;
	}

	public int certificate2(String univ_num) {// 회원가입 여부 인증
		conn = DBUtil.getConnect();

		try {
			st = conn.prepareStatement(certificate2_sql);
			st.setString(1, univ_num);
			rs = st.executeQuery();
			if (rs.next()) {
				result = 1;// 이미 회원가입함
			} else {
				result = 0;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(conn, st, rs);
		}

		return result;
	}

	public int idCheck(String user_ID) {// 회원가입 id 중복 검사
		conn = DBUtil.getConnect();

		try {
			st = conn.prepareStatement(idCheck_sql);
			st.setString(1, user_ID);
			rs = st.executeQuery();
			
			if (rs.next()) {
				result = 1;// 중복
			} else {
				result = 0;// 가능
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(conn, st, rs);
		}

		return result;
	}
	
	public int joining(UserDTO user) {
		conn = DBUtil.getConnect();
		try {
			st = conn.prepareStatement(joining_sql);
			st.setString(1, user.getUser_ID());
			st.setString(2, user.getUser_pass());
			st.setString(3, user.getUser_name());
			st.setString(4, user.getUser_addr());
			st.setString(5, user.getUser_tel());
			st.setString(6, user.getGrade());
			st.setString(7, user.getUniv_ID());
			st.setString(8, user.getUniv_num());
			result = st.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(conn, st, rs);
		}
		return result;
	}

	public List<InquireReserveDTO> inquireReserve(String user_ID) {
		conn = DBUtil.getConnect();
		List<InquireReserveDTO> inquireList = new ArrayList<InquireReserveDTO>();

		try {
			st = conn.prepareStatement(inquireReserve_sql);
			st.setString(1, user_ID);
			rs = st.executeQuery();
			while (rs.next()) {
				inquireList.add(
						new InquireReserveDTO(rs.getInt(1), 
									rs.getInt(2), 
									rs.getString(3), 
									rs.getString(4),
									rs.getString(5)));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(conn, st, rs);
		}
		return inquireList;
	}
	
	public List<InquireReserveDTO> adminInquireReserve(){
		conn = DBUtil.getConnect();
		List<InquireReserveDTO> inquireList = new ArrayList<InquireReserveDTO>();

		try {
			st = conn.prepareStatement(adminInquireReserve_sql);
			rs = st.executeQuery();
			while (rs.next()) {
				inquireList.add(
						new InquireReserveDTO(rs.getInt(1), 
									rs.getInt(2), 
									rs.getString(3), 
									rs.getString(4),
									rs.getString(5)));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(conn, st, rs);
		}
		return inquireList;
	}
	
	public int deleteInquire(int reserve_num){
		result = 0;
		
		conn = DBUtil.getConnect();	
		try {
			st = conn.prepareStatement(deleteInquire_sql);
			st.setInt(1, reserve_num);
			
			result = st.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(conn, st, rs);
		}
		
		return result;
	}

}