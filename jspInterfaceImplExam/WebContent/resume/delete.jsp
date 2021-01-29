<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%@ page import="resume.ResumeDTO" %>
<%@ page import="resume.ResumeImpl" %>

<%	
	int no = Integer.parseInt(request.getParameter("no"));
	ResumeImpl dao = new ResumeImpl();
	int result = dao.setDelete(no);
	
	if (result > 0) {
		out.println("<script>");
		out.println("alert('삭제 성공.');");
		out.println("location.href='list.jsp';");
		out.println("</script>");

	} else {
		out.println("<script>");
		out.println("alert('오류 발생.');");
		out.println("location.href='write.jsp';");
		out.println("</script>");
	}
%>