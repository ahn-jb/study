<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  

<%@ include file="../include/inc_header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="0"/>
<meta http-equiv="Pragma" content="no-cache"/>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>	
<script>
	$(document).ready(function(){
		$("#id").focus();
		
		$("#btnLogin").click(function(){
			var id = $("#id").val();
			var passwd = $("#passwd").val();
			if (id == "") {
				alert("아이디를 입력하세요.");
				$("#id").focus();
				return;
			}
			if (passwd == "") {
				alert("비밀번호를 입력하세요.");
				$("#passwd").focus();
				return;
			}
			
			if (confirm('로그인하시겠습니까?')) {
				document.form1.action="${path}/memberLoginCheck";
				document.form1.submit();
			}
		});
	});
</script>

</head>
<body>

<%-- <jsp:include page="../include/inc_menu.jsp" /> --%>
<%@include file="../include/inc_menu.jsp"%>

${path }<br>
<h2>로그인</h2>
<form name="form1" method="post">
<table border="1" width="400px">
	<tr>
		<td>아이디</td>
		<td><input type="text" name="id" id="id"></td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td><input type="password" name="passwd" id="passwd"></td>
	</tr>
	<tr>
		<td colspan="2">
			<button type="button" id="btnLogin">로그인</button>
<%-- 		
			<c:if test="${param.message == 'nologin'}>
				<div style="color:red;">
					먼저 로그인 하세요.
				</div>
			</c:if>
			<c:if test="${param.message == 'error'}>
				<div style="color:red;">
					아이디 또는 비밀번호가 일치하지 않습니다.
				</div>
			</c:if>
			<c:if test="${param.message == 'logout'}>
				<div style="color:red;">
					로그아웃 되었습니다.
				</div>
			</c:if>
--%>
		</td>
	</tr>
</form>

</body>
</html>