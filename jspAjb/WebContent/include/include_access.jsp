<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="etc.member.MemberDAO" %>
<%@ page import="etc.member.MemberDAOImplOracle" %>
<%@ page import="etc.member.MemberDTO" %>

<%
	if(session.getAttribute("cookId") != null){
		 dao = new MemberDAOImplOracle();
		 dto = dao.getSelectOne(cookId);//오류 아님
		 
		if(cookId.equals(request.getParameter("id"))){
			
			
		}else if(!cookId.equals(request.getParameter("id"))){
			out.println("<script>");
			out.println("alert('권한 제한.');");
			out.println("location.href='list.jsp';");
			out.println("</script>");
			
			
		}else if(!dto.getGrade().equals("1")){
		
				out.println("<script>");
				out.println("alert('권한 제한.');");
				out.println("location.href='list.jsp';");
				out.println("</script>");
			}
		
	}
%>