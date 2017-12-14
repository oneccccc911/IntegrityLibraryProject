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

import model.CheckDTO;
import model.CheckDAO;

@WebServlet("/jsp/userCheck")
public class CheckOutListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("userCheck....");
    	//로그인할때 저장된 세션값을 읽어오기 
    	HttpSession session = request.getSession();
    	String user_ID = (String)session.getAttribute("user_ID"); 
    	    	
   		CheckDAO dao = new CheckDAO();
   		List<CheckDTO> checklist = dao.myCheckOut(user_ID);
   		System.out.println(checklist);
   		request.setAttribute("checklist", checklist);
		
		RequestDispatcher rd;
		rd=request.getRequestDispatcher("checkResult.jsp");
		rd.forward(request, response);
	}
}


