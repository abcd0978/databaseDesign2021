package servlet;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.userDTO;
import service.UserService;

@WebServlet("/join")
public class UserJoin extends HttpServlet{
	private static final long serialVersionUID = 1L;
	private UserService service;
	
	public UserJoin() {
		service = new UserService();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		request.setCharacterEncoding("UTF-8");
		String reqURL = request.getRequestURL().toString();
		userDTO dto = new userDTO();
		dto.setUser_id(request.getParameter("user_id"));
		dto.setAddress(request.getParameter("address"));
		dto.setBirth(convertDate(request.getParameter("birth").toString()));
		dto.setName(request.getParameter("name"));
		dto.setEmail(request.getParameter("email"));
		dto.setPhone(request.getParameter("phone"));
		dto.setJob(request.getParameter("job"));
		dto.setIs_client(convertIsClient(request.getParameter("is_client").toString()));
		dto.setPassword(request.getParameter("password"));
		
		
		boolean result = service.insertUser(dto);
		if(result) {
			response.sendRedirect("/index.jsp");
		} else { //실패시
			response.sendRedirect("/join.jsp");
		}
	}
	
	private java.sql.Date convertDate(String d) {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		try {
			return new java.sql.Date(format.parse(d).getTime());
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	private boolean convertIsClient(String i) {
		if(i.equals("true")) {
			return true;
		} else {
			return false;
		}
	}
}