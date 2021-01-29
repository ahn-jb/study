<%@page import="etc.member.MemberDAO"%>
<%@page import="etc.member.MemberDAOImplOracle"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>

<jsp:useBean id="dto" class="etc.member.MemberDTO"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>

<%
	MemberDAO dao = new MemberDAOImplOracle();

	int result = dao.setInsert(dto);
	
	if(result >0){
	out.println("<script>");
	out.println("alert('회원가입 완료.');");
	out.println("location.href='login.jsp';");
	out.println("</script>");

	}else {
	out.println("<script>");
	out.println("alert('처리중 오류가 발생했습니다.');");
	out.println("location.href='join.jsp';");
	out.println("</script>");
}
%>