<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>

<%@ page import="member.MemberDAO"%>    
<%@ page import="member.MemberDTO"%>

<%
	MemberDAO dao = new MemberDAO();
	ArrayList<MemberDTO> list = dao.getSelectAll();
	
%>    
    
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 리스트</title>
</head>
<body>
	<h2>회원목록</h2>
	<table border="1" width ="600">
		<tr>
			<td>아이디</td>
			<td>비밀번호</td>
			<td>이름</td>
			<td>전화번호</td>
			<td>직업</td>
		</tr>
		<% for(int i=0; i<list.size(); i++){
			MemberDTO dto = list.get(i);	
		%>
		
		<tr>
			<td><%=dto.getId() %></td>
			<td><%=dto.getPwd() %></td>
			<td><%=dto.getName() %></td>
			<td><%=dto.getPhone() %></td>
			<td><%=dto.getJob() %></td>
		</tr>
		<%} %>
	</table>
</body>
</html>