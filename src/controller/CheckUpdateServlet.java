package controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.CheckDAO;

/**
 * Servlet implementation class CheckUpdateServlet
 */
@WebServlet({ "/jsp/checkUpdate" })
public class CheckUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		CheckDAO cUpdate = new CheckDAO();
		
		//로그인한  user_ID를 호출해왔다
		HttpSession session = request.getSession();
    	String user_ID = (String)session.getAttribute("user_ID"); 
	
    	
		String checkout_num = request.getParameter("checkout_num");
		/*Date return_date = Date.valueOf(request.getParameter("return_date"));*/
		cUpdate.updateExtend(Integer.parseInt(checkout_num),user_ID);
		
		response.sendRedirect("userCheck");
		
		
	}
	

}
