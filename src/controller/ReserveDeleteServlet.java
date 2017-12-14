package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.DAO;
import model.ReserveDAO;

/**
 * Servlet implementation class ReserveDelete
 */
@WebServlet("/jsp/reserveDelete")
public class ReserveDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReserveDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*int reserve_num = Integer.parseInt(request.getParameter("reserve_num"));
		DAO dao = new DAO();
		dao.deleteInquire(reserve_num);
		
		response.sendRedirect("inquireReserve?user_ID=admin");*/
		int reserve_num = Integer.parseInt(request.getParameter("reserve_num"));
		String copy_ID = request.getParameter("copy_ID");
		String book_ID = request.getParameter("book_ID");
		
		ReserveDAO dao = new ReserveDAO();
		
		HttpSession session = request.getSession();
		String user_ID = (String)session.getAttribute("user_ID");
		
		dao.cancelReserve_sql_update(book_ID, copy_ID, reserve_num, user_ID);
		dao.cancelReserve_sql_delete(reserve_num, user_ID);
		
		response.sendRedirect("inquireReserve?user_ID="+user_ID);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
