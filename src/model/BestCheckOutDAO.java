package model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import util.DBUtil;

public class BestCheckOutDAO {
	
	Connection conn;
	PreparedStatement st;
	ResultSet rs;
	int result;
	
	String selectTop5_book = "select rownum, book_name, book_author, book_year, book_pub, b.book_id"
								+" from BOOK b, (	select count(checkout_num) a, book_id"
													+" from CHECKOUT"
													+" group by book_id"
													+" order by a desc	) c"
								+" where b.book_id = c.book_id "
								+" and rownum<=5";
	
	String selectTop10_weekly = "select rownum, book_name, book_author, book_year, book_pub, b.book_id"
								+" from BOOK b, (	select count(checkout_num) a, book_ID"
												+" from CHECKOUT"
												+" where to_char(checkout_date, 'yyyy-MM-dd') <= TRUNC(sysdate-1,'IW')  "
												+" and to_char(checkout_date, 'yyyy-MM-dd') >= TRUNC(sysdate-8,'IW') "
												+" group by book_ID"
												+" order by a desc	) c"
								+" where b.book_ID = c.book_ID and rownum<=10";
	
	String selectTop10_monthly = "select rownum, book_name, book_author, book_year, book_pub, b.book_id"
								+" from BOOK b, (	select count(checkout_num) a, book_ID"
												+" from CHECKOUT"
												+" where to_char(checkout_date, 'yyyy-MM-dd') <= TRUNC(sysdate,'MM') "
												+" and to_char(checkout_date, 'yyyy-MM-dd') >= ADD_MONTHS( TRUNC(sysdate,'MM'), -1 )"
												+" group by book_ID"
												+" order by a desc	) c"
								+" where b.book_ID = c.book_ID and rownum<=10";
	
	String selectTop5_weekly = "select rownum, book_name, book_author, book_year, book_pub, b.book_id"
			+" from BOOK b, (	select count(checkout_num) a, book_ID"
							+" from CHECKOUT"
							+" where to_char(checkout_date, 'yyyy-MM-dd') <= TRUNC(sysdate-1,'IW')  "
							+" and to_char(checkout_date, 'yyyy-MM-dd') >= TRUNC(sysdate-8,'IW') "
							+" group by book_ID"
							+" order by a desc	) c"
			+" where b.book_ID = c.book_ID and rownum<=5";

	String selectTop5_monthly = "select rownum, book_name, book_author, book_year, book_pub, b.book_id"
			+" from BOOK b, (	select count(checkout_num) a, book_ID"
							+" from CHECKOUT"
							+" where to_char(checkout_date, 'yyyy-MM-dd') <= TRUNC(sysdate,'MM') "
							+" and to_char(checkout_date, 'yyyy-MM-dd') >= ADD_MONTHS( TRUNC(sysdate,'MM'), -1 )"
							+" group by book_ID"
							+" order by a desc	) c"
			+" where b.book_ID = c.book_ID and rownum<=5";
	
	public List<BestCheckOutDTO> selectTop5_book(){
				
		List<BestCheckOutDTO> top5 = new ArrayList<>();
		
		conn = DBUtil.getConnect();
		
		try {
			st = conn.prepareStatement(selectTop5_book);
			rs = st.executeQuery();
			while(rs.next()){
				BestCheckOutDTO book = makeBest(rs);
				top5.add(book);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBUtil.dbClose(conn, st, rs);
		}
	
		return top5; 
	}
	


	public List<BestCheckOutDTO> selectTop10_weekly(){
		
		List<BestCheckOutDTO> top10 = new ArrayList<>();
		
		conn = DBUtil.getConnect();
		
		try {
			st = conn.prepareStatement(selectTop10_weekly);
			rs = st.executeQuery();
			while(rs.next()){
				BestCheckOutDTO book = makeBest(rs);
				top10.add(book);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBUtil.dbClose(conn, st, rs);
		}
	
		return top10; 
	}
	
	public List<BestCheckOutDTO> selectTop10_monthly(){
		
		List<BestCheckOutDTO> top10 = new ArrayList<>();
		
		conn = DBUtil.getConnect();
		
		try {
			st = conn.prepareStatement(selectTop10_monthly);
			rs = st.executeQuery();
			while(rs.next()){
				BestCheckOutDTO book = makeBest(rs);
				top10.add(book);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBUtil.dbClose(conn, st, rs);
		}
	
		return top10; 
	}

	public List<BestCheckOutDTO> selectTop5_weekly(){
		
		List<BestCheckOutDTO> top10 = new ArrayList<>();
		
		conn = DBUtil.getConnect();
		
		try {
			st = conn.prepareStatement(selectTop5_weekly);
			rs = st.executeQuery();
			while(rs.next()){
				BestCheckOutDTO book = makeBest(rs);
				top10.add(book);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBUtil.dbClose(conn, st, rs);
		}
	
		return top10; 
	}
	
	public List<BestCheckOutDTO> selectTop5_monthly(){
		
		List<BestCheckOutDTO> top10 = new ArrayList<>();
		
		conn = DBUtil.getConnect();
		
		try {
			st = conn.prepareStatement(selectTop5_monthly);
			rs = st.executeQuery();
			while(rs.next()){
				BestCheckOutDTO book = makeBest(rs);
				top10.add(book);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBUtil.dbClose(conn, st, rs);
		}
	
		return top10; 
	}

	private BestCheckOutDTO makeBest(ResultSet rs) throws SQLException {
		
		int rownum = rs.getInt("rownum");
		String book_name = rs.getString("book_name");
		String book_author = rs.getString("book_author");
		
		Date book_year = rs.getDate("book_year");
		
		SimpleDateFormat sd = new SimpleDateFormat("yyyy");
		
		String book_pub = rs.getString("book_pub");
		String book_ID = rs.getString("book_ID");
		
		BestCheckOutDTO book = new BestCheckOutDTO(rownum, book_name, book_author, book_year, book_pub, book_ID);
		
		return book;
	}

}
