package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.userDAO;
import dto.userDTO;
/**
 * Servlet implementation class manage
 */
@WebServlet("/manage")
public class manage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public manage() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		boolean result=false;
		request.setCharacterEncoding("utf-8");
		String user_id = request.getSession().getAttribute("userID").toString();
		String name = request.getParameter("name");
		String address = request.getParameter("address");
		String birth = request.getParameter("birth");
		String email = request.getParameter("email");
		String phone = request.getParameter("num");
		String job = request.getParameter("job");
		System.out.println(user_id+" "+name+" "+address+" "+birth+" "+email+" "+phone+" "+job);
		userDAO udao = new userDAO();
		try {
			result = udao.update(name, address, birth, email, phone, job, user_id);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		if(result)
		{
			out.print("<html>");
			out.print("개인정보를 저장했습니다.");
			out.print("<br> <a href=\"/DatabaseDesign/client/manageUser.jsp\">뒤로가기</a>");
			out.println("</html>");
		}
		else
		{
			out.print("<html>");
			out.print("실패하였습니다.");
			out.print("<br> <a href=\"/DatabaseDesign/client/manageUser.jsp\">뒤로가기</a>");
			out.println("</html>");
		}
	}

}
