<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/inc_header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="0" width="90%">
		<tr>
			<td colspan="20">
				<h2>시험 리스트</h2>
			</td>
		</tr>
		<tr>
			<td>
				<table border="1" width="100%">
					<tr>
						<td>순번</td>						
						<td>시험명</td>						
						<td>타입</td>						
						<td>기간</td>							
					</tr>
					<c:forEach var="dto" items="${list}">
					<tr>
						<td> </td>
						<td> </td>
						<td> </td>
						<td align="center">${dto.start_date}<br>${dto.last_date}</td>
					</tr>
					</c:forEach>
				</table>
			</td>
		</tr>
	</table>
</body>
</html>