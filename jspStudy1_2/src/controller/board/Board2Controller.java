package controller.board;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.Util;
import common.UtilBoard;
import model.dao.board.BoardDAO;
import model.dao.member.MemberDAO;
import model.dto.board.BoardDTO;
import model.dto.member.MemberDTO;
import model.dto.memo.MemoDTO;


@WebServlet("/board2_servlet/*")
public class Board2Controller extends HttpServlet {
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
		
//		String path = request.getContextPath();
//		String url = request.getRequestURL().toString();
		
		UtilBoard util = new UtilBoard();
		BoardDAO dao = new BoardDAO();
		BoardDTO dto = new BoardDTO();
		
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
		
		temp = request.getParameter("tbl");
		int result_tbl = dao.tblchk(temp);
		if(result_tbl == 0) {
			temp ="";
		}		
		String tbl = util.tblCheck(temp,"freeboard");
				
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
		request.setAttribute("tbl",tbl);
		request.setAttribute("pageNumber",pageNumber );
		request.setAttribute("no",no );
		request.setAttribute("search_option",search_option);
		request.setAttribute("search_data",search_data);
		
		String page = "/main/main.jsp";
		if(url.indexOf("index.do") != -1) {
			request.setAttribute("menu_gubun", "board2_index");
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(url.indexOf("list.do") != -1) {
			String pageSize_ = request.getParameter("pageSize");
			int pageSize = 0;
			if(pageSize_ == null || pageSize_ == "") {
				pageSize = 10;
			}else {
				pageSize = Integer.parseInt(pageSize_);
			}
			int blockSize= 10;
			int totalRecord = dao.getCount(tbl,search_option, search_data);
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

			ArrayList<BoardDTO> list =dao.search(startRecord,lastRecord,tbl,search_data,search_option);
			request.setAttribute("menu_gubun", "board2_list");
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
		}else if(url.indexOf("write.do") != -1  || url.indexOf("reply.do") != -1) {
			request.setAttribute("menu_gubun", "board2_write");
			if(no>0) {//답변 일 때
				dto = dao.getView(no,search_data,search_option);
				String content = "["+dto.getWriter()+"]님이 작성한 글입니다. \n";
					   content += dto.getContent();
					   content = content.replace("\n","\n> ");
					   content += "\n---------------------------------------------------------------\n";
				dto.setContent(content);
				request.setAttribute("dto", dto);
			}
			
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(url.indexOf("writeProc.do") != -1) {
			String writer = request.getParameter("writer");
			String subject = request.getParameter("subject");
			String passwd = request.getParameter("passwd");
			String content = request.getParameter("content");
			String email = request.getParameter("email");
			String noticeGubun = request.getParameter("noticeGubun");
		 	
		 	int noticeNo;
		 	if(noticeGubun == null || noticeGubun.trim().equals("")|| !noticeGubun.contentEquals("T")) {
		 		noticeNo = 0;
		 	}else {
		 		noticeNo = dao.getMaxNoticeNo(tbl)+ 1;
		 	}
		 	String secretGubun = request.getParameter("secretGubun");
		 	if(secretGubun == null || secretGubun.trim().contentEquals("")|| !secretGubun.contentEquals("T")) {
		 		secretGubun = "F";
		 	}else {
		 		secretGubun ="T";
		 	}
			int num=dao.getMaxNum()+1;
			int refNo=dao.getMaxRefNo()+1;
			int stepNo = 1;
			int levelNo = 1;
			int p_no =0;
		 	int hit = 0;
		 	
		 	if(no>0) {
		 		BoardDTO dto2 = dao.getView(no,search_data,search_option);
		 		dao.setUpdateReLevel(dto2);
		 		refNo= dto2.getRefNo();
				stepNo =dto2.getStepNo()+1;
				levelNo =dto2.getLevelNo()+1;
				p_no =dto2.getNo();
		 	}
		 	
		 	dto.setNo(no);
		 	dto.setNum(num);
		 	dto.setTbl(tbl);
		 	dto.setWriter(writer);
		 	dto.setSubject(subject);
		 	dto.setContent(content);
		 	dto.setEmail(email);
		 	dto.setPasswd(passwd);
		 	dto.setRefNo(refNo);
		 	dto.setStepNo(stepNo);
		 	dto.setLevelNo(levelNo);
		 	dto.setHit(hit);
		 	dto.setIp(ip);
		 	dto.setP_no(p_no);
		 	dto.setNoticeNo(noticeNo);
		 	dto.setSecretGubun(secretGubun);
		 	int result = dao.setInsert(dto);
		 	if(result >0){
		 		temp=path+"/board2_servlet/list.do";
			}else {
				temp=path+"/board2_servlet/write.do";
			}
			response.sendRedirect(temp);
		}else if(url.indexOf("view.do") != -1 ) {
			request.setAttribute("menu_gubun","board2_view" );
			
			int pageSize = 5;
			int blockSize= 10;
			int totalRecord = dao.getTotalRecord(no);
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

			ArrayList<BoardDTO> list = dao.getComment(no, startRecord, lastRecord);
			int list_size = list.size();
			request.setAttribute("list_size", list_size);
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
			
			dao.setUpdateHit(no);
			dto = dao.getView(no,search_data,search_option);
			
			String content = dto.getContent();
			content = content.replace("\n", "<br>");
			dto.setContent(content);
			
			String imsiPage = "viewPage";
			if(dto.getSecretGubun().equals("T")) {//비밀글이면
				String view_passwd = util.nullCheck(request.getParameter("view_passwd"));
				if(dto.getPasswd().equals(view_passwd) && !dto.getPasswd().equals("")) {
					
				}else {
					imsiPage = "viewPasswdPage";
				}
			}
			request.setAttribute("dto", dto );
			request.setAttribute("imsiPage",imsiPage );
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(url.indexOf("sujeong.do") != -1) {
			request.setAttribute("menu_gubun", "board2_sujeong");
			
			dto = dao.getView(no,search_data,search_option);
			request.setAttribute("dto",dto);
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(url.indexOf("sujeongProc.do") != -1) {
			String writer = request.getParameter("writer");
			String subject = request.getParameter("subject");
			String passwd = request.getParameter("passwd");
			String content = request.getParameter("content");
			String email = request.getParameter("email");
			String noticeGubun = request.getParameter("noticeGubun");
		 	
			
		 	int noticeNo;
		 	if(noticeGubun == null || noticeGubun.trim().equals("")|| !noticeGubun.contentEquals("T")) {
		 		noticeNo = 0;
		 	}else {
		 		noticeNo = dao.getMaxNoticeNo(tbl)+ 1;
		 	}
		 	String secretGubun = request.getParameter("secretGubun");
		 	if(secretGubun == null || secretGubun.trim().contentEquals("")|| !secretGubun.contentEquals("T")) {
		 		secretGubun = "F";
		 	}else {
		 		secretGubun ="T";
		 	}
		 	dto.setNo(no);
		 	dto.setWriter(writer);
		 	dto.setSubject(subject);
		 	dto.setContent(content);
		 	dto.setEmail(email);
		 	dto.setPasswd(passwd);
		 	dto.setNoticeNo(noticeNo);
		 	dto.setSecretGubun(secretGubun);
		 	BoardDTO dto2 = new BoardDTO();
		 	dto2 = dao.getSelectOne(no);
		 	String dbPasswd = dto2.getPasswd();
		 	if(passwd.equals(dbPasswd)) {
		 		int result = dao.setUpdate(dto);
		 		temp=path+"/board2_servlet/view.do?no="+no+"&search_option="+search_option+"&search_data="+search_data;
		 	}else {
		 		temp=path+"/board2_servlet/view.do?no="+no+"&search_option="+search_option+"&search_data="+search_data;
		 	}
		 	
		 	response.sendRedirect(temp);
		}else if(url.indexOf("sakje.do") != -1) {
			request.setAttribute("menu_gubun", "board2_sakje");
			
			dto = dao.getView(no,search_data,search_option);
			request.setAttribute("dto", dto);
			
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(url.indexOf("sakjeProc.do") != -1) {
			String passwd = request.getParameter("passwd");
			
			BoardDTO dto2 = new BoardDTO();
		 	dto2 = dao.getSelectOne(no);
		 	String dbPasswd = dto2.getPasswd();
		 	if(passwd.equals(dbPasswd)) {
		 		int result = dao.Delete(no);
		 		temp=path+"/board2_servlet/list.do";
		 	}else {
		 		temp=path+"/board2_servlet/sakje.do?no="+no;
		 	}
			response.sendRedirect(temp);
		}else if(url.indexOf("comment_up.do") != -1) {
			String comment_writer = request.getParameter("comment_writer");
			String comment_passwd = request.getParameter("comment_passwd");
			String comment_content = request.getParameter("comment_content");
			
			dto.setBoard_no(no);
			dto.setComment_writer(comment_writer);
			dto.setComment_passwd(comment_passwd);
			dto.setComment_content(comment_content);
			dto.setMemberNo(cookNo);
			dto.setIp(ip);
			int result = dao.CommentInsert(dto);
			if(result >0) {
				System.out.println("등록되었습니다.");
				temp=path+"/board2_servlet/view.do?no="+no+"&search_option="+search_option+"&search_data="+search_data;
			}else {
				System.out.println("결과코드: " +result);
				temp=path+"/board2_servlet/list.do";
			}
			response.sendRedirect(temp);
			
		}
//		else if(url.indexOf("comment_result.do") != -1) {
//			int pageSize = 5;
//			int blockSize= 10;
//			int totalRecord = dao.getTotalRecord(no);
//			int number =totalRecord - pageSize * (pageNumber-1);
//			int startRecord = pageSize * (pageNumber -1) +1;
//			int lastRecord = pageSize * pageNumber;
//			int totalPage =0;
//			int startPage =1;
//			int lastPage = 1;
//			if(totalRecord>0) {
//				totalPage = totalRecord / pageSize +(totalRecord%pageSize == 0? 0:1);
//				startPage = (pageNumber/blockSize - (pageNumber % blockSize !=0 ? 0:1))*blockSize +1 ;
//				lastPage = startPage + blockSize - 1;
//				if(lastPage > totalPage) {	
//					lastPage = totalPage;
//				}
//			}
//			int[] pagerArray = util.pager(pageSize, blockSize, totalRecord, pageNumber);
//			int number = pagerArray[0];
//			int startRecord = pagerArray[1];
//			int lastRecord = pagerArray[2];
//			int totalPage = pagerArray[3];
//			int startPage = pagerArray[4];
//			int lastPage =  pagerArray[5];
//			ArrayList<BoardDTO> list = dao.getComment(no, startRecord, lastRecord);
//			int list_size = list.size();
//			request.setAttribute("list_size", list_size);
//			request.setAttribute("list",list);
//			request.setAttribute("count",totalRecord);
//			request.setAttribute("pageNumber",pageNumber);
//			request.setAttribute("pageSize",pageSize);
//			request.setAttribute("blockSize",blockSize);
//			request.setAttribute("totalRecord",totalRecord);
//			request.setAttribute("number",number);
//			request.setAttribute("startRecord",startRecord);
//			request.setAttribute("lastRecord",lastRecord);
//			request.setAttribute("totalPage",totalPage);
//			request.setAttribute("startPage",startPage);
//			request.setAttribute("lastPage",lastPage);
//			
//			temp=path+"/board2_servlet/view.do?no="+no+"&search_option="+search_option+"&search_data="+search_data;
//			response.sendRedirect(temp);
//		}
		
		
	}
}
