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
	<form action="test05Proc.do" method="post">
		이름 : <input type="text" name="name" id="name" value=""> <br>
		국어 : <input type="text" name="kor" id="kor" value=""> <br>
		영어	: <input type="text" name="eng" id="eng" value=""> <br>
		수학	: <input type="text" name="mat" id="mat" value=""> <br>
		과학	: <input type="text" name="sci" id="sci" value=""> <br>
		역사	: <input type="text" name="his" id="his" value=""> <br>
		<input type="submit" value="확인">
	</form>
</body>
</html>