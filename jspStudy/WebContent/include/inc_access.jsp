<%@page import="model.dto.member.MemberDTO"%>
<%@page import="model.dao.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>


<%
	if( Integer.parseInt(session.getAttribute("cookNo").toString()) != 0){
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = dao.getSelectOneNo(cookNo); //오류 아님
		 
		if(dto.getNo() == 0){//오류참고 : no 설정 안해줬으면 오류 발생할 수 있음 
			out.println("<script>");
			out.println("alert('권한 제한.');");
			out.println("location.href='../member/homepage.jsp';");
			out.println("</script>");
			
		}else if(dto.getNo() != 0){
			
		}else if(dto.getGrade() == 1){
		
			
		}else if( cookNo != No){
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