<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%	
	int cookNo = 0;
	
	if(  null == session.getAttribute("cookNo") ){
		cookNo = 0;
	}else if(session.getAttribute("cookNo") != null){
		cookNo = Integer.parseInt(session.getAttribute("cookNo").toString());
	}
	
	
%>

