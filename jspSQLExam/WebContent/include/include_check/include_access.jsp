<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="model.member.MemberDAO" %>
<%@ page import="model.member.MemberDTO" %>

<%
	if(session.getAttribute("cookId") != null){
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = dao.getSelectOne(cookNo);//오류 아님
		 
		if(cookNo== Integer.parseInt(request.getParameter("cookNo"))){
			
			
		}else if(dto.getGrade() == 1){
			
		}else if(cookNo != Integer.parseInt(request.getParameter("cookNo"))){
			out.println("<script>");
			out.println("alert('권한 제한.');");
			out.println("location.href='../member/homepage.jsp';");
			out.println("</script>");
			
			
		}else if(dto.getGrade() != 1){
		
				out.println("<script>");
				out.println("alert('권한 제한.');");
				out.println("location.href='../member/homepage.jsp';");
				out.println("</script>");
			}
		
	}
%>