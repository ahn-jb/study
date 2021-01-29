<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%	
	String cookId= "";
	
	if( null == session.getAttribute("cookId") ){
		cookId = "";
	}else if(session.getAttribute("cookId") != null){
		cookId = (String)session.getAttribute("cookId");
	}
	
	
%>

