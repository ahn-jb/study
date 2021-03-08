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

import common.UtilBoard;
import model.dao.board.BoardDAO;
import model.dto.board.BoardDTO;


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
//		System.out.println(url);
//		System.out.println(uri);
		
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
		
		
		request.setAttribute("naljaMap",naljaMap );
		request.setAttribute("ip",ip );
		request.setAttribute("pageNumber",pageNumber );
		request.setAttribute("no",no );
		request.setAttribute("search_option",search_option);
		request.setAttribute("search_data",search_data);
		
		String page = "/main/main.jsp";
		
		if(url.indexOf("list.do") != -1) {
			String pageSize_ = request.getParameter("pageSize");
			int pageSize = 0;
			if(pageSize_ == null || pageSize_ == "") {
				pageSize = 10;
			}else {
				pageSize = Integer.parseInt(pageSize_);
			}
			int blockSize= 10;
			int totalRecord = dao.getCount(search_option, search_data);
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

			ArrayList<BoardDTO> list =dao.search(startRecord,lastRecord,search_data,search_option);
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
			
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(url.indexOf("write.do") != -1 ) {
			request.setAttribute("menu_gubun", "board_write");
			
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(url.indexOf("writeProc.do") != -1) {
			String writer = request.getParameter("writer");
			String subject = request.getParameter("subject");
			String passwd = request.getParameter("passwd");
			String content = request.getParameter("content");

		 	dto.setNo(no);
		 	dto.setWriter(writer);
		 	dto.setSubject(subject);
		 	dto.setContent(content);
		 	dto.setPasswd(passwd);

		 	int result = dao.setInsert(dto);
		 	if(result >0){
		 		temp=path+"/board_servlet/list.do";
			}else {
				temp=path+"/board_servlet/write.do";
			}
			response.sendRedirect(temp);
		}else if(url.indexOf("view.do") != -1 ) {
			request.setAttribute("menu_gubun","board_view" );
			
			dto = dao.getSelectOne(no);
			
			String content = dto.getContent();
			content = content.replace("\n", "<br>");
			dto.setContent(content);
			
			request.setAttribute("dto", dto );
			
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(url.indexOf("sujeong.do") != -1) {
			request.setAttribute("menu_gubun", "board_sujeong");
			
			dto = dao.getSelectOne(no);
			request.setAttribute("dto",dto);
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(url.indexOf("sujeongProc.do") != -1) {
			String writer = request.getParameter("writer");
			String subject = request.getParameter("subject");
			String passwd = request.getParameter("passwd");
			String content = request.getParameter("content");		 	
			
		 	dto.setNo(no);
		 	dto.setWriter(writer);
		 	dto.setSubject(subject);
		 	dto.setContent(content);
		 	dto.setPasswd(passwd);
		 	BoardDTO dto2 = new BoardDTO();
		 	dto2 = dao.getSelectOne(no);
		 	String dbPasswd = dto2.getPasswd();
		 	if(passwd.equals(dbPasswd)) {
		 		int result = dao.setUpdate(dto);
		 		temp=path+"/board_servlet/view.do?no="+no+"&search_option="+search_option+"&search_data="+search_data;
		 	}else {
		 		temp=path+"/board_servlet/view.do?no="+no+"&search_option="+search_option+"&search_data="+search_data;
		 	}
		 	
		 	response.sendRedirect(temp);
		}else if(url.indexOf("sakje.do") != -1) {
			request.setAttribute("menu_gubun", "board_sakje");
			
			dto = dao.getSelectOne(no);
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
		 		temp=path+"/board_servlet/list.do";
		 	}else {
		 		temp=path+"/board_servlet/sakje.do?no="+no;
		 	}
			response.sendRedirect(temp);
		}
		
	}
	

}
