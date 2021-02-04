package controller.board;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dao.board.BoardDAO;
import model.dao.member.MemberDAO;
import model.dto.board.BoardDTO;
import model.dto.member.MemberDTO;


@WebServlet("/board_servlet/*")
public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProc(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doProc(request, response);
	}
	protected void doProc(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		
		String path = request.getContextPath();
		String url = request.getRequestURL().toString();
		String page = "/main/main.jsp";
		
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
//		System.out.println(pageNumber);
		if(url.indexOf("list.do") != -1) {
			BoardDAO dao = new BoardDAO();
			String bunryu = request.getParameter("bunryu");
			String search = request.getParameter("search");
//			System.out.println("bunryu"+bunryu);
			if(	bunryu == null || bunryu.equals("null")){
				bunryu = null;
			}
			String pageSize_ = request.getParameter("pageSize");
			int pageSize = 0;
			if(pageSize_ == null || pageSize_ == "") {
				pageSize = 20;
			}else {
				pageSize = Integer.parseInt(pageSize_);
			}
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
			String check = request.getParameter("check");
			if(check == null) {
				if(totalRecord - pageNumber*pageSize <0) {
					
					pageNumber = totalRecord/pageSize +(totalRecord%pageSize == 0 ? 0:1);
				}
					out.println("<script>");
					out.println("location.href='"+path+"/board_servlet/list.do?pageSize="
								+pageSize+"&pageNumber="+pageNumber+"&bunryu="+bunryu+"&search="+search+"&check=1';");
					out.println("</script>");
				
			}else {
			ArrayList<BoardDTO> list =dao.search(startRecord,lastRecord,search,bunryu);
			request.setAttribute("menu_gubun", "board_list");
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
			request.setAttribute("bunryu",bunryu);
			request.setAttribute("search",search);
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
			}
		}else if(url.indexOf("write.do") != -1) {
			request.setAttribute("menu_gubun", "board_write");
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(url.indexOf("writeProc.do") != -1) {
			BoardDAO dao = new BoardDAO();
			String writer = request.getParameter("writer");
			String subject = request.getParameter("subject");
			String content = request.getParameter("content");
			String email = request.getParameter("email");
			int num=dao.getMaxNum()+1;
			int refNo=dao.getMaxRefNo()+1;
			int stepNo = 1;
			int levelNo = 1;
		 	int hit = 0;
		 	int service =1;
		 	
		 	BoardDTO dto = new BoardDTO();
		 	dto.setWriter(writer);
		 	dto.setSubject(subject);
		 	dto.setContent(content);
		 	dto.setEmail(email);
		 	dto.setNum(num);
		 	dto.setRefNo(refNo);
		 	dto.setStepNo(stepNo);
		 	dto.setLevelNo(levelNo);
		 	dto.setHit(hit);
		 	dto.setService(service);
		 	int result = dao.setInsert(dto);
		 	String temp ="";
		 	if(result >0){
		 		temp=path+"/board_servlet/list.do";
			}else {
				temp=path+"/board_servlet/write.do";
			}
			response.sendRedirect(temp);
		}else if(url.indexOf("view.do") != -1) {
			BoardDAO dao = new BoardDAO(); 
			String no_ = request.getParameter("no");
			int no = Integer.parseInt(no_);
			String bunryu = request.getParameter("bunryu");
			String search = request.getParameter("search");
			
		 	dao.setUpdateHit(no);
		 	BoardDTO dto = dao.getSelectView(no,search, bunryu);
			
			request.setAttribute("menu_gubun", "board_view");
			request.setAttribute("dto", dto);			
			request.setAttribute("bunryu",bunryu);
			request.setAttribute("search",search);
			request.setAttribute("no",no);
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
			
		}else if(url.indexOf("answer.do") != -1) {
			MemberDAO dao =new MemberDAO();
			String no_ = request.getParameter("no");
			int no = Integer.parseInt(no_);
			MemberDTO dto = dao.getSelectOneNo(no);
			request.setAttribute("menu_gubun", "board_answer");
			request.setAttribute("dto", dto);	
			request.setAttribute("no", no);
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
			
		}else if(url.indexOf("answerProc.do") != -1) {
			BoardDAO dao = new BoardDAO();
			String no_ = request.getParameter("no");
			int no = Integer.parseInt(no_);
			BoardDTO dto2 = dao.getSelectOne(no);
			dao.setUpdateReLevel(dto2);
			String writer = request.getParameter("writer");
			String subject = request.getParameter("subject");
			String content = request.getParameter("content");
			String email = request.getParameter("email");
			int num = dao.getMaxNum()+1;
			int refNo= dto2.getRefNo();
			int stepNo = dto2.getStepNo() +1;
			int levelNo = dto2.getLevelNo() +1;
		 	int hit = 0;
		 	int service =1;
		 	BoardDTO dto = new BoardDTO();
		 	dto.setWriter(writer);
		 	dto.setSubject(subject);
		 	dto.setContent(content);
		 	dto.setEmail(email);
		 	dto.setNum(num);
		 	dto.setRefNo(refNo);
		 	dto.setStepNo(stepNo);
		 	dto.setLevelNo(levelNo);
		 	dto.setHit(hit);
		 	dto.setService(service);
		 	int result = dao.setInsert(dto);
		 	String temp ="";
		 	if(result >0){
		 		temp=path+"/board_servlet/list.do";
			}else {
				temp=path+"/board_servlet/answer.do?no="+no;
			}
			response.sendRedirect(temp);
		}else if(url.indexOf("modify.do") != -1) {
			BoardDAO dao = new BoardDAO();
			String no_ = request.getParameter("no");
			int no = Integer.parseInt(no_);
			BoardDTO dto = dao.getSelectOne(no);
			request.setAttribute("menu_gubun", "board_modify");
			request.setAttribute("dto", dto);	
			request.setAttribute("no", no);
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
			
		}else if(url.indexOf("modifyProc.do") != -1) {
			BoardDAO dao = new BoardDAO();
			String no_ = request.getParameter("no");
			int no = Integer.parseInt(no_);
			String writer = request.getParameter("writer");
			String subject = request.getParameter("subject");
			String content = request.getParameter("content");
			String email = request.getParameter("email");

		 	BoardDTO dto = new BoardDTO();
		 	dto.setNo(no);
		 	dto.setWriter(writer);
		 	dto.setSubject(subject);
		 	dto.setContent(content);
		 	dto.setEmail(email);
		 	int result = dao.setUpdate(dto);
		 	String temp ="";
		 	if(result >0){
		 		temp=path+"/board_servlet/list.do";
			}else {
				temp=path+"/board_servlet/view.do?no="+no;
			}
			response.sendRedirect(temp);
		}else if(url.indexOf("delete.do") != -1) {
			BoardDAO dao = new BoardDAO();
			String no_ = request.getParameter("no");
			int no = Integer.parseInt(no_);
			int result = dao.Delete(no);
		 	String temp ="";
		 	if(result >0){
		 		temp=path+"/board_servlet/list.do";
			}else {
				temp=path+"/board_servlet/view.do?no="+no;
			}
			response.sendRedirect(temp);
		}
	}
}
