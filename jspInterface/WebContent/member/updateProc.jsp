<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>

<%@ page import="member.MemberDAO"%>    
<jsp:useBean id="dto" class="member.MemberDTO" scope="page"></jsp:useBean>
<jsp:setProperty name="dto" property="*"/>


<%

	MemberDAO dao =new MemberDAO();
	int result = dao.getUpdate(dto);
	

	if (result > 0) {
		out.println("<script>");
		out.println("alert('정상 처리 되었습니다.');");
		out.println("location.href='list.jsp';");
		out.println("</script>");

	} else {
		out.println("<script>");
		out.println("alert('처리중 오류가 발생했습니다.');");
		out.println("location.href='list.jsp';");
		out.println("</script>");
	}
%>