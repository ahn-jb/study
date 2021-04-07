<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/inc_menu.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>리스트</h2>
	<table border="1">
		<tr>
			<td>아이디</td>
			<td>이름</td>
			<td>이메일</td>
			<td>등록일</td>
		</tr>
		<c:forEach var="dto" items="${list}">
			<tr>
				<td>
					<a href="${path}/memberView.do?id=${dto.id}">${dto.name}</a>
				</td>
				<td>${dto.name}</td>
				<td>${dto.email}</td>
				<td>${dto.regi_date}<br>
					<fmt:formatDate value="${dto.regi_date }" pattern="yyyy-MM-dd"></fmt:formatDate><br>
					<fmt:formatDate value="${dto.regi_date }" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate><br>
				</td>
			</tr>
		</c:forEach>
	</table>
	<br>
	<a href="#" onclick="location.href='memberChuga.do';">[등록]</a>
</body>
</html>