<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/inc_header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>

	<form name="loginForm" align="center">
		<h2 >로그인</h2>
		<table align="center">
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
		<button type="button" onclick="join();">회원가입</button>
	</form>
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
			document.loginForm.action="${path}/member_servlet/loginProc.do";
			document.loginForm.submit();
		}
	}
	function join(){
		if(confirm('가입페이지로 가시겠습니까?')){
			location.href="${path}/member_servlet/chuga2.do";
		}
}
</script>
</body>
</html>
