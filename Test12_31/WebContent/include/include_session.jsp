<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%	
	String cookId =null;


	if(session.getAttribute("cookId")== null){
		// 		out.println("로그인안함" +"<hr>");
	
	}else{
		cookId = (String)session.getAttribute("cookId");
		
	}
%>

