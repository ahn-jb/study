<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="memo.MemoDTO"%>
<%@page import="memo.MemoDAO"%>
<% request.setCharacterEncoding("UTF-8"); %>

<%
	int id = Integer.parseInt(request.getParameter("id"));

	MemoDAO dao = new MemoDAO();
	int result = dao.delete(id);
	
	if(result >0){
		out.println("<script>");
		out.println("alert('삭제 완료.');");
		out.println("location.href='../memo/memo.jsp';");
		out.println("</script>");

		}else {
		out.println("<script>");
		out.println("alert('처리중 오류가 발생했습니다.');");
		out.println("location.href='../memo/memo.jsp';");
		out.println("</script>");
	}
	
%>