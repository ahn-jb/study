<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>   
<%@ page import="model.member.MemberDTO" %>
<%@ page import="model.member.MemberConnect" %>

<%
	String id = request.getParameter("id");
	MemberConnect dao = new MemberConnect();
	MemberDTO dto = dao.getSelectOne(id);

%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세보기</title>
</head>
<body>
	<h2>회원 상세보기</h2>
	<form name="view">
		<table border="1" width="450">
			<tr>
				<td>아이디</td>
				<td><%=dto.getId()%></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><%=dto.getPwd()%></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><%=dto.getName()%></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><%=dto.getPhone()%></td>
			</tr>
			<tr>	
				<td>직업</td>
				<td><%=dto.getJob()%></td>
			</tr>
		</table>
		<button type="button" onclick="go('<%=dto.getId()%>');">수정하기</button>
		<button type="button" onclick="remove('<%=dto.getId()%>');">탈퇴하기</button>
	</form>
</body>
</html>

<script>
 function go(value1){
	 location.href='update.jsp?id='+value1;
 }
 function remove(value1){
	 location.href='delete.jsp?id='+value1;
 }
 
</script>