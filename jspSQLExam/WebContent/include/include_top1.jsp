<%@page import="model.member.MemberDTO"%>
<%@page import="model.member.MemberDAO"%>
<%@page import="java.net.Inet4Address"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<table border="0" align="center" width="600">
	<tr>
		<th height="30"><a href="homepage.jsp">HOME</a></th>
		
		<th><a href="../board/list.jsp">게시판</a></th>
		
		<% if(session.getAttribute("cookId") != null){ %>
		<th><a href="logout.jsp">로그아웃</a></th>
		<%}else{ %>
		<th><a href="login.jsp">로그인</a></th>
		<th><a href="join.jsp">회원가입</a></th>
		<%} %>
		<th>ip:<%=Inet4Address.getLocalHost().getHostAddress() %></th>
	</tr>
</table>