package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.UserService;

@WebServlet("/userDelete")
public class UserDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserService service;
	
	public UserDelete() {
		service = new UserService();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		HttpSession session = request.getSession();
		if(session.getAttribute("userID") != null) {
			service.deleteUser(session.getAttribute("userID").toString());
			session.removeAttribute("userID");
			response.sendRedirect("/index.jsp");
		} else {
			response.sendRedirect(request.getRequestURL().toString());
		}
	}

}
