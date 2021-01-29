package controller.memo;


import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import model.dao.memo.MemoDAO;
import model.dto.memo.MemoDTO;



@WebServlet("/memo_servlet/*")
public class MemoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String path = request.getContextPath();
		String url = request.getRequestURL().toString();
		String page = "/main/main.jsp";
		
		MemoDAO dao = new MemoDAO();
		if(url.indexOf("write.do") != -1) {
			request.setAttribute("menu_gubun", "memo_write");
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(url.indexOf("writeProc.do") != -1) {
			String writer = request.getParameter("writer");
			String content = request.getParameter("content");
			
			MemoDTO dto = new MemoDTO();
			dto.setWriter(writer);
			dto.setContent(content);
			
			int result = dao.setInsert(dto);
			if(result >0) {
				System.out.println("등록되었습니다.");
			}else {
				System.out.println("결과코드: " +result);
			}
			
		}else if(url.indexOf("list.do") != -1) {
			ArrayList<MemoDTO> list = dao.getSelectAll();
			request.setAttribute("list", list);
			
			String temp = "/memo/list.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(temp);
			rd.forward(request, response);
			
		}
		
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
