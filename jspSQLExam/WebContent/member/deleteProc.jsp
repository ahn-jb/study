<%request.setCharacterEncoding("UTF-8");%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.member.MemberDAO" %>
<%@ page import="model.member.MemberDTO" %>


<%
	int no = Integer.parseInt(request.getParameter("no"));
	MemberDAO dao = new MemberDAO();
	int result = dao.delete(no);
	
	if(result >0){
		out.println("<script>");
		out.println("alert('삭제 완료.');");
		out.println("location.href='list.jsp';");
		out.println("</script>");

		}else {
		out.println("<script>");
		out.println("alert('처리중 오류가 발생했습니다.');");
		out.println("location.href='list.jsp';");
		out.println("</script>");
		}
%>