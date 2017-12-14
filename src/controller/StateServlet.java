package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import model.StateDAO;


@WebServlet("/jsp/StateServlet")
public class StateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		StateDAO dao = new StateDAO();
		int result = dao.selectBook_total();
		int result1 = dao.selectChReturn_today();
		int result2 = dao.selectChReserve_total();
		int result3 = dao.selectNew_weekly();
		int result4 = dao.selectCheckout_total();

		request.setAttribute("result", result);
		request.setAttribute("result1", result1);
		request.setAttribute("result2", result2);
		request.setAttribute("result3", result3);
		request.setAttribute("result4", result4);
		
		RequestDispatcher rd;
		rd = request.getRequestDispatcher("state.jsp");
		rd.forward(request, response);
	}


}
