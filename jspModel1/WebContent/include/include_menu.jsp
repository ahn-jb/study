<%@page import="etc.member.MemberDTO"%>
<%@page import="etc.member.MemberConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
 <%
 
	if(session.getAttribute("cookId") != null){
		
	MemberConnect dao = new MemberConnect();
	MemberDTO dto =dao.getSelectOne(cookId); //오류아님
	

 %>
 <table border="1" width="450">
	<tr>
		<td colspan="6" height="50" align="right" >
			<%=dto.getNickname() %>[등급:<%=dto.getGrade() %>]님 환영합니다
	    	<button type="button" onclick="location.href='logout.jsp';">로그아웃</button>
		</td>
	</tr>
	<tr>
		<%if(dto.getGrade().equals("1")){ %>
		<td>회원관리</td>
		<%} %>
		<%if(dto.getGrade().equals("1") || dto.getGrade().equals("2")){ %>
		<td>상품관리</td>
		<%} %>
		<%if(dto.getGrade().equals("1") || dto.getGrade().equals("3")){ %>
		<td>배송관리</td>
		<%} %>
		<td>문의관리</td>
		<td>주문페이지</td>
		<td><button type="button" onclick="location.href='list.jsp';">목록</button></td>
	</tr>
</table>
<%} %>	