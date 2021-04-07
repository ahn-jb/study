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
	<h2>test08.do / exam01Result.jsp</h2>
	<h2>id : ${id}</h2>
	<h2>pw : ${pw}</h2>
<%-- 	<h2>msg : ${msg}</h2> --%>
<script>
$(document).ready(function(){
	var msg = "${msg}";
	alert(msg);
});
</script>
</body>
</html>