package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BookDTO;
import model.BookListDAO;
import model.BookNewDTO;




/**
 * Servlet implementation class booklistservlet
 */ 
@WebServlet("/jsp/bookList")
public class bookListservlet extends HttpServlet {
	private static final long serialVersionUID =1L;
       
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		RequestDispatcher rd = request.getRequestDispatcher("bookList.jsp");
		rd.forward(request, response);
	}


}
