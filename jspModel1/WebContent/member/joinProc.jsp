<%@page import="etc.member.MemberConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<%@ page import="etc.member.MemberDAO" %>
<%@ include file="../include/include_check.jsp" %>


<jsp:useBean id="dto" class="etc.member.MemberDTO" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>

<%
	MemberConnect dao = new MemberConnect();
	int result = dao.setInsert(dto);
	
	if (result > 0) {
		out.println("<script>");
		out.println("alert('정상 처리 되었습니다.');");
		out.println("location.href='login.jsp';");
		out.println("</script>");

	} else {
		out.println("<script>");
		out.println("alert('처리중 오류가 발생했습니다.');");
		out.println("location.href='join.jsp';");
		out.println("</script>");
	}
%>