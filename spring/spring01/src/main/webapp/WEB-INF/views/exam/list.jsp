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
			<td>순번</td>
			<td>아이디</td>
			<td>이름</td>
			<td>주민번호</td>
			<td>성별</td>
			<td>나이</td>
			<td>등록일</td>
		</tr>
		<c:forEach var="dto" items="${list}">
			<tr>
				<td>${dto.no}</td>
				<td>
					<a href="${path}/examView.do?no=${dto.no}">${dto.name}</a>
				</td>
				<td>${dto.name}</td>
				<td>${dto.jumin}</td>
				<td>${dto.gender}</td>
				<td>${dto.age}</td>
				<td>${dto.regi_date}<br>
					<fmt:formatDate value="${dto.regi_date }" pattern="yyyy-MM-dd"></fmt:formatDate><br>
					<fmt:formatDate value="${dto.regi_date }" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate><br>
				</td>
			</tr>
		</c:forEach>
	</table>
	<br>
	<a href="#" onclick="location.href='examChuga.do';">[등록]</a>
</body>
</html>