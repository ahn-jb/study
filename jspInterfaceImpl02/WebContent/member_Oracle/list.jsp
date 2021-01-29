<%@page import="java.util.ArrayList"%>
<%@page import="model.member.MemberDAOImplOracle"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>   
<%@ page import="model.member.MemberDAO" %>
<%@ page import="model.member.MemberDTO" %>

<%
	MemberDAO dao = new MemberDAOImplOracle();

	ArrayList<MemberDTO> list = dao.getSelectAll();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록-Oracle</title>
</head>
<body>
	<h2>회원목록</h2>
	<table border="1" width="450">
		<tr>
			<td>아이디</td>
			<td>비밀번호</td>
			<td>이름</td>
			<td>전화번호</td>
			<td>직업</td>
		</tr>
		<%
			for(int i=0; i<list.size(); i++){
				MemberDTO dto = list.get(i);
			
		%>
		<tr>
			<td><a href=# onclick="view('<%=dto.getId()%>');"><%=dto.getId()%></a></td>
			<td><%=dto.getPwd()%></td>
			<td><%=dto.getName()%></td>
			<td><%=dto.getPhone()%></td>
			<td><%=dto.getJob()%></td>
		</tr>
		<%} %>
	</table>
</body>
</html>
<script>
	function view(value1){
		location.href='view.jsp?id='+value1;
	}
</script>