<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>

<%@ page import="resume.ResumeImpl" %>
<jsp:useBean id="dto" class="resume.ResumeDTO" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>

<%
	ResumeImpl dao = new ResumeImpl();
	int result = dao.setInsert(dto);
	
	if (result > 0) {
		out.println("<script>");
		out.println("alert('입력 성공.');");
		out.println("location.href='list.jsp';");
		out.println("</script>");

	} else {
		out.println("<script>");
		out.println("alert('오류 발생.');");
		out.println("location.href='write.jsp';");
		out.println("</script>");
	}
%>