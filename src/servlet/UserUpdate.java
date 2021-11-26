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

import org.apache.naming.java.javaURLContextFactory;

import dto.userDTO;
import service.UserService;

@WebServlet("/userUpdate")
public class UserUpdate extends HttpServlet{
	private static final long serialVersionUID = 1L;
	private UserService service;
	
	public UserUpdate() {
		service = new UserService();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String reqURL = request.getRequestURL().toString();
		userDTO dto = new userDTO();
		dto.setUser_id(request.getAttribute("userID").toString());
		dto.setAddress(request.getAttribute("address").toString());
		dto.setName(request.getAttribute("name").toString());
		dto.setBirth(convertDate(request.getAttribute("birth").toString()));
		dto.setEmail(request.getAttribute("email").toString());
		dto.setPhone(request.getAttribute("phone").toString());
		dto.setJob(request.getAttribute("job").toString());
		dto.setIs_client(convertIsClient(request.getAttribute("isClient").toString()));
		dto.setPassword(request.getAttribute("password").toString());
		boolean result = service.updateUser(dto);
		//성공시
		if(result) {
			response.sendRedirect(parseParent(reqURL));
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
	
	private String parseParent(String url) {
		String[] tmp = url.split("/");
		StringBuilder result = new StringBuilder();
		result.append("/");
		for(int i = 1;i<tmp.length -1;i++) {
			result.append(tmp[i]);
		}
		return result.toString();
	}
}