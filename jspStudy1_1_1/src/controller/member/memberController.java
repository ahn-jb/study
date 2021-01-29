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
public class memberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	protected void doProc(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			request.setCharacterEncoding("UTF-8");
			
			String path = request.getContextPath();
			String url = request.getRequestURL().toString();
			String page = "/main/main.jsp";
			
			if(url.indexOf("chuga.do") != -1) {//가입 페이지
				request.setAttribute("menu_gubun", "member_chuga");
				RequestDispatcher rd = request.getRequestDispatcher(page);
				rd.forward(request, response);
				
			}else if(url.indexOf("id_check.do") != -1) {
				
				String id = request.getParameter("id");
				MemberDAO dao = new MemberDAO();
				int result =dao.getSelectId(id);
				PrintWriter out = response.getWriter();
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
				response.setContentType("text/html; charset=utf-8");
				PrintWriter out = response.getWriter();
				String id = request.getParameter("id");
				String pw = request.getParameter("pw");
				String newPw = pw.replace(" ", "");
				if(!pw.equals(newPw)) {
					System.out.println("aaaa");
					out.println("<script>");
					out.println("alert('비밀번호 빈칸 X');");
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
				int result = dao.setInsert(dto);
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
			}else if(url.indexOf("login.do") != -1) {//로그인 페이지
				request.setAttribute("menu_gubun", "member_login");
				RequestDispatcher rd = request.getRequestDispatcher(page);
				rd.forward(request, response);
				
			}else if(url.indexOf("loginProc.do") != -1) {//로그인	처리
				String id = request.getParameter("id");
				String pw = request.getParameter("pw");
				MemberDTO dto =new MemberDTO(); //DTO set
				dto.setId(id);
				dto.setPw(pw);
				MemberDAO dao = new MemberDAO();
				MemberDTO resultDTO = dao.Login(dto);
				String temp="";
				
				if(resultDTO.getNo() >0){ 
					HttpSession session = request.getSession(); //세션등록
					session.setAttribute("cookNo", resultDTO.getNo());
					session.setAttribute("cookId", resultDTO.getId());
					session.setAttribute("cookName", resultDTO.getName());
					
					dao.loginCounterSucsess(resultDTO);
					temp=path;
				}else {
					dao.loginCounterfail(dto);
					temp=path+"/member_servlet/login.do";
				}
				response.sendRedirect(temp);
				
			}else if(url.indexOf("logout.do") != -1) {//로그아웃 처리
				response.setContentType("text/html; charset=utf-8");
				HttpSession session = request.getSession();
				session.invalidate(); //세션제거
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('로그아웃 되었습니다.\\n즐거운 하루 되세요.');");
				out.println("location.href='"+path+"';");
				out.println("</script>");
				
			}else if(url.indexOf("list.do") != -1) {//회원 리스트
				MemberDAO dao = new MemberDAO();
				ArrayList<MemberDTO> list = dao.getSelectAll();
				
				
				HttpSession session = request.getSession(); //관리자 외 접근제한
				response.setContentType("text/html; charset=utf-8");
				PrintWriter out = response.getWriter();
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
				PrintWriter out = response.getWriter();
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
				PrintWriter out = response.getWriter();
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
				PrintWriter out = response.getWriter();
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
				PrintWriter out = response.getWriter();
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
				PrintWriter out = response.getWriter();
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

}
