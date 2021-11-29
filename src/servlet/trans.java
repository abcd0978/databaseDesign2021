package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.net.URLEncoder;
import dao.cardDAO;
/**
 * Servlet implementation class trans
 */
@WebServlet("/usecard")
public class trans extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public trans() {
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
		request.setCharacterEncoding("utf-8");
		int result=0;
		cardDAO cdao = new cardDAO();
		String id = request.getParameter("card_id");
		String amount = request.getParameter("amount");
		String info = request.getParameter("info");//URLEncoder.encode(, "euc-kr");
		System.out.println(id+" "+amount+" "+info);
		try {
			result = cdao.useCard(Integer.parseInt(id),Integer.parseInt(amount), info);
		}  catch (NumberFormatException | ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		if(result==-1)
		{
			out.print("<html>");
			out.print("카드가 존재하지 않습니다.");
			out.print("<br> <a href=\"/client/cardUsage.jsp\">뒤로가기</a>");
			out.println("</html>");
		}
		else if(result==-2)
		{
			out.print("<html>");
			out.print("잔고부족입니다.");
			out.print("<br> <a href=\"/client/cardUsage.jsp\">뒤로가기</a>");
			out.println("</html>");
		}
		else if(result==-3)
		{
			out.print("<html>");
			out.print("한도 초과입니다.");
			out.print("<br> <a href=\"/client/cardUsage.jsp\">뒤로가기</a>");
			out.println("</html>");
		}
		//오류:-1, 잔고부족:-2, 한도초과:-3 성공:1
		else if(result==1)
		{
			out.print("<html>");
			out.print("<body>");
			out.print(id+"번 카드에서 "+amount+"원을 사용하였습니다.");
			out.print("<br> <a href=\"/client/cardUsage.jsp\">뒤로가기</a>");
			out.print("</body>");
			out.println("</html>");
		}
	}

}
