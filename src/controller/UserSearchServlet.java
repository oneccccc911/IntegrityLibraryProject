package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MyPageDAO;
import model.MyPageDTO;


@WebServlet("/jsp/UserSearchServlet")
public class UserSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	String search = request.getParameter("search");
		String keyword = request.getParameter("keyword");
		
		
		MyPageDAO dao = new MyPageDAO();
	
		List<MyPageDTO> userlist = dao.selectBykeyword_user(search, keyword);
		System.out.println(userlist);
	
		

		request.setAttribute("userlist", userlist);
	
		

		RequestDispatcher rd;
		rd = request.getRequestDispatcher("adminUser.jsp");
		rd.forward(request, response);
		
	}



}
