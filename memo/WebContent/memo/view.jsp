<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="memo.MemoDTO"%>
<%@page import="memo.MemoDAO"%>
<% request.setCharacterEncoding("UTF-8"); %>

 <%
 	int id = Integer.parseInt(request.getParameter("id"));
 	MemoDAO dao = new MemoDAO();
 	MemoDTO dto = dao.getSelectOne(id);
 %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세보기</title>
</head>
<body>
<form name="viewForm">
	<table border="1" width="300">
		<tr>
			<td>ID</td>
			<td><%=dto.getId() %> </td>
		</tr>
		<tr>
			<td>이름</td>
			<td><input type="text" name="name" value="<%=dto.getName() %>"></td>
		</tr>
		<tr>
			<td>메모</td>
			<td><input type="text" name="memo" value="<%=dto.getMemo() %>"></td>
		</tr>
		<tr>
			<td>날짜</td>
			<td><%=dto.getRegidate() %> </td>
		</tr>
	</table>
</form><br>
		<button type="button" onclick="sujeong('<%=id%>')">수정</button>
		<button type="button" onclick="remove('<%=id%>');">삭제</button>
<script>
	function remove(value1){
		location.href="delete.jsp?id="+value1;
	}
	function sujeong(value1){
		document.viewForm.method="post";
		document.viewForm.action="sujeong.jsp?id="+value1;
		document.viewForm.submit();
	}
</script>
</body>
</html>