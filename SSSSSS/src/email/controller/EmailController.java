package email.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import email.model.dao.EmailDAO;
import email.model.dto.EmailDTO;
import email.service.EmailService;
import shop.common.UtilProduct;
import shop.model.dao.product.ProductDAO;
import shop.model.dto.product.ProductDTO;


@WebServlet("/email_servlet/*")
public class EmailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProc(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProc(request, response);
	}
	
	
	protected void doProc(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		
		UtilProduct util = new UtilProduct(); 
		EmailDAO dao = new EmailDAO();
		EmailDTO dto = new EmailDTO();
		
		int[] nalja = util.getDateTime();
		Map<String, Integer> naljaMap = new HashMap<String, Integer>();
		naljaMap.put("now_y", nalja[0]);
		naljaMap.put("now_m", nalja[1]);
		naljaMap.put("now_d", nalja[2]);
		
		String serverInfo[] = util.getServerInfo(request); //request.gfetContextPath();
		String refer = serverInfo[0];
		String path = serverInfo[1];
		String url = serverInfo[2];
		String uri = serverInfo[3];
		String ip = serverInfo[4];
//		String ip6 = serverInfo[5];
		
		String temp;
		temp = request.getParameter("pageNumber");
		int pageNumber = util.numberCheck(temp,1);
		
		temp = request.getParameter("no");
		int no = util.numberCheck(temp,0);
		
		String search_option = request.getParameter("search_option");
		String search_data = request.getParameter("search_data");
		String[] searchArray = util.searchCheck(search_option, search_data);
		search_option = searchArray[0];
		search_data = searchArray[1];
		
		String[] sessionArray = util.sessionCheck(request);
		int cookNo = Integer.parseInt(sessionArray[0]);
		String cookId = sessionArray[1];
		String cookName = sessionArray[2];
		
		request.setAttribute("naljaMap",naljaMap );
		request.setAttribute("ip",ip );
		request.setAttribute("pageNumber",pageNumber );
		request.setAttribute("no",no );
		request.setAttribute("search_option", search_option);
		request.setAttribute("search_option", search_option );
		
		String page = "/main/main.jsp";
		if(url.indexOf("index.do") != -1) {
			request.setAttribute("menu_gubun", "email_index");
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(url.indexOf("chuga.do") != -1) {
			request.setAttribute("menu_gubun", "email_chuga");
			page = "/email/chuga.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(url.indexOf("chugaProc.do") != -1) {
			String fromName = request.getParameter("fromName");
			String fromEmail = request.getParameter("fromEmail");
			String subject = request.getParameter("subject");
			String content = request.getParameter("content");
			String birth_chk ="";
			if(request.getParameter("birth_chk") == null || request.getParameter("birth_chk") =="") {
				birth_chk ="";
			}else {
				birth_chk = request.getParameter("birth_chk");
			}
			
			dto.setFromName(fromName);
			dto.setFromEmail(fromEmail);
			dto.setSubject(subject);
			dto.setContent(content);
			
			EmailService service = new EmailService();
//			List<EmailDTO> list = dao.getEmail(birth_chk);
			try {
//				for(int i=0; i<list.size(); i++) {
//					dto.setToEmail(list.get(i).getMemberEmail());
					service.mailSender(dto,birth_chk);
//				}
			}catch(Exception e) {
				e.printStackTrace();
			}
			page = "/email/chuga.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(url.indexOf("memberChuga.do") != -1) {
			request.setAttribute("menu_gubun", "email_memberChuga");
			
			page = "/email/memberChuga.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(url.indexOf("memberChugaProc.do") != -1) {
			request.setAttribute("menu_gubun", "email_memberChugaProc");
			String memberName = request.getParameter("memberName");
			String memberEmail = request.getParameter("memberEmail");
			String memberbirthday = request.getParameter("memberbirthday");

			dto.setMemberName(memberName);
			dto.setMemberEmail(memberEmail);
			dto.setMemberbirthday(memberbirthday);
			int result =dao.setInsert(dto);
			if(result > 0) {
				page = "/email/chuga.jsp";
				RequestDispatcher rd = request.getRequestDispatcher(page);
				rd.forward(request, response);
			}else {
				page = "/email/memberChuga.jsp";
				RequestDispatcher rd = request.getRequestDispatcher(page);
				rd.forward(request, response);
			}
			
		}
	}

}
