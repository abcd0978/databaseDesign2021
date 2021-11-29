package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.accountDAO;

/**
 * Servlet implementation class deposit
 */
@WebServlet("/deposit")
public class deposit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deposit() {
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
		int result=0;
		accountDAO adao = new accountDAO();
		String id = request.getParameter("account_id");
		String amount = request.getParameter("amount");
		try {
			result = adao.deposit(Integer.parseInt(id),Integer.parseInt(amount));
		} catch (NumberFormatException | ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		// 입금 -1:오류, -2:존재하지 않는 계좌, 1:성공
		if(result==-1)
		{
			out.print("<html>");
			out.print("DB 오류입니다");
			out.print("<br> <a href=\"/client/input.jsp\">뒤로가기</a>");
			out.println("</html>");
		}
		else if(result==-2)
		{
			out.print("<html>");
			out.print("존재하지 않는 계죄입니다.");
			out.print("<br> <a href=\"/client/input.jsp\">뒤로가기</a>");
			out.println("</html>");
		}
		/*
		else if(result==-3)
		{
			out.print("<html>");
			out.print("한도 초과입니다.");
			out.print("<br> <a href=\"http://localhost:8090/DatabaseDesign/client/cardUsage.jsp\">뒤로가기</a>");
			out.println("</html>");
		}*/
		//오류:-1, 잔고부족:-2, 한도초과:-3 성공:1
		else if(result==1)
		{
			out.print("<html>");
			out.print("<body>");
			out.print(id+" 계좌에서 "+amount+"원을 입금하였습니다.");
			out.print("<br> <a href=\"/client/input.jsp\">뒤로가기</a>");
			out.print("</body>");
			out.println("</html>");
		}
	}

}
