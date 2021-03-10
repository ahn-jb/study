package controller.member;


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


import model.dao.member.MemberDAO;
import model.dto.member.MemberDTO;


@WebServlet("/member_servlet/*")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	protected void doProc(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			
			String path = request.getContextPath();
			String url = request.getRequestURL().toString();
			String page = "/main/main.jsp";
			
			String pageNumber_;
			pageNumber_ = request.getParameter("pageNumber");
			if(pageNumber_ == null || pageNumber_.trim().equals("")) {
				pageNumber_="1";
			}
//			char imsi;
//			for(int i=0; i<pageNumber_.length(); i++) {
//				 imsi = pageNumber_.charAt(i);
//			}
			int pageNumber = Integer.parseInt(pageNumber_);
			if(url.indexOf("chuga.do") != -1) {//가입 페이지
				request.setAttribute("menu_gubun", "member_chuga");
				RequestDispatcher rd = request.getRequestDispatcher(page);
				rd.forward(request, response);
				
			}else if(url.indexOf("id_check.do") != -1) {
				
				String id = request.getParameter("id");
				String newId = id.replace(" ","");
				MemberDAO dao = new MemberDAO();
				int result =dao.getSelectId(id);
				if(result >0 || !id.equals(newId)) {
					id = "";
					result = 1;
				}
				out.println(result);
				
			}else if(url.indexOf("id_check_win_open_proc.do") != -1) {
				
				String id = request.getParameter("id");
				String newId=id.replace(" ","");
				
				MemberDAO dao = new MemberDAO();
				int result =dao.getSelectId(id);
				if(result >0 || !id.equals(newId)) {
					id = "";
					result = 1;
				}
				request.setAttribute("Id", id);
				request.setAttribute("result", result);
				RequestDispatcher rd = request.getRequestDispatcher("/member/id_check.jsp");
				rd.forward(request, response);
				
			}else if(url.indexOf("id_check_win_open.do") != -1){
				
				response.sendRedirect(path+"/member/id_check.jsp");
				
			}else if(url.indexOf("chugaProc.do") != -1) {//회원가입  처리
				
				String id = request.getParameter("id");
				String pw = request.getParameter("pw");
				id = replace(id);
				pw = replace(pw);
				String newId = id.replace(" ","");
				String newPw = pw.replace(" ", ""); 
				if(!id.equals(newId)) {
					out.println("<script>");
					out.println("alert('아이디 빈칸 오류');");
					out.println("location.href='"+path+"/member_servlet/chuga.do';");
					out.println("</script>");
				}else if(!pw.equals(newPw)) {
					out.println("<script>");
					out.println("alert('비밀번호 빈칸 오류');");
					out.println("location.href='"+path+"/member_servlet/chuga.do';");
					out.println("</script>");
					
				}else {
				String name = request.getParameter("name");
				String gender = request.getParameter("gender");
				String bornYear_ = request.getParameter("bornYear");
				String postNum = request.getParameter("postNum");
				String street_addr = request.getParameter("street_addr");
				String parcel_addr = request.getParameter("parcel_addr");
				String detail_addr = request.getParameter("detail_addr");
				String reference   = request.getParameter("reference");
				int bornYear = Integer.parseInt(bornYear_);
				MemberDTO dto =new MemberDTO(); //DTO set
				dto.setId(id);
				dto.setPw(pw);
				dto.setName(name);
				dto.setGender(gender);
				dto.setBornYear(bornYear);
				dto.setPostNum(postNum);
				dto.setStreet_addr(street_addr);
				dto.setParcel_addr(parcel_addr);
				dto.setDetail_addr(detail_addr);
				dto.setReference(reference);
				MemberDAO dao = new MemberDAO();
				
				int result =dao.getSelectId(id);
				if(result >0 || !id.equals(newId)) {
					id = "";
					result = 1;
				}
				if(result >0) {
					out.println("<script>");
					out.println("alert('잘못된 아이디.');");
					out.println("location.href='"+path+"/member_servlet/chuga.do';");
					out.println("</script>");
				}else {
					result = dao.setInsert(dto);
	//				String temp="";
					if(result >0){
						out.println("<script>");
						out.println("alert('가입 완료.\\n로그인 해주세요.');");
						out.println("location.href='"+path+"/member_servlet/login.do';");
						out.println("</script>");
	//					 temp=path+"/member_servlet/login.do";
					}else {
						out.println("<script>");
						out.println("alert('오류 발생.');");
						out.println("location.href='"+path+"/member_servlet/login.do';");
						out.println("</script>");
	//					temp=path+"/member_servlet/chuga.do";
					}
	//				response.sendRedirect(temp);
					}
				}
			}else if(url.indexOf("login.do") != -1) {//로그인 페이지
				request.setAttribute("menu_gubun", "member_login");
				RequestDispatcher rd = request.getRequestDispatcher(page);
				rd.forward(request, response);
				
			}else if(url.indexOf("loginProc.do") != -1) {//로그인	처리
				String id = request.getParameter("id");
				String pw = request.getParameter("pw");
				id = replace(id);
				pw = replace(pw);
				String newId = id.replace(" ","");
				String newPw = pw.replace(" ","");
				
				MemberDTO dto =new MemberDTO(); //DTO set
				dto.setId(id);
				dto.setPw(pw);
				MemberDAO dao = new MemberDAO();
				MemberDTO resultDTO = dao.Login(dto);
				String temp="";
				response.setContentType("text/html; charset=utf-8");
				if(!id.equals(newId)) {
					out.println("<script>");
					out.println("alert('아이디 빈칸 오류');");
					out.println("location.href='"+path+"/member_servlet/chuga.do';");
					out.println("</script>");
				}else if(!pw.equals(newPw)) {
						out.println("<script>");
						out.println("alert('비밀번호 빈칸 오류');");
						out.println("location.href='"+path+"/member_servlet/chuga.do';");
						out.println("</script>");
						
				 }else if(resultDTO.getNo() >0){ 
					HttpSession session = request.getSession(); //세션등록
					session.setAttribute("cookNo", resultDTO.getNo());
					session.setAttribute("cookId", resultDTO.getId());
					session.setAttribute("cookName", resultDTO.getName());
					
					dao.loginCounterSucsess(resultDTO);
					temp=path;
					response.sendRedirect(temp);
				}else {
					dao.loginCounterfail(dto);
					temp=path+"/member_servlet/login.do";
					response.sendRedirect(temp);
				}
				
				
			}else if(url.indexOf("logout.do") != -1) {//로그아웃 처리
				response.setContentType("text/html; charset=utf-8");
				HttpSession session = request.getSession();
				session.invalidate(); //세션제거
				out.println("<script>");
				out.println("alert('로그아웃 되었습니다.\\n즐거운 하루 되세요.');");
				out.println("location.href='"+path+"';");
				out.println("</script>");
				
			}else if(url.indexOf("list.do") != -1) {//회원 리스트
				MemberDAO dao = new MemberDAO();
				int pageSize = 1;
				int blockSize= 10;
				int totalRecord = dao.getTotalRecord();
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
				ArrayList<MemberDTO> list = dao.getSelectMember(startRecord,lastRecord);//모든 회원정보 가져오기
				HttpSession session = request.getSession(); //관리자 외 접근제한
				response.setContentType("text/html; charset=utf-8");
				if(session.getAttribute("cookNo") == null) {
					out.println("<script>");
					out.println("alert('권한 제한.');");
					out.println("location.href='"+path+"';");
					out.println("</script>");

				}else if(session.getAttribute("cookNo") != null) {
					int cookNo= (Integer)session.getAttribute("cookNo");
					MemberDTO dto = dao.getSelectOneNo(cookNo);
					
					if(dto.getGrade() != 1) {
						out.println("<script>");
						out.println("alert('권한 제한.');");
						out.println("location.href='"+path+"/index.do';");
						out.println("</script>");
						
					}else {
						request.setAttribute("menu_gubun", "member_list");
						request.setAttribute("list",list);
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
					}	
				}
			
			}else if(url.indexOf("view.do") != -1) {//상세보기
				String no_ = request.getParameter("no");
				int no = Integer.parseInt(no_);
				MemberDAO dao = new MemberDAO();
				MemberDTO dto = dao.getSelectOneNo(no);
				
				HttpSession session = request.getSession(); //관리자&본인 외 접근제한
				response.setContentType("text/html; charset=utf-8");
				if(session.getAttribute("cookNo") == null) {
					out.println("<script>");
					out.println("alert('권한 제한.');");
					out.println("location.href='"+path+"';");
					out.println("</script>");

				}else if(session.getAttribute("cookNo") != null) {
					int cookNo= (Integer)session.getAttribute("cookNo");
					MemberDTO dto1 = dao.getSelectOneNo(cookNo);
					if(no == cookNo) {
						request.setAttribute("menu_gubun", "member_view");
						request.setAttribute("dto",dto);
						RequestDispatcher rd = request.getRequestDispatcher(page);
						rd.forward(request, response);
						
					}else if(dto1.getGrade() != 1) {
						out.println("<script>");
						out.println("alert('권한 제한.');");
						out.println("location.href='"+path+"/index.do';");
						out.println("</script>");
						
					}else {
						request.setAttribute("menu_gubun", "member_view");
						request.setAttribute("dto",dto);
						RequestDispatcher rd = request.getRequestDispatcher(page);
						rd.forward(request, response);
					}
					
					
				}
				
			}else if(url.indexOf("modify.do") != -1) {//수정 페이지
				String no_ = request.getParameter("no");
				int no = Integer.parseInt(no_);
				MemberDAO dao = new MemberDAO();
				MemberDTO dto = dao.getSelectOneNo(no);
				
				
				HttpSession session = request.getSession(); //관리자&본인 외 접근제한
				response.setContentType("text/html; charset=utf-8");
				if(session.getAttribute("cookNo") == null) {
					out.println("<script>");
					out.println("alert('권한 제한.');");
					out.println("location.href='"+path+"';");
					out.println("</script>");

				}else if(session.getAttribute("cookNo") != null) {
					int cookNo= (Integer)session.getAttribute("cookNo");
					MemberDTO dto1 = dao.getSelectOneNo(cookNo);
					if(no == cookNo) {
						request.setAttribute("menu_gubun", "member_modify");
						request.setAttribute("dto",dto);
						RequestDispatcher rd = request.getRequestDispatcher(page);
						rd.forward(request, response);
					}else if(dto1.getGrade() != 1) {
						out.println("<script>");
						out.println("alert('권한 제한.');");
						out.println("location.href='"+path+"/index.do';");
						out.println("</script>");
						
					}else {
						request.setAttribute("menu_gubun", "member_modify");
						request.setAttribute("dto",dto);
						RequestDispatcher rd = request.getRequestDispatcher(page);
						rd.forward(request, response);
					}
				}
			}else if(url.indexOf("modifyProc.do") != -1){//수정 처리
				String no_ = request.getParameter("no");
				int no = Integer.parseInt(no_);
				String id = request.getParameter("id");
				String pw = request.getParameter("pw");
				pw = replace(pw);
				String newPw = pw.replace(" ", "");
				String name = request.getParameter("name");
				String grade_ = request.getParameter("grade");
				int grade = Integer.parseInt(grade_);
				String postNum = request.getParameter("postNum");
				String street_addr = request.getParameter("street_addr");
				String parcel_addr = request.getParameter("parcel_addr");
				String detail_addr = request.getParameter("detail_addr");
				String reference   = request.getParameter("reference");
				MemberDTO dto =new MemberDTO(); //DTO set
				dto.setId(id);
				dto.setPw(pw);
				dto.setName(name);
				dto.setGrade(grade);
				dto.setPostNum(postNum);
				dto.setStreet_addr(street_addr);
				dto.setParcel_addr(parcel_addr);
				dto.setDetail_addr(detail_addr);
				dto.setReference(reference);
				MemberDAO dao = new MemberDAO();
				int result = dao.update(dto);
				
				HttpSession session = request.getSession(); //관리자&본인 외 접근제한
				response.setContentType("text/html; charset=utf-8");
			 if(!pw.equals(newPw)) {
					out.println("<script>");
					out.println("alert('비밀번호 빈칸 오류');");
					out.println("location.href='"+path+"/member_servlet/chuga.do';");
					out.println("</script>");
				}else if(session.getAttribute("cookNo") == null) {
					out.println("<script>");
					out.println("alert('권한 제한.');");
					out.println("location.href='"+path+"';");
					out.println("</script>");

				}else if(session.getAttribute("cookNo") != null) {
					int cookNo= (Integer)session.getAttribute("cookNo");
					dto = dao.getSelectOneNo(cookNo);
					if(no == cookNo) {
						String temp="";
						if(result >0){
							if(no_.equals(session.getAttribute("cookNo").toString())) {//세션초기화
								session.invalidate(); //세션제거
								temp=path+"/member_servlet/login.do";
							}else {
								temp=path+"/member_servlet/list.do";
							}
						}else {
							temp=path+"/member_servlet/list.do";
						}
						response.sendRedirect(temp);
					}else if(dto.getGrade() != 1) {
						out.println("<script>");
						out.println("alert('권한 제한.');");
						out.println("location.href='"+path+"/index.do';");
						out.println("</script>");					
					}else {
						String temp="";
						if(result >0){
							if(no_.equals(session.getAttribute("cookNo").toString())) {//세션초기화
								session.invalidate(); //세션제거
								temp=path+"/member_servlet/login.do";
							}else {
								temp=path+"/member_servlet/list.do";
							}
						}else {
							temp=path+"/member_servlet/list.do";
						}
						response.sendRedirect(temp);
					}
				}
			}else if(url.indexOf("delete.do") != -1){//// 삭제 처리 ////
				String no_ = request.getParameter("no");
				int no = Integer.parseInt(no_);
				MemberDAO dao = new MemberDAO();
				MemberDTO dto = dao.getSelectOneNo(no);
				
				HttpSession session = request.getSession(); //관리자&본인 외 접근제한
				response.setContentType("text/html; charset=utf-8");
				if(session.getAttribute("cookNo") == null) {
					out.println("<script>");
					out.println("alert('권한 제한.');");
					out.println("location.href='"+path+"';");
					out.println("</script>");
				}else if(session.getAttribute("cookNo") != null) {
					int cookNo= (Integer)session.getAttribute("cookNo");
					dto = dao.getSelectOneNo(cookNo);
					if(no == cookNo) {
					
					}else if(dto.getGrade() != 1) {
						out.println("<script>");
						out.println("alert('권한 제한.');");
						out.println("location.href='"+path+"/index.do';");
						out.println("</script>");
					}else {
						request.setAttribute("menu_gubun", "member_delete");
						request.setAttribute("dto",dto);
						RequestDispatcher rd = request.getRequestDispatcher(page);
						rd.forward(request, response);
					}
				}
				
			}else if(url.indexOf("deleteProc.do") != -1) {
				String no_ = request.getParameter("no");
				int no = Integer.parseInt(no_);
				MemberDAO dao = new MemberDAO();
				int result = dao.delete(no);
				
				HttpSession session = request.getSession(); //관리자&본인 외 접근제한
				response.setContentType("text/html; charset=utf-8");
				if(session.getAttribute("cookNo") == null) {
					out.println("<script>");
					out.println("alert('권한 제한.');");
					out.println("location.href='"+path+"';");
					out.println("</script>");

				}else if(session.getAttribute("cookNo") != null) {
					int cookNo= (Integer)session.getAttribute("cookNo");
					MemberDTO dto = dao.getSelectOneNo(cookNo);
					if(no == cookNo) {
						
					}else if(dto.getGrade() != 1) {
						out.println("<script>");
						out.println("alert('권한 제한.');");
						out.println("location.href='"+path+"/index.do';");
						out.println("</script>");
						
					}else {
						request.setAttribute("menu_gubun", "member_delete");
						request.setAttribute("dto",dto);
						RequestDispatcher rd = request.getRequestDispatcher(page);
						rd.forward(request, response);
					}
				
				}
//				String temp="";
				if(result >0){
					if(no_.equals(session.getAttribute("cookNo").toString())) {
						session.invalidate(); //// 세션제거 ////
//						temp=path+"/member_servlet/login.do";
						out.println("<script>");
						out.println("alert('탈퇴처리 되었습니다.');");
						out.println("location.href='"+path+"/index.do';");
						out.println("</script>");
					}else {
						out.println("<script>");
						out.println("alert('탈퇴처리 되었습니다.');");
						out.println("location.href='"+path+"/member_servlet/list.do';");
						out.println("</script>");
//						temp=path+"/member_servlet/list.do";
					}
				}else {
					out.println("<script>");
					out.println("alert('오류 발생.');");
					out.println("location.href='"+path+"/index.do';");
					out.println("</script>");
//					temp=path+"/member_servlet/list.do";
				}
//				response.sendRedirect(temp);
				}
		} catch(Exception e) {
			e.printStackTrace();
			request.setAttribute("menu_gubun", "exception");
			RequestDispatcher rd = request.getRequestDispatcher("/main/main.jsp");
			rd.forward(request, response);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doProc(request, response);
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doProc(request, response);
	}
	
	public String replace(String a) {
		a = a.replace("<", "&lt;");
		a = a.replace(">", "&gt;");
		a = a.replace("&", "&amp;");
		a = a.replace("\"", "&quot;");
		a = a.replace("'", "&apos;");	
		
		return a;
	}

}
