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

import model.BookCopyDTO;
import model.BookDTO;
import model.BookNewDTO;
import model.LibraryDTO;
import model.LibrarySelectDAO;
import model.adminDAO;
import util.DateUtil;

/**
 * Servlet implementation class bookinsertservlet
 */
@WebServlet("/jsp/copyInsert")
public class copyInsertservlet extends HttpServlet {
	private static final long serialVersionUID = 1L; 
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public copyInsertservlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//입력폼 보여주기
		RequestDispatcher rd = request.getRequestDispatcher("copyInsert.jsp");
		rd.forward(request, response);
	}
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// db에 입력하기
		request.setCharacterEncoding("utf-8");
		BookCopyDTO booklist = makeCopy(request);
		adminDAO dao = new adminDAO();
		dao.copyInsert(booklist);
		
		response.sendRedirect("adminTitle");
		
	}
	private BookCopyDTO makeCopy(HttpServletRequest request) throws UnsupportedEncodingException{
		request.setCharacterEncoding("utf-8");
		String book_ID = request.getParameter("book_ID");
		String book_name = request.getParameter("book_name");
		String book_author = request.getParameter("book_author");
		String book_cate = request.getParameter("book_cate");
		String dt1 = request.getParameter("book_year");
		Date book_year=null;
		if(dt1!=null)
			book_year = DateUtil.toSqlDate(dt1);
		String page = request.getParameter("book_page");
		int book_page = 0;
		if(page!=null)
			book_page = Integer.parseInt(page);
		String book_pub = request.getParameter("book_pub");
		String lib_name = request.getParameter("lib_name");
		String lib_ID = request.getParameter("lib_ID");
		String copy_ID = request.getParameter("copy_ID");
		String dt2 = request.getParameter("buy_date");
		Date buy_date = DateUtil.toSqlDate(dt2);
				
		BookCopyDTO booklist = new BookCopyDTO(book_ID, book_name, book_author, book_cate, book_year, book_page, book_pub, lib_ID, copy_ID, buy_date, lib_name);
		return booklist;
	}

}
