<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


 <%
 	if(cookNo == 0){
		out.println("<script>");
		out.println("alert('로그인 해주세요.');");
		out.println("location.href='../member/login.jsp';");
		out.println("</script>");
 	}
 %>
    
    