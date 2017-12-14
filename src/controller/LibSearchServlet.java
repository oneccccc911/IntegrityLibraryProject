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
 * Servlet implementation class LibraryInfoSearchServlet
 */
@WebServlet("/jsp/LibSearch")
public class LibSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	   	 String lib_ID = request.getParameter("keyword");
		 String lib_name=request.getParameter("keyword");
		 String lib_addr=request.getParameter("keyword");
		 String lib_tel=request.getParameter("keyword");
		 String univ_name=request.getParameter("keyword");
			
		 LibraryDAO dao = new LibraryDAO();
		 
		 List<LibraryDTO> librarylist = dao.selectBykeyword_lib(lib_ID, lib_name, lib_addr, lib_tel, univ_name);
		 		 
		 request.setAttribute("liblist", librarylist);
		 
		 RequestDispatcher rd;
		 rd=request.getRequestDispatcher("libraryInfo.jsp");
		 rd.forward(request, response);
		 
		 
	
	}

	
}
