<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="java.net.Inet4Address"%>
<%
	String ip= Inet4Address.getLocalHost().getHostAddress();
	//out.println("ip:"+ip+"<hr>");
// 	if(!ip.equals("192.168.0.3")){
// 		out.println("<script>");
// 		out.println("alert('접근제한 ip입니다.');");
// 		out.println("location.href='login.jsp';");
// 		out.println("</script>");
// 	}
	
	
	
	
%>
