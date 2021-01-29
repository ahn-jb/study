<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메모안에 인덱스</title>
</head>
<body>
	<%
		String temp= request.getContextPath()+"/memo/write.jsp";
		String path = "/model2"; //서버를 옮겨서 파일명이 바뀌면..
		response.sendRedirect(temp);
	
	%>
<!-- 	<meta http-equiv = "refresh" content="2;url=write.jsp"> -->
	
	
</body>
</html>