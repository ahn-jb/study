<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%	
	String cookId =null;


	if(session.getAttribute("cookId")== null){
		// 		out.println("로그인안함" +"<hr>");
		out.println("<script>");
		out.println("alert('로그인 해주세요.');");
		out.println("location.href='login.jsp';");
		out.println("</script>");
	}else{
		cookId = (String)session.getAttribute("cookId");
		
	}
%>

