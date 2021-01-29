<%@page import="model.member.MemberExample"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <% request.setCharacterEncoding("UTF-8");%>   
<%@ page import="model.member.MemberDTO" %>
  
  
 <%
	String id = request.getParameter("id");
 	MemberExample dao = new MemberExample();
	int result=dao.Delete(id);
	
	if (result > 0) {
		out.println("<script>");
		out.println("alert('탈퇴 완료.');");
		out.println("location.href='list.jsp';");
		out.println("</script>");

	} else {
		out.println("<script>");
		out.println("alert('오류 발생.');");
		out.println("location.href='list.jsp';");
		out.println("</script>");
	}
 %>