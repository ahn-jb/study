package board.controller;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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

import board.model.dao.BoardDAO;
import board.model.dto.BoardDTO;
import common.UtilBoard;



@WebServlet("/board_servlet/*")
public class BoardController extends HttpServlet {
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
			request.setAttribute("menu_gubun", "board_index");
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
			
			List<BoardDTO> list =dao.search(startRecord,lastRecord,tbl,search_data,search_option);
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
			request.setAttribute("search_option",search_option);
			request.setAttribute("search_data",search_data);
			
			page= "/board/list.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(url.indexOf("write.do") != -1  || url.indexOf("reply.do") != -1) {
			request.setAttribute("menu_gubun", "board_write");
			if(no>0) {//답변 일 때
				dto = dao.getView(no,tbl,search_data,search_option);
				String content = "["+dto.getWriter()+"]님이 작성한 글입니다. \n";
					   content += dto.getContent();
					   content = content.replace("\n","\n> ");
					   content += "\n---------------------------------------------------------------\n";
				dto.setContent(content);
				request.setAttribute("dto", dto);
			}
			
			page = "/board/write.jsp";
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
		 		BoardDTO dto2 = dao.getView(no,tbl,search_data,search_option);
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
		 		temp=path+"/board_servlet/list.do";
			}else {
				temp=path+"/board_servlet/write.do";
			}
			response.sendRedirect(temp);
		}else if(url.indexOf("view.do") != -1) {
			request.setAttribute("menu_gubun","board_view" );
			
			dao.setUpdateHit(no);
			dto = dao.getView(no,tbl,search_data,search_option);
			
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
			page ="/board/view.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(url.indexOf("sujeong.do") != -1) {
			request.setAttribute("menu_gubun", "board_sujeong");
			
			dto = dao.getView(no,tbl,search_data,search_option);
			request.setAttribute("dto", dto);
			
			page ="/board/sujeong.jsp";
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
		 		out.println("<script>alert('정상적으로 수정되었습니다.'); GoPage('view','"+no+"');</script>");
		 	}else {
		 		out.println("<script>alert('비밀번호가 다릅니다.');GoPage('view','"+no+"');</script>");
		 	}
		 	out.flush();
		 	out.close();
		 	
		}else if(url.indexOf("sakje.do") != -1) {
			request.setAttribute("menu_gubun", "board_sakje");
			
			dto = dao.getView(no,tbl,search_data,search_option);
			request.setAttribute("dto", dto);
			
			page ="/board/sakje.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(url.indexOf("sakjeProc.do") != -1) {
			String passwd = request.getParameter("passwd");
			
			BoardDTO dto2 = new BoardDTO();
		 	dto2 = dao.getSelectOne(no);
		 	String dbPasswd = dto2.getPasswd();
		 	if(passwd.equals(dbPasswd)) {
		 		int result = dao.Delete(no);
		 		out.println("<script>alert('삭제 되었습니다.'); GoPage('list','');</script>");
		 	}else {
		 		out.println("<script>alert('비밀번호가 다릅니다.');GoPage('list','');</script>");
		 	}
		 	out.flush();
		 	out.close();
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
				out.print("<script> suntaek_proc2('comment_result','1',''); </script>");
//				System.out.println("등록되었습니다.");
			}else {
//				System.out.println("결과코드: " +result);
			}
			
			
		}else if(url.indexOf("comment_result.do") != -1) {
			String qwer = request.getParameter("qwer");
			
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
//			int[] pagerArray = util.pager(pageSize, blockSize, totalRecord, pageNumber);
//			int number = pagerArray[0];
//			int startRecord = pagerArray[1];
//			int lastRecord = pagerArray[2];
//			int totalPage = pagerArray[3];
//			int startPage = pagerArray[4];
//			int lastPage =  pagerArray[5];
			List<BoardDTO> list = dao.getComment(no, startRecord, lastRecord);
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
			
			String temp2 = "/board/comment_list.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(temp2);
			rd.forward(request, response);
		}else if(url.indexOf("commentSakje.do") != -1) {
			String comment_no_ = request.getParameter("comment_no");
			int comment_no = Integer.parseInt(comment_no_);
			String pwchk = request.getParameter("pwchk");
			dto = dao.comment_selectOne(comment_no);

			int result =0;
			if(pwchk.equals(dto.getComment_passwd())) {
				result = dao.comment_sakje(comment_no);
				out.print("<script> suntaek_proc2('comment_result','1',''); </script>");
			}else {
				out.println("<script>alert('비밀번호 다름.'); suntaek_proc2('comment_result','','');</script>");
			}
		}else if(url.indexOf("commentSujeong.do") != -1) {
			String comment_no_ = request.getParameter("comment_no");
			int comment_no = Integer.parseInt(comment_no_);
			String comment_writer = request.getParameter("comment_writer");
			String comment_content = request.getParameter("comment_content");
			
			String pwchk = request.getParameter("comment_passwd");
			dto = dao.comment_selectOne(comment_no);

			int result = 0;
			if(pwchk.equals(dto.getComment_passwd())) {
				dto.setComment_no(comment_no);
				dto.setComment_writer(comment_writer);
				dto.setComment_content(comment_content);
				result = dao.comment_update(dto);
				out.print("<script> suntaek_proc2('comment_result','1',''); </script>");
			}else {
				out.print("<script>alert('비밀번호 다름.'); suntaek_proc2('comment_result','','');</script>");
			}
			
		}
		
		
	}
}
