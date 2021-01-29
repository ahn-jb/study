<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.net.Inet4Address"%>    
<%@page import="model.member.MemberDAO"%>    
<%@page import="model.member.MemberDTO"%>
<%@ include file="../include/include_top_common.jsp" %>  
<% request.setCharacterEncoding("UTF-8");%>

<jsp:useBean id="dto" class="model.member.MemberDTO" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>

<%
	String cookId = null;
	
	MemberDAO dao = new MemberDAO();
	int result = dao.Login(dto);
	
	
	MemberDTO dto2 = dao.getSelectOne(request.getParameter("id"));
	
	if(dto2.getLoginCounter() >= 5){
		
		out.println("<script>");
		out.println("alert('5회이상 실패하여 로그인 할 수 없습니다. 고객센터에 문의 해주세요.');");
		out.println("location.href='../member/login.jsp';");
		out.println("</script>");
		
	}else if (result > 0) {
		dao.loginCounterSucsess(dto);
		
		session.setAttribute("cookId", dto.getId());
		
		out.println("<script>");
		out.println("alert('로그인 성공.');");
		out.println("location.href='../member/list.jsp';");
		out.println("</script>");

	}else {
		dao.loginCounterfail(dto);
		
		out.println("<script>");
		out.println("alert('존재하지 않는 아이디이거나 비밀번호가 잘못 되었습니다.("+(dto2.getLoginCounter()+1)+")');");
		out.println("location.href='../member/login.jsp';");
		out.println("</script>");
	}
%>