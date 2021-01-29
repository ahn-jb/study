<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/include_import.jsp" %>
<%@ include file="../include/include_check/include_check.jsp" %>
<%@ include file="../include/include_check/include_session.jsp" %>
<%@ include file="../include/include_check/include_session_check.jsp" %>

<%
	
	int no_ask =Integer.parseInt(request.getParameter("no_ask"));
	
	MemberDAO dao2 = new MemberDAO();
	int result = dao2.setDeleteAnswer(no_ask);
	
	int no = Integer.parseInt(request.getParameter("no_member"));
	
	if(result >0){

		}else {
		out.println("<script>");
		out.println("alert('처리중 오류가 발생했습니다.');");
		out.println("location.href='../member/member_ask.jsp?no="+no+"';");
		out.println("</script>");
	}
	
	result =dao2.setDeleteAsk(no_ask);
	
	
	if(result >0){
		out.println("<script>");
		out.println("alert('문의삭제 완료.');");
		out.println("location.href='../member/member/member_ask.jsp?no="+no+"';");
		out.println("</script>");

		}else {
		out.println("<script>");
		out.println("alert('처리중 오류가 발생했습니다.');");
		out.println("location.href='../member/member/member_ask.jsp';");
		out.println("</script>");
	}
%>