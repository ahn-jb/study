<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%@ include file="../../include/inc_header.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%@ include file="../../include/inc_menu.jsp" %>

${path }<br>
<h2>test01.do / exam01.jsp</h2>

<form action="test01Proc.do" method="post">
이름 : <input type="text" name="name" id="name" value=""><br>
주민번호 : <input type="text" name="jumin" id="jumin" value=""><br>
<input type="submit" value="확인">
</form>		

</body>
</html>