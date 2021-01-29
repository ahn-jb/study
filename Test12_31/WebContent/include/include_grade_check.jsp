<%@page import="model.member.MemberDTO"%>
<%@page import="model.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
 <%		
 			if(cookId != null){
	 		MemberDAO dao_grade = new MemberDAO();
	 		MemberDTO dto_grade = dao_grade.getSelectOne(cookId);
	 		
	 		if(dto_grade.getGrade() != 1){
	 			out.println("<script>");
	 			out.println("alert('권한이 없습니다.');");
	 			out.println("location.href='../member/list.jsp';");
	 			out.println("</script>");
	 		}
		}
 
 %>