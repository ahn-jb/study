<%@page import="model.member.MemberDTO"%>
<%@page import="model.member.MemberDAO"%>
<%@page import="java.net.Inet4Address"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String ip = request.getParameter("ip");
	String cookId = request.getParameter("cookId");
	MemberDAO	dao = new MemberDAO();
	MemberDTO dto =dao.getSelectOne(cookId);
%>

<!--  --------------상단메뉴 -->
<table border="0" align="center" width="600">
	<tr>
		<th height="30">HOME</th>
		
		<th><a href="../member/member.jsp">회원관리</a></th>
		<th>게시판</th>
		<% if(dto.getId() != null){ %>
		<th><a href="../member/logout.jsp">로그아웃(<%=dto.getName() %>)</a></th>
		<%}else{ %>
		<th><a href="../member/login.jsp">로그인</a></th>
		<%} %>
		<th>ip:<%=ip %></th>

<%-- 		<th>ip:<%=Inet4Address.getLocalHost().getHostAddress() %></th> --%>
	</tr>
</table>