package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.LibraryDTO;
import model.LibraryDAO;

/**
 * Servlet implementation class LibraryInfoServlet
 */
@WebServlet("/jsp/libList")
public class LibListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		LibraryDAO dao =new LibraryDAO();
		List<LibraryDTO> liblist = dao.libraryInfo();
		request.setAttribute("liblist", liblist);
	
		
		RequestDispatcher rd;
		rd = request.getRequestDispatcher("libraryInfo.jsp");
		rd.forward(request, response);
				
	}
	
	
	
	
	
	
	
}