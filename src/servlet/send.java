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
 * Servlet implementation class send
 */
@WebServlet("/send")
public class send extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public send() {
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
		String s_id = request.getParameter("sender_account_id");
		String r_id = request.getParameter("receiver_account_id");
		String info = request.getParameter("info");
		String amount = request.getParameter("amount");
		try {
			result = adao.sendMoney(Integer.parseInt(s_id), Integer.parseInt(r_id), Integer.parseInt(amount), info);
		} catch (NumberFormatException | ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		// 송금 -1:오류 -2:존재하지 않는 계좌, -3:잔고 부족 1:성공
		if(result==-1)
		{
			out.print("<html>");
			out.print("DB 오류입니다");
			out.print("<br> <a href=\"/DatabaseDesign/client/send.jsp\">뒤로가기</a>");
			out.println("</html>");
		}
		else if(result==-2)
		{
			out.print("<html>");
			out.print("존재하지 않는 계죄입니다.");
			out.print("<br> <a href=\"/DatabaseDesign/client/send.jsp\">뒤로가기</a>");
			out.println("</html>");
		}
		
		else if(result==-3)
		{
			out.print("<html>");
			out.print("잔고가 부족합니다.");
			out.print("<br> <a href=\"/DatabaseDesign/client/send.jsp\">뒤로가기</a>");
			out.println("</html>");
		}
		else if(result==1)
		{
			out.print("<html>");
			out.print("<body>");
			out.print(s_id+" 계좌에서 "+r_id+"계좌로 "+amount+"원을 송금하였습니다.");
			out.print("<br> <a href=\"/DatabaseDesign/client/send.jsp\">뒤로가기</a>");
			out.print("</body>");
			out.println("</html>");
		}
	}

}
