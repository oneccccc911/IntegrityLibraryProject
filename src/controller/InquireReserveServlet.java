package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.DAO;
import model.InquireReserveDTO;

/**
 * Servlet implementation class InquireReserve
 */
@WebServlet("/jsp/inquireReserve")
public class InquireReserveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InquireReserveServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*String user_ID = request.getParameter("user_ID");
		List<InquireReserveDTO> inquireList = null;
		
		DAO dao = new DAO();
		if(user_ID.equals("admin")){
			inquireList = dao.adminInquireReserve();
		}else{
			inquireList = dao.inquireReserve(user_ID);
		}
		request.setAttribute("inquireList", inquireList);
		
		RequestDispatcher rd = request.getRequestDispatcher("inquireReserve.jsp");
		rd.forward(request, response);*/
		HttpSession session = request.getSession();
		String user_ID = (String)session.getAttribute("user_ID");
		
		//System.out.println(user_ID+"유저1");
		List<InquireReserveDTO> inquireList = null;
		
		DAO dao = new DAO();
		if(user_ID.equals("admin")){
			inquireList = dao.adminInquireReserve();
		}else{
			inquireList = dao.inquireReserve(user_ID);
		}
		request.setAttribute("inquireList", inquireList);
		//----------request.setAttribute("user_ID", user_ID);
		//System.out.println(user_ID+"유저2");
		RequestDispatcher rd = request.getRequestDispatcher("inquireReserve.jsp");
		rd.forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
