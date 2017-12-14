package controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
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
@WebServlet("/jsp/adminDetail")
public class adminDetailservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public adminDetailservlet() {
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
		String copy_ID = request.getParameter("copy_ID");
		adminDAO dao = new adminDAO();
		adminDTO detail = dao.selectExactBook(book_ID, copy_ID);
		request.setAttribute("booklist", detail);

		RequestDispatcher rd = request.getRequestDispatcher("adminDetail.jsp");
		rd.forward(request, response);
	}

	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		adminDTO book = makeBook(request);
		adminDAO dao = new adminDAO();
		int result = dao.bookUpdate(book);

		String message = result > 0 ? "수정성공" : "수정실패";
		request.setAttribute("msg", message);
		RequestDispatcher rd = request.getRequestDispatcher("adminTitle.jsp");
		rd.forward(request, response);

	}
	private adminDTO makeBook(HttpServletRequest request) throws UnsupportedEncodingException {
		String book_ID = request.getParameter("book_ID");
		String book_name = request.getParameter("book_name");
		String book_author = request.getParameter("book_author");
		String book_cate = request.getParameter("book_cate");
		String dt = request.getParameter("book_year");
		Date book_year = DateUtil.toSqlDate(dt);
		String page = request.getParameter("book_page");
		int book_page = Integer.parseInt(page);
		String book_pub = request.getParameter("book_pub");
		String lib_ID = request.getParameter("lib_ID");
		String lib_name = request.getParameter("lib_name");
		String copy_ID = request.getParameter("copy_ID");
		adminDTO book = new adminDTO(book_ID, book_name, book_author, book_cate, book_year, book_page, book_pub, lib_ID,
				lib_name, copy_ID);
		return book;
	}


}