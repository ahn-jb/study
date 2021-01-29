<%@page import="java.net.Inet4Address"%>
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
	<form name="loginForm">
		<input type="hidden" name="ip" value="<%=Inet4Address.getLocalHost().getHostAddress()%>">
		<table>
			<tr>
				<td>아이디: </td>
				<td><input type="text" name="id"></td>
			</tr>
			<tr>
				<td>비밀번호:</td>
				<td><input type="password" name="pw"></td>
			</tr>
		</table>
		<br>
		<button type="button" onclick="login();">로그인</button>
		<button type="button" onclick="location.href='join.jsp';">회원가입</button>
	</form>
</body>
</html>
<script>
	function login(){
		if(document.loginForm.id.value.trim() ==""){
			alert('아이디를 입력해주세요.')
			document.loginForm.id.focus();
			return false;
		}else if(document.loginForm.pw.value.trim() ==""){
			alert('비밀번호를 입력해주세요.')
			document.loginForm.pw.focus();
			return false;
		}else{
			document.loginForm.method="post";
			document.loginForm.action="loginProc.jsp";
			document.loginForm.submit();
		}
	}
</script>