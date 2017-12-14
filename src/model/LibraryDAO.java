package model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

import model.LibraryDTO;
import util.DBUtil;

public class LibraryDAO {

	Connection conn;
	PreparedStatement st;
	ResultSet rs;
	int result;

	String libraryInfo_sql = "select lib_ID, lib_name, lib_addr, lib_tel, lib_open, lib_close, univ_name from Library lib inner join University univ using (univ_ID) order by lib_ID ";
	String libraryInfoByName_sql = libraryInfo_sql + " where lib_name=? ";
	String selectBykeyword_lib = 
			"select lib_ID, lib_name, lib_addr, lib_tel, lib_open, lib_close, univ_name from Library lib, University uni "
					+ " where (lib.univ_ID=uni.univ_ID) and (lib.lib_ID like ? or lib.lib_name like ?  or lib.lib_addr like ? or lib.lib_tel like ? or uni.univ_name like ? ) order by lib_ID ";

	// 키워드로 도서관정보에 대해 각각 검색할때
	public List<LibraryDTO> selectBykeyword_lib(String lib_ID, String lib_name, String lib_addr, String lib_tel, String univ_name) {

		List<LibraryDTO> librarylist = new ArrayList<>();
		
		conn = DBUtil.getConnect();

		try {
			
			st = conn.prepareStatement(selectBykeyword_lib);
			st.setString(1, "%" + lib_ID + "%");
			st.setString(2, "%" + lib_name + "%");
			st.setString(3, "%" + lib_addr + "%");
			st.setString(4, "%" + lib_tel + "%");
			st.setString(5, "%" + univ_name + "%");
			
			rs = st.executeQuery();
			
			while (rs.next()) {

				LibraryDTO lib = makeLib(rs);
				librarylist.add(lib);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(conn, st, rs);
		}

		return librarylist;

	}

	// libraryInfo 학교의 모든 정보를 보여줄때
	public List<LibraryDTO> libraryInfo() {
		List<LibraryDTO> liblist = new ArrayList<>();
		conn = DBUtil.getConnect();

		try {
			st = conn.prepareStatement(libraryInfo_sql);
			rs = st.executeQuery();

			while (rs.next()) {
				LibraryDTO lib = makeLib(rs);
				liblist.add(lib);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(conn, st, rs);
		}

		return liblist;

	}

/*	// 선택한 학교의 정보를 보여줄 때
	public LibraryDTO libraryInfoByName(String lib_name) {
		conn = DBUtil.getConnect();
		LibraryDTO lib = null;

		try {
			st = conn.prepareStatement("libraryInfoByName_sql");
			st.setString(1, "lib_name");
			rs = st.executeQuery();
			while (rs.next()) {
				lib = makeLib(rs);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(conn, st, rs);
		}
		return lib;
	}
*/
	private LibraryDTO makeLib(ResultSet rs) throws SQLException {

		String lib_ID = rs.getString("lib_ID");
		String lib_name = rs.getString("lib_name");
		String lib_addr = rs.getString("lib_addr");
		String lib_tel = rs.getString("lib_tel");
		String lib_open = rs.getString("lib_open");
		String lib_close = rs.getString("lib_close");
		String univ_name = rs.getString("univ_name");
	

		LibraryDTO lib = new LibraryDTO(lib_ID, lib_name, lib_addr, lib_tel, lib_open, lib_close, univ_name);
		
		return lib;
	}
	
	
	
}
