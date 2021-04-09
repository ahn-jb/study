<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../include/inc_menu.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>회원등록</h2>
	<form name="form1" method="post" action="memberChugaProc.do">
		<table>
			<tr>
				<td>아이디</td>
				<td><input type="text" id="id" name="id"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="text" id="passwd" name="passwd"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" id="name" name="name"></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="text" id="email" name="email"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="가입하기"></td>
			</tr>
		</table>
	</form>
</body>
</html>