package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.adminDTO;
import model.adminDAO;

/**
 * Servlet implementation class bookBrowseservlet
 */

@WebServlet("/jsp/adminTitle")
public class adminTitleservlet extends HttpServlet {
	private static final long serialVersionUID = 1L; 
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminTitleservlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String book_name = request.getParameter("book_name");//boo_name이 input의 name으로 감
		adminDAO dao = new adminDAO();
		List<adminDTO> booklist = dao.selectByTitle(book_name);
		request.setAttribute("booklist", booklist);
		
		RequestDispatcher rd = request.getRequestDispatcher("adminTitle.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
