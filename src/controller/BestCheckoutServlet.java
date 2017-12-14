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


@WebServlet("/jsp/BestCheckout")
public class BestCheckoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BestCheckOutDAO dao = new BestCheckOutDAO();
		List<BestCheckOutDTO> booklist = dao.selectTop5_book();
		List<BestCheckOutDTO> booklist1 = dao.selectTop10_weekly();
		List<BestCheckOutDTO> booklist2 = dao.selectTop10_monthly();
		List<BestCheckOutDTO> booklist3 = dao.selectTop5_weekly();
		List<BestCheckOutDTO> booklist4 = dao.selectTop5_monthly();
		request.setAttribute("booklist", booklist);
		request.setAttribute("booklist1", booklist1);
		request.setAttribute("booklist2", booklist2);
		request.setAttribute("booklist3", booklist3);
		request.setAttribute("booklist4", booklist4);

		
		RequestDispatcher rd;
		rd = request.getRequestDispatcher("bestCheckout.jsp");
		rd.forward(request, response);
	}


}
