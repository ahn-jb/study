<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="etc.member.MemberConnect" %>
<%@ page import="etc.member.MemberDTO" %>

<%
	

	String cookId =null;


	if(session.getAttribute("cookId")== null){
		// 		out.println("로그인안함" +"<hr>");
		out.println("<script>");
		out.println("alert('로그인 해주세요.');");
		out.println("location.href='login.jsp';");
		out.println("</script>");
	}else{
		cookId = (String)session.getAttribute("cookId");
		
		
// 		MemberConnect dao = new MemberConnect();
// 		MemberDTO dto =dao.getSelectOne(cookId);
		
// 		String name = dto.getName();
%>	
<!-- <table border="1" width="450"> -->
<!-- 	<tr> -->
<!-- 		<td colspan="6" height="50" align="right" > -->
<%-- 			<%=dto.getNickname() %>[등급:<%=dto.getGrade() %>]님 환영합니다 --%>
<!-- 	    	<button type="button" onclick="location.href='logout.jsp';">로그아웃</button> -->
<!-- 		</td> -->
<!-- 	</tr> -->
<!-- 	<tr> -->
<%-- 		<%if(dto.getGrade().equals("1")){ %> --%>
<!-- 		<td>회원관리</td> -->
<%-- 		<%} %> --%>
<%-- 		<%if(dto.getGrade().equals("1") || dto.getGrade().equals("2")){ %> --%>
<!-- 		<td>상품관리</td> -->
<%-- 		<%} %> --%>
<%-- 		<%if(dto.getGrade().equals("1") || dto.getGrade().equals("3")){ %> --%>
<!-- 		<td>배송관리</td> -->
<%-- 		<%} %> --%>
<!-- 		<td>문의관리</td> -->
<!-- 		<td>주문페이지</td> -->
<!-- 		<td><button type="button" onclick="location.href='list.jsp';">목록</button></td> -->
<!-- 	</tr> -->
<!-- </table>	 -->
<%		
	}
%>

