package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.CertificateDTO;
import model.DAO;

/**
 * Servlet implementation class Certificate
 */
@WebServlet("/jsp/certificate")
public class CertificateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CertificateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String univ_num = request.getParameter("univ_num");
		String univ_name = request.getParameter("univ_name");
		int msg = 0;
		//0 -> 정상
		//1 -> 소속이 없음
		//2 -> 이미 회원가입
		
		DAO dao = new DAO();
		CertificateDTO certi = dao.certificate(univ_num, univ_name);
		int result = dao.certificate2(univ_num);
		System.out.println(univ_num+" "+univ_name);
		if(certi == null){
			msg = 1;
			
			request.setAttribute("msg", msg);
			RequestDispatcher rd = request.getRequestDispatcher("certificate.jsp");
			rd.forward(request, response);
		}
		else if(result==1){
			msg = 2;
			
			request.setAttribute("msg", msg);
			RequestDispatcher rd = request.getRequestDispatcher("certificate.jsp");
			rd.forward(request, response);
		}
		else{
			request.setAttribute("univ_name", certi.getUniv_name());
			request.setAttribute("univ_num", certi.getUniv_num());
			request.setAttribute("grade", certi.getGrade());			
			request.setAttribute("msg", msg);
			
			RequestDispatcher rd = request.getRequestDispatcher("joining.jsp");
			rd.forward(request, response);
		}

	}

}
