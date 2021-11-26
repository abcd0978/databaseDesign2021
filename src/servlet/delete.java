package servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.userDAO;

/**
 * Servlet implementation class delete
 */
@WebServlet("/deleteu")
public class delete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public delete() {
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
		String user_id = request.getSession().getAttribute("userID").toString();
		boolean result=false;
		if(user_id!=null)
		{
			userDAO udao = new userDAO();
			try {
				result = udao.delete(user_id);
			} catch (ClassNotFoundException | SQLException e) {

				e.printStackTrace();
			}
		}
		if(result)
		{
			response.getWriter().print(true);
		}
		else
		{
			response.getWriter().print(false);
		}
	}

}
