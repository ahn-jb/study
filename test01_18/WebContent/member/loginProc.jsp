<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<%@page import="java.net.Inet4Address"%>

<%@ page import="member.MemberDAO"%>
<jsp:useBean id="dto" class="member.MemberDTO" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>

<%
	
	MemberDAO dao = new MemberDAO();
	int result = dao.login(dto); 
	 
	
	 if (result > 0) {
		
		out.println("<script>");
		out.println("alert('로그인 성공.');");
		out.println("location.href='../member/homepage.jsp';");
		out.println("</script>");

	}else {
		
		out.println("<script>");
		out.println("alert('존재하지 않는 아이디이거나 비밀번호가 잘못 되었습니다.')");
		out.println("location.href='../member/login.jsp';");
		out.println("</script>");
	}
%>