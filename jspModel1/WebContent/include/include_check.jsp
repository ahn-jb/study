<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="java.net.Inet4Address"%>
<%
	String ip= Inet4Address.getLocalHost().getHostAddress();
	//out.println("ip:"+ip+"<hr>");
	if(!ip.equals("211.54.173.202")){
// 		out.println("<script>alert('접근불가');</script>");
	}
	
	
	
	
%>
