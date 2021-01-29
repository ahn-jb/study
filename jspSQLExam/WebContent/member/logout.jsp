<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.invalidate(); //세션제거
	out.println("<script>");
	out.println("alert('로그아웃 되었습니다.');");
	out.println("location.href='../member/login.jsp';");
	out.println("</script>");
%>