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
			
			if(url.indexOf("chuga.do") != -1) {
				request.setAttribute("menu_gubun", "member_chuga");
				RequestDispatcher rd = request.getRequestDispatcher(page);
				rd.forward(request, response);
				
			}else if(url.indexOf("chugaProc.do") != -1) {//회원가입 
				String id = request.getParameter("id");
				String pw = request.getParameter("pw");
				String name = request.getParameter("name");
				String gender = request.getParameter("gender");
				String bornYear_ = request.getParameter("bornYear");
				int bornYear = Integer.parseInt(bornYear_);
				MemberDTO dto =new MemberDTO(); //DTO set
				dto.setId(id);
				dto.setPw(pw);
				dto.setName(name);
				dto.setGender(gender);
				dto.setBornYear(bornYear);
				MemberDAO dao = new MemberDAO();
				int result = dao.setInsert(dto);
				String temp="";
				if(result >0){
					 temp=path+"/member_servlet/login.do";
				}else {
					temp=path+"/member_servlet/chuga.do";
				}
				response.sendRedirect(temp);
				
			}else if(url.indexOf("login.do") != -1) {
				request.setAttribute("menu_gubun", "member_login");
				RequestDispatcher rd = request.getRequestDispatcher(page);
				rd.forward(request, response);
				
			}else if(url.indexOf("loginProc.do") != -1) {//로그인	
				String id = request.getParameter("id");
				String pw = request.getParameter("pw");
				MemberDTO dto =new MemberDTO(); //DTO set
				dto.setId(id);
				dto.setPw(pw);
				MemberDAO dao = new MemberDAO();
				MemberDTO resultDTO = dao.Login(dto);
				String temp="";
				
				if(resultDTO.getNo() >0){
					HttpSession session = request.getSession();
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
				
			}else if(url.indexOf("logout.do") != -1) {
				response.setContentType("text/html; charset=utf-8");
				HttpSession session = request.getSession();
				session.invalidate(); //세션제거
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('로그아웃 되었습니다.\\n즐거운 하루 되세요.');");
				out.println("location.href='"+path+"';");
				out.println("</script>");
				
			}else if(url.indexOf("list.do") != -1) {
				MemberDAO dao = new MemberDAO();
				ArrayList<MemberDTO> list = dao.getSelectAll();
				
				request.setAttribute("menu_gubun", "member_list");
				request.setAttribute("list",list);
				RequestDispatcher rd = request.getRequestDispatcher(page);
				rd.forward(request, response);
				
			}else if(url.indexOf("view.do") != -1) {
				String no_ = request.getParameter("no");
				int no = Integer.parseInt(no_);
				MemberDAO dao = new MemberDAO();
				MemberDTO dto = dao.getSelectOneNo(no);
//				System.out.println(dto.getBornYear());
				request.setAttribute("menu_gubun", "member_view");
				request.setAttribute("dto",dto);
				RequestDispatcher rd = request.getRequestDispatcher(page);
				rd.forward(request, response);
				
			}else if(url.indexOf("modify.do") != -1) {
				String no_ = request.getParameter("no");
				int no = Integer.parseInt(no_);
				MemberDAO dao = new MemberDAO();
				MemberDTO dto = dao.getSelectOneNo(no);
				request.setAttribute("menu_gubun", "member_modify");
				request.setAttribute("dto",dto);
				RequestDispatcher rd = request.getRequestDispatcher(page);
//				rd.forward(request, response);
			}else if(url.indexOf("modifyProc.do") != -1){
				String no_ = request.getParameter("no");
				int no = Integer.parseInt(no_);
				String id = request.getParameter("id");
				String pw = request.getParameter("pw");
				String name = request.getParameter("name");
				String grade_ = request.getParameter("grade");
				int grade = Integer.parseInt(grade_);
				MemberDTO dto =new MemberDTO(); //DTO set
				dto.setId(id);
				dto.setPw(pw);
				dto.setName(name);
				dto.setGrade(grade);
				MemberDAO dao = new MemberDAO();
				int result = dao.update(dto);
				String temp="";
				if(result >0){
					HttpSession session = request.getSession();
					if(no_.equals(session.getAttribute("cookNo").toString())) {
						session.invalidate(); //세션제거
						temp=path+"/member_servlet/login.do";
					}else {
						temp=path+"/member_servlet/list.do";
					}
				}else {
					temp=path+"/member_servlet/list.do";
				}
				response.sendRedirect(temp);
				
			}else if(url.indexOf("delete.do") != -1){
				HttpSession session = request.getSession();
				System.out.println(session.getAttribute("cookNo"));
				String no_ = request.getParameter("no");
				int no = Integer.parseInt(no_);
				System.out.println(no);
				MemberDAO dao = new MemberDAO();
				String temp="";
				int result = dao.delete(no);
				if(result >0){
					if(no_.equals(session.getAttribute("cookNo").toString())) {
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
