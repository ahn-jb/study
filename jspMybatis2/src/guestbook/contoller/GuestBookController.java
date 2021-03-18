package guestbook.contoller;


import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import guestbook.model.dao.GbDAO;
import guestbook.model.dto.GbDTO;



@WebServlet("/guestbook_servlet/*")
public class GuestBookController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProc(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProc(request, response);
	}
	
	protected void doProc(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String path = request.getContextPath();
		String url = request.getRequestURL().toString();
		String page = "/main/main.jsp";
		GbDAO dao = new GbDAO();
		
		
		String pageNumber_;
		pageNumber_ = request.getParameter("pageNumber");
		if(pageNumber_ == null || pageNumber_.trim().equals("")) {
			pageNumber_="1";
		}
//		char imsi;
//		for(int i=0; i<pageNumber_.length(); i++) {
//			 imsi = pageNumber_.charAt(i);
//		}
		int pageNumber = Integer.parseInt(pageNumber_);
		if(url.indexOf("write.do") != -1) {
//			String no_ = request.getParameter("no");
//			int no = Integer.parseInt(no_);
			request.setAttribute("menu_gubun", "guestbook_write");
			request.setAttribute("pageNumber",pageNumber);
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(url.indexOf("writeProc.do") != -1) {
			
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String passwd = request.getParameter("passwd");
			String content = request.getParameter("content");
			
			GbDTO dto = new GbDTO();
			dto.setName(name);
			dto.setEmail(email);
			dto.setPasswd(passwd);
			dto.setContent(content);
			String temp="";
			int result = dao.setInsert(dto);
			if(result >0) {
				System.out.println("등록되었습니다.");
				temp = path + "/guestbook_servlet/list.do";
			}else {
				System.out.println("결과코드: " +result);
				temp = path + "/guestbook_servlet/write.do";
			}
			response.sendRedirect(temp);
		}else if(url.indexOf("list.do") != -1) {
			String bunryu = request.getParameter("bunryu");
			String search = request.getParameter("search");
			int pageSize = 5;
			int blockSize= 10;
			int totalRecord = dao.getCount(bunryu, search);
			int number =totalRecord - pageSize * (pageNumber-1);
			int startRecord = pageSize * (pageNumber -1) +1;
			int lastRecord = pageSize * pageNumber;
			int totalPage =0;
			int startPage =1;
			int lastPage = 1;
			if(totalRecord>0) {
				totalPage = totalRecord / pageSize +(totalRecord%pageSize == 0? 0:1);
				startPage = (pageNumber/blockSize - (pageNumber % blockSize !=0 ? 0:1))*blockSize +1 ;
				lastPage = startPage + blockSize - 1;
				if(lastPage > totalPage) {	
					lastPage = totalPage;
				}
			}
			List<GbDTO> list =dao.getSelectAll(startRecord,lastRecord,bunryu, search);

			request.setAttribute("menu_gubun", "guestbook_list");
			request.setAttribute("list",list);
			request.setAttribute("count",totalRecord);
			request.setAttribute("pageNumber",pageNumber);
			request.setAttribute("pageSize",pageSize);
			request.setAttribute("blockSize",blockSize);
			request.setAttribute("totalRecord",totalRecord);
			request.setAttribute("number",number);
			request.setAttribute("startRecord",startRecord);
			request.setAttribute("lastRecord",lastRecord);
			request.setAttribute("totalPage",totalPage);
			request.setAttribute("startPage",startPage);
			request.setAttribute("lastPage",lastPage);
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(url.indexOf("sujeong.do") != -1) {
			request.setAttribute("menu_gubun", "guestbook_sujeong");
			String no_ =request.getParameter("no");
			int no = Integer.parseInt(no_);
			
			GbDTO dto = dao.selectOne(no);
			request.setAttribute("dto", dto);
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(url.indexOf("sujeongProc.do") != -1) {
			String no_ =request.getParameter("no");
			int no = Integer.parseInt(no_);			

			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String content = request.getParameter("content");
			
			GbDTO dto = new GbDTO();
			dto.setNo(no);
			dto.setName(name);
			dto.setEmail(email);
			dto.setContent(content);
			
			int result = dao.update(dto);
			String temp ="";
			if(result > 0) {
				temp = path + "/guestbook_servlet/list.do";
			}else {
				temp = path + "/guestbook_servlet/sujeong.do";
				request.setAttribute("no", no);
			}
			response.sendRedirect(temp);
		}else if(url.indexOf("sakje.do") != -1) {
			request.setAttribute("menu_gubun", "guestbook_sakje");
			String no_ =request.getParameter("no");
			int no = Integer.parseInt(no_);
			
			GbDTO dto = dao.selectOne(no);
			request.setAttribute("dto", dto);
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(url.indexOf("sakjeProc.do") != -1) {
			String no_ =request.getParameter("no");
			int no = Integer.parseInt(no_);
			
			int result = dao.delete(no);
			String temp="";
			if(result > 0) {
				temp = path + "/guestbook_servlet/list.do";
			}else {
				temp = path + "/guestbook_servlet/sakje.do";
				request.setAttribute("no", no);
			}
			response.sendRedirect(temp);
		}
		
		
	}
}
