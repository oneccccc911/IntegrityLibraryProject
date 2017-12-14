package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import model.MyPageDAO;
import model.MyPageDTO;



@WebServlet("/jsp/MyPage2")
public class MyPageSevlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String user_ID = request.getParameter("user_ID");

		
		MyPageDAO dao = new MyPageDAO();
		MyPageDTO user = dao.selectByid_users(user_ID);

		request.setAttribute("user", user);
		
		RequestDispatcher rd;
		rd = request.getRequestDispatcher("mypage2.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		MyPageDTO user = new MyPageDTO(); 

		String user_ID = request.getParameter("user_ID");
		user.setUser_ID(user_ID);
		
		String user_pass = request.getParameter("user_pass");
		user.setUser_pass(user_pass);		
		
		String user_name = request.getParameter("user_name");
		user.setUser_name(user_name);
		
		String user_addr = request.getParameter("user_addr"); 
		user.setUser_addr(user_addr);
		
		String user_tel = request.getParameter("user_tel");
		user.setUser_tel(user_tel);		
		
		String grade = request.getParameter("grade");
		user.setGrade(grade);
		
		String univ_name = request.getParameter("univ_name");
		user.setUniv_name(univ_name);
		
		String univ_num = request.getParameter("univ_num");
		user.setUniv_name(univ_num);
		
		MyPageDAO dao = new MyPageDAO();
		dao.update_users(user);
		
		
		response.sendRedirect("UserList");

		
	}

}
