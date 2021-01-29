<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./inc/include_session.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지</title>
</head>
<body>
	<%if(cookId != ""){ %>
	<h2><%=cookId%>님 환영합니다. <a href="./logout.jsp">[로그아웃]</a> <a href="./change.jsp">[비밀번호 변경]</a></h2>
<!-- 	<input type="button" onclick="location.href='change.jsp';" value="비밀번호 변경"></h2> -->
	<%}else{ %>
		<h2><a href="./login.jsp">로그인</a></h2>
	<%} %>
	<br>
	<h2>메인페이지 입니다.</h2>
	
</body>
</html>