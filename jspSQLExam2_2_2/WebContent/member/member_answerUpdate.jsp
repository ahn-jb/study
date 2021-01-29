<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/include_import.jsp" %>
<%request.setCharacterEncoding("UTF-8");%>

<jsp:useBean id="dto" class="model.member.MemberDTO"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>


<%
	MemberDAO dao2 = new MemberDAO();
	int result = dao2.setUpdateAnswer(dto);
	
	
	int no_member = Integer.parseInt(request.getParameter("no_member"));
	if(result >0){
		out.println("<script>");
		out.println("alert('답변수정 완료.');");
		out.println("location.href='../member/member_ask.jsp?no="+no_member+"';");
		out.println("</script>");

		}else {
		out.println("<script>");
		out.println("alert('처리중 오류가 발생했습니다.');");
		out.println("location.href='../member/member_ask.jsp';");
		out.println("</script>");
	}
%>