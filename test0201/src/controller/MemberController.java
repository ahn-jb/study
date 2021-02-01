package controller;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import member.MemberDAO;
import member.MemberDTO;




@WebServlet("/member_servlet/*")
public class MemberController extends HttpServlet {
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
		
		String path = request.getContextPath();
		String url = request.getRequestURL().toString();
		
		String pageNumber_;
		pageNumber_ = request.getParameter("pageNumber");
		if(pageNumber_ == null || pageNumber_.trim().equals("")) {
			pageNumber_="1";
		}
		int pageNumber = Integer.parseInt(pageNumber_);
		if(url.indexOf("id_check.do") != -1) {
		
			String id = request.getParameter("id");
			String newId = id.replace(" ","");
			MemberDAO dao = new MemberDAO();
			int result3 =dao.getSelectId(id);
			if(result3 >0 || !id.equals(newId)) {
				id = "";
				result3 = 1;
			}
			out.println(result3);
			
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
//			System.out.println(id);
			String pw = request.getParameter("pw");
//			System.out.println(pw);
			id = replace(id);
			pw = replace(pw);
			String newId = id.replace(" ","");
			String newPw = pw.replace(" ", ""); 
			if(!id.equals(newId)) {
				out.println("<script>");
				out.println("alert('아이디 빈칸 오류');");
				out.println("location.href='"+path+"/member/join.jsp';");
				out.println("</script>");
			}else if(!pw.equals(newPw)) {
				out.println("<script>");
				out.println("alert('비밀번호 빈칸 오류');");
				out.println("location.href='"+path+"/member/join.jsp';");
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
				out.println("location.href='"+path+"/member/join.jsp';");
				out.println("</script>");
			}else {
				result = dao.setInsert(dto);
				if(result >0){
					out.println("<script>");
					out.println("alert('가입 완료.');");
					out.println("location.href='"+path+"/member_servlet/list.do';");
					out.println("</script>");

				}else {
					out.println("<script>");
					out.println("alert('오류 발생.');");
					out.println("location.href='"+path+"/member/join.jsp';");
					out.println("</script>");

				}

				}
			}
		}else if(url.indexOf("list.do") != -1) {//회원 리스트
			MemberDAO dao = new MemberDAO();
			int pageSize = 5;
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

				response.setContentType("text/html; charset=utf-8");

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
					RequestDispatcher rd = request.getRequestDispatcher("/member/list.jsp");
					rd.forward(request, response);
			
		}else if(url.indexOf("view.do") != -1) {//상세보기
			String no_ = request.getParameter("no");
			int no = Integer.parseInt(no_);
			MemberDAO dao = new MemberDAO();
			MemberDTO dto = dao.getSelectOneNo(no);
			
			request.setAttribute("dto",dto);
			RequestDispatcher rd = request.getRequestDispatcher("/member/view.jsp");
			rd.forward(request, response);
			
		}else if(url.indexOf("modify.do") != -1) {//수정 페이지
			String no_ = request.getParameter("no");
			int no = Integer.parseInt(no_);
			MemberDAO dao = new MemberDAO();
			MemberDTO dto = dao.getSelectOneNo(no);
			
			request.setAttribute("dto",dto);
			RequestDispatcher rd = request.getRequestDispatcher("/member/modify.jsp");
			rd.forward(request, response);
				
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
			dto.setNo(no);
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
			System.out.println("result: "+result);
			if(!pw.equals(newPw)) {
			  System.out.println("패스워드 다름");
				out.println("<script>");
				out.println("alert('비밀번호 빈칸 오류');");
				out.println("location.href='"+path+"/member/view.jsp';");
				out.println("</script>");
			}else if(result >0){
				RequestDispatcher rd = request.getRequestDispatcher("/member_servlet/list.do");
				rd.forward(request, response);
			}else {
				System.out.println("오류");
				out.println("<script>");
				out.println("alert('오류 발생.');");
				out.println("location.href='"+path+"/member/view.jsp';");
				out.println("</script>");
			}
		}
	}//doProc

	public String replace(String a) {
		a = a.replace("<", "&lt;");
		a = a.replace(">", "&gt;");
		a = a.replace("&", "&amp;");
		a = a.replace("\"", "&quot;");
		a = a.replace("'", "&apos;");	
		
		return a;
	}

}
