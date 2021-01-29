<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dto" class="member.MemberDTO" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>


<%
	MemberDAO dao = new MemberDAO();
	int result = dao.update(dto);
	
	if (result > 0) {
		
		out.println("<script>");
		out.println("alert('변경 성공.');");
		out.println("location.href='./logout.jsp';");
		out.println("</script>");

	}else {
		out.println("<script>");
		out.println("alert('변경 실패.');");
		out.println("location.href='./change.jsp';");
		out.println("</script>");
	}
%>