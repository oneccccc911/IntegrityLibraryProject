package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BestCheckOutDAO;
import model.BestCheckOutDTO;
import model.BookListDAO;
import model.BookNewDTO;
import model.StateDAO;

/**
 * Servlet implementation class Exam
 */
@WebServlet("/startServlet")
public class StartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		StateDAO stateDao = new StateDAO();
		int result = stateDao.selectNew_weekly();
		int result1 = stateDao.selectCheckout_total();
		int result2 = stateDao.selectChReserve_total();
		int result3 = stateDao.selectBook_total();
		int result4 = stateDao.selectChReturn_today();

		request.setAttribute("result", result);
		request.setAttribute("result1", result1);
		request.setAttribute("result2", result2);
		request.setAttribute("result3", result3);
		request.setAttribute("result4", result4);
		
		BestCheckOutDAO bestDao = new BestCheckOutDAO();
		List<BestCheckOutDTO> booklist = bestDao.selectTop5_book();
		List<BestCheckOutDTO> booklist1 = bestDao.selectTop5_weekly();
		List<BestCheckOutDTO> booklist2 = bestDao.selectTop5_monthly();
		request.setAttribute("booklist", booklist);
		request.setAttribute("booklist1", booklist1);
		request.setAttribute("booklist2", booklist2);
		
		BookListDAO newBookDao = new BookListDAO();
		List<BookNewDTO> newBookList = newBookDao.selectNewBook();
		request.setAttribute("newBookList", newBookList);
				
		RequestDispatcher rd =  request.getRequestDispatcher("index2.jsp");
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
