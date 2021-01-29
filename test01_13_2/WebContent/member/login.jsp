<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<h2>로그인</h2>
	<table>
		<tr>
			<td>아이디:</td>
			<td>
				<input type="text" name="id" value="hong@gmail.com">
			</td>
		</tr>
		<tr>
			<td>비밀번호:</td>
			<td>
				<input type="password" name="pw" value="12345678">
			</td>
		</tr>
	</table>
	<br>
	<button type="button" onclick="location.href='view.jsp';">로그인</button>
	<button type="button" onclick="location.href='join.jsp';">회원가입</button>
</body>
</html>