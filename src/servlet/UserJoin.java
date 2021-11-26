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
		String reqURL = request.getRequestURL().toString();
		userDTO dto = new userDTO();
		dto.setUser_id(request.getAttribute("user_id").toString());
		dto.setAddress(request.getAttribute("address").toString());
		dto.setBirth(convertDate(request.getAttribute("birth").toString()));
		dto.setName(request.getAttribute("name").toString());
		dto.setEmail(request.getAttribute("email").toString());
		dto.setPhone(request.getAttribute("phone").toString());
		dto.setJob(request.getAttribute("job").toString());
		dto.setIs_client(convertIsClient(request.getAttribute("is_client").toString()));
		dto.setPassword(request.getAttribute("password").toString());
		
		
		boolean result = service.insertUser(dto);
		if(result) {
			response.sendRedirect("/index.jsp");
		} else { //실패시
			response.sendRedirect(reqURL);
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
		if(i.equals(true)) {
			return true;
		} else {
			return false;
		}
	}
}