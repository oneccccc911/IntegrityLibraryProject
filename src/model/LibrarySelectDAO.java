package model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import util.DBUtil;

public class LibrarySelectDAO {
	Connection conn;
	PreparedStatement st;
	ResultSet rs;
	int result;
	String libraryAll_sql = "select * from Library";
	

	//부서조회
	public List<LibrarySelectDTO> selectLibAll() {
		List<LibrarySelectDTO> librarylist = new ArrayList<LibrarySelectDTO>();
		conn = DBUtil.getConnect();
		try {
			st = conn.prepareStatement(libraryAll_sql);
			rs = st.executeQuery();
			while (rs.next()) {
				String lib_ID = rs.getString(1);
				String lib_name = rs.getString(2);
				String lib_addr = rs.getString(3);
				String lib_tel = rs.getString(4);
				Date lib_open = rs.getDate(5);
				Date lib_close = rs.getDate(6);
				String univ_ID = rs.getString(7);
				LibrarySelectDTO library = new LibrarySelectDTO(lib_ID, lib_name, lib_addr, lib_tel, lib_open, lib_close, univ_ID);
				librarylist.add(library);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(conn, st, rs);
		}
		return librarylist;
	}

}
