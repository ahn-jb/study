<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/inc_header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리스트</title>
</head>
<body>

<table border="1">
	<tr>
		<td>No</td>
		<td>이름</td>
		<td>메모</td>
		<td>날짜</td>
	</tr>	
	<c:forEach var="row" items="${list }">
	<tr>
		<td>${row.no}</td>
		<td>${row.writer}</td>
		<td>${row.content}</td>
		<td>${row.regi_date}</td>
	</tr>
	</c:forEach>
</table>
</body>
</html>