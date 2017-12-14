package model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import util.DBUtil;

public class BookListDAO {

	Connection conn;
	PreparedStatement st;
	ResultSet rs;
	int result;
	//신간 검색
	String selectByMonth_sql = "select * from "
			+ "(select * from Book inner join Library using (lib_ID) "
			+ "where sysdate-book_year <= 60 order by book_year desc) where rownum <= 5";
	
	public List<BookNewDTO> selectNewBook() {
		List<BookNewDTO> booklist = new ArrayList<BookNewDTO>();
		conn = DBUtil.getConnect();
		try {
			st = conn.prepareStatement(selectByMonth_sql);
			rs = st.executeQuery();
			while (rs.next()) {
				BookNewDTO book = makeBook(rs);
				booklist.add(book);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(conn, st, rs);
		}
		return booklist;
	}
	//일반 검색
	String selectByTitle_sql = "select * from (Book inner join Library using (lib_ID)) "
			+ "where lower(book_name) like ? and rownum<=10 order by book_ID, book_name";

	public List<BookNewDTO> selectByTitle(String book_name) {
		List<BookNewDTO> booklist = new ArrayList<BookNewDTO>();
		conn = DBUtil.getConnect();
		try {
			st = conn.prepareStatement(selectByTitle_sql);
			st.setString(1, "%"+book_name.toLowerCase()+"%");
			rs = st.executeQuery();
			while (rs.next()) {
				BookNewDTO bk = makeBook(rs);
				booklist.add(bk);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(conn, st, rs);
		}
		return booklist;
	}

	private BookNewDTO makeBook(ResultSet rs) throws SQLException {
		String book_ID = rs.getString("book_ID");
		String book_name = rs.getString("book_name");
		String book_author = rs.getString("book_author");
		String book_cate = rs.getString("book_cate");
		Date book_year = rs.getDate("book_year");
		int book_page = rs.getInt("book_page");
		String book_pub = rs.getString("book_pub");
		String lib_ID = rs.getString("lib_ID");
		String lib_name = rs.getString("lib_name");
		BookNewDTO book = new BookNewDTO(book_ID, book_name, book_author, book_cate, book_year, book_page, book_pub, lib_ID, lib_name);
		return book;
	}

}
