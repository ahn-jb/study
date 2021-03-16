<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="model.member.MemberDAO" %>
<%@ page import="model.member.MemberDTO" %>

<%
	if(session.getAttribute("cookId") != null){
		MemberDAO_imsi dao = new MemberDAO_imsi();
		MemberDTO dto = dao.getSelectOneId(cookId); //오류 아님
		 
		if(dto.getNo() == no){//오류참고 : no 설정 안해줬으면 오류 발생할 수 있음 
	
	
		}else if(dto.getGrade() == 1){
	
		}else if(!cookId.equals(request.getParameter("id"))){
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