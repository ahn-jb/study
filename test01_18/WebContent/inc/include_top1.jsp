<%@page import="java.net.Inet4Address"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<table border="0" align=center width="80%">
	<tr>
		<th height="30" >
			<a href="homepage.jsp">HOME</a>
			
		</th > 
		
		<th align="center"><a href="../board/search.jsp">회원관리</a></th>
		
		<th align="center"><a href="../board/search.jsp">게시판[S]</a></th>
		
		<th align="center"><a href="../board/search.jsp">게시판[M]</a></th>
		
		<% if(session.getAttribute("cookId") != null){ %>
		<th align="center"><a href="#">로그아웃</a></th>
		<%}else{ %>
		<th align="center"><a href="#">상품관리</a></th>
		<th align="center"><a href="login.jsp">로그인</a></th>
		<%} %>
		<th align="center">ip:<%=Inet4Address.getLocalHost().getHostAddress() %></th>
	</tr>
</table>