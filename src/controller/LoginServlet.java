package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.UserDTO;
import model.LoginDAO;

@WebServlet("/jsp/userLogin")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		RequestDispatcher rd;
		rd = request.getRequestDispatcher("login.jsp");
		rd.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String user_ID = request.getParameter("user_ID");
		String user_pass = request.getParameter("user_pass");

		LoginDAO dao = new LoginDAO();
		UserDTO user = dao.login(user_ID, user_pass);
		HttpSession session = request.getSession();

		int login_result = 0;
	
		if (user == null) {
			login_result = 4;//로그인 안됨
			
			request.setAttribute("msg", login_result);
			
			RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
			rd.forward(request, response);
			
			
			//session.invalidate();
			/*session.setAttribute("user_ID", "fail");
			session.setAttribute("user_pass", null);
			session.setAttribute("user", null);
			response.sendRedirect("userLogin"); // login실패시 이동하는 페이지 -회원가입 및
												// 로그인페이지로 이동
*/
		} else {
			login_result = 1;//로그인 성공
			session.setAttribute("user_ID", user_ID);
			session.setAttribute("user_pass", user_pass);
			session.setAttribute("user", user);
			response.sendRedirect("../index.jsp");
		}

	}

}
