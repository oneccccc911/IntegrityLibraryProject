package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DAO;
import model.UserDTO;

/**
 * Servlet implementation class Joining
 */
@WebServlet("/jsp/joining")
public class JoiningServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JoiningServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String user_ID = request.getParameter("user_ID");
		String user_pass = request.getParameter("user_pass");
		String user_name = request.getParameter("user_name");
		String user_addr = request.getParameter("user_addr");
		String user_tel = request.getParameter("user_tel");
		String grade = request.getParameter("grade");
		String univ_name = request.getParameter("univ_name");
		String univ_num = request.getParameter("univ_num");
		
		DAO dao = new DAO();
		UserDTO user = new UserDTO(user_ID, user_pass, user_name, user_addr, 
								user_tel, grade, univ_name, univ_num);
		
		System.out.println(user);
		
		dao.joining(user);
		
		response.sendRedirect("../index.jsp");
	}

}
