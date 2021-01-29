<%@page import="model.member.MemberExample"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <% request.setCharacterEncoding("UTF-8");%>   
<%@ page import="model.member.MemberDTO" %>

<%
	String id = request.getParameter("id");
	MemberExample dao = new MemberExample();
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
				<td>비밀번호</td>
				<td>이름</td>
				<td>전화번호</td>
				<td>직업</td>
			</tr>
	
			<tr>
				<td><%=dto.getId()%></td>
				<td><%=dto.getPwd()%></td>
				<td><%=dto.getName()%></td>
				<td><%=dto.getPhone()%></td>
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