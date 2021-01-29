<%@page import="model.member.MemberDAOImplMysql"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="dto" class="model.member.MemberDTO" scope="page"></jsp:useBean>
<jsp:setProperty name="dto" property="*"/>

<%@ page import="model.member.MemberDAO" %>

<%
	MemberDAO dao = new MemberDAOImplMysql();
	int result = dao.getUpdate(dto);
	
	if (result > 0) {
		out.println("<script>");
		out.println("alert('수정 완료.');");
		out.println("location.href='list.jsp';");
		out.println("</script>");

	} else {
		out.println("<script>");
		out.println("alert('오류 발생.');");
		out.println("location.href='list.jsp';");
		out.println("</script>");
	}

%>