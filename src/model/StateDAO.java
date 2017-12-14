package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import util.DBUtil;

public class StateDAO {
	Connection conn;
	PreparedStatement st;
	ResultSet rs;
	int result;
	
	String selectBook_total = "select count(*) from book";
	
	String selectChReturn_today = "select count(return_date)"
									+" from checkout"
									+" where return_date like to_date(sysdate,'yyyy/MM/dd')";
	
	String selectChReserve_total = "select count(reserve_num)"
									+" from reserve";
	
	String selectNew_weekly = "select count(*)"
					+" from copy"
					+" where buy_date <= TRUNC(sysdate-1,'IW')"
					+" and buy_date >= TRUNC(sysdate-8,'IW')";	
									
	String selectCheckout_total = "select count(checkout_num) from checkout";
	
	
			
	public int selectBook_total(){
		
		conn = DBUtil.getConnect();
		
		try {
			st = conn.prepareStatement(selectBook_total);
			rs = st.executeQuery();
			if(rs.next()){
				result = rs.getInt(1);
				
			}
				
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		return result;
	}
	
	public int selectChReturn_today(){
		
		conn = DBUtil.getConnect();
		
		try {
			st = conn.prepareStatement(selectChReturn_today);
			rs = st.executeQuery();
			if(rs.next()){
				result = rs.getInt(1);
				
			}
				
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		return result;
	}

	public int selectChReserve_total(){
		
		conn = DBUtil.getConnect();
		
		try {
			st = conn.prepareStatement(selectChReserve_total);
			rs = st.executeQuery();
			if(rs.next()){
				result = rs.getInt(1);
				
			}
				
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		return result;
	}

	public int selectNew_weekly(){
		
		conn = DBUtil.getConnect();
		
		try {
			st = conn.prepareStatement(selectNew_weekly);
			rs = st.executeQuery();
			if(rs.next()){
				result = rs.getInt(1);
				System.out.println(result);
			}
				
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		return result;
	}

	public int selectCheckout_total(){
		
		conn = DBUtil.getConnect();
		
		try {
			st = conn.prepareStatement(selectCheckout_total);
			rs = st.executeQuery();
			if(rs.next()){
				result = rs.getInt(1);
				
			}
				
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		return result;
	}

}
