<%@page import="model.member.MemberDTO"%>
<%@ page import="model.member.MemberDAO" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
 <%
	 	dao = new MemberDAO();
	 MemberDTO dto =dao.getSelectOne(cookNo); //오류 아님
	 
// 	System.out.println(cookId);
// 	System.out.println(dto.getId());
	 
 	if(dto.getId() == null ){
 		session.invalidate();
 		
		out.println("<script>");
		out.println("location.href='../member/login.jsp';");
		out.println("</script>");
		
	}else if(session.getAttribute("cookId") != null){
		

 %>
 <table border="1" width="450" align="center">
	<tr>
		<td colspan="6" height="50" align="right" >
			<%=dto.getId() %>[등급:<%=dto.getGrade() %>]님 환영합니다
	    	<button type="button" onclick="location.href='logout.jsp';">로그아웃</button>
		</td>
	</tr>
	<tr>
		<%if(dto.getGrade() == 1){ %>
		<td><a href="member.jsp">회원관리</a></td>
		<%} %>
		<%if(dto.getGrade()== 1 || dto.getGrade()== 2){ %>
		<td>상품관리</td>
		<%} %>
		<%if(dto.getGrade()== 1 || dto.getGrade()== 3){ %>
		<td>배송관리</td>
		<%} %>
		<td>문의관리</td>
		<td>주문페이지</td>
		
		
	</tr>
</table>
<hr>
<%} %>	