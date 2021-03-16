<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%@ include file="../include/include_import.jsp" %>
<jsp:useBean id="dto" class="model.member.MemberDTO"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>

<%
	MemberDAO_imsi dao =new MemberDAO_imsi();

	int result = dao.setInsertAsk(dto);
	
	if(result >0){
		out.println("<script>");
		out.println("alert('문의하기 완료.');");
		out.println("location.href='../member/mypage.jsp';");
		out.println("</script>");

		}else {
		out.println("<script>");
		out.println("alert('처리중 오류가 발생했습니다.');");
		out.println("location.href='../member/mypage.jsp';");
		out.println("</script>");
	}
%>