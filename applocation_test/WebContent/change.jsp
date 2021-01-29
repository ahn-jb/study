<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./inc/include_session.jsp" %>
<%@ include file="./inc/include_session_check.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 수정페이지</title>
</head>
<body>
	<h2><%=cookId%>님 환영합니다. <a href="./logout.jsp">로그아웃</a></h2>
	<form name="changeForm">
		<input type="hidden" name="id" value="<%=cookId%>">
		<table border="1">
			<tr>
				<td>
					비밀번호:
				</td>
				<td>
					<input type="text" name="passwd">
				</td>
			</tr>
			<tr>
				<td>
					비밀번호 확인:
				</td>
				<td>
					<input type="text" name="passwd_check">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center"> 
					<input type="button" onclick="save();" value="비밀번호 변경하기">
					<input type="button" onclick="location.href='main.jsp'" value="메인페이지">
				</td>
			</tr>
		</table>
	</form>
<script type="text/javascript">
	function save(){
		 if(document.changeForm.passwd.value.trim() ==""){
				alert('비밀번호를 입력하세요.')
				document.changeForm.passwd.focus();
				return false;
			}else if(document.changeForm.passwd.value != document.changeForm.passwd_check.value){
				alert('비밀번호 확인이 일치하지 않습니다.')
				document.changeForm.passwd_check.focus();
				return false;
			}else{
				changeForm.method="post";
				changeForm.action="changeProc.jsp";
				changeForm.submit();
			}
	}
</script>
</body>
</html>