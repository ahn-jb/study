<%@page import="etc.member.MemberDTO"%>
<%@ page import="etc.member.MemberDAO" %>
<%@ page import="etc.member.MemberDAOImplOracle" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
 <%
	 MemberDAO dao = new MemberDAOImplOracle();
	 MemberDTO dto =dao.getSelectOne(cookId); //오류 아님
	 
// 	System.out.println(cookId);
// 	System.out.println(dto.getId());
	 
 	if(dto.getId() == null ){
 		session.invalidate();
 		
		out.println("<script>");
		out.println("location.href='login.jsp';");
		out.println("</script>");
		
	}else if(session.getAttribute("cookId") != null){
		

 %>
 <table border="1" width="450" align="center">
	<tr>
		<td colspan="6" height="50" align="right" >
			<%=dto.getNickname() %>[등급:<%=dto.getGrade() %>]님 환영합니다
	    	<button type="button" onclick="location.href='logout.jsp';">로그아웃</button>
		</td>
	</tr>
	<tr>
		<%if(dto.getGrade().equals("1")){ %>
		<td><a href="member.jsp">회원관리</a></td>
		<%} %>
		<%if(dto.getGrade().equals("1") || dto.getGrade().equals("2")){ %>
		<td>상품관리</td>
		<%} %>
		<%if(dto.getGrade().equals("1") || dto.getGrade().equals("3")){ %>
		<td>배송관리</td>
		<%} %>
		<td>문의관리</td>
		<td>주문페이지</td>
	</tr>
</table>
<hr>
<%} %>	