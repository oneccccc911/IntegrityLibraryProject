package model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import util.DBUtil;

public class copyDAO {

	Connection conn;
	PreparedStatement st;
	ResultSet rs;
	int result;
	
	
	//관리자 검색
	String selectCopy_sql = "select * from Copy where book_ID like ? order by copy_ID";

	public List<CopyDTO> selectByID(String book_ID) {
		List<CopyDTO> copylist = new ArrayList<CopyDTO>();
		conn = DBUtil.getConnect();
		try {
			st = conn.prepareStatement(selectCopy_sql);
			st.setString(1,book_ID );
			rs = st.executeQuery();
			while (rs.next()) {
				CopyDTO cp = makeCopy(rs);
				copylist.add(cp);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(conn, st, rs);
		}
		return copylist;
	}
	private CopyDTO makeCopy(ResultSet rs) throws SQLException{
		String copy_ID = rs.getString("copy_ID");
		String book_ID = rs.getString("book_ID");
		Date buy_date = rs.getDate("buy_date");
		CopyDTO cp = new CopyDTO(book_ID, copy_ID, buy_date);
		return cp;
	}
	

}
