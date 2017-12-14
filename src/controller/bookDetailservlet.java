package controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.adminDAO;
import model.adminDTO;

import util.DateUtil;

/**
 * Servlet implementation class empdetailservlet
 */
@WebServlet("/jsp/bookDetail") 
public class bookDetailservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public bookDetailservlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// a태그는 무조건 get.
		String book_ID = request.getParameter("book_ID");
		adminDAO dao = new adminDAO();
		List<adminDTO> detail = dao.selectAllBook(book_ID);
		request.setAttribute("booklist", detail);

		RequestDispatcher rd = request.getRequestDispatcher("bookDetail.jsp");
		rd.forward(request, response);
	}

	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}