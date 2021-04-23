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

<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
$(function() {
	$("#btnList").click(function() {
		location.href = "memberList.do";
	});
	//수정버튼클릭
	$("#btnUpdate").click(function() {
		document.form1.action = "memberUpdate.do";
		document.form1.submit();
	});
	//삭제버튼클릭
	$("#btnDelete").click(function() {
		if (confirm('삭제하시겠습니까?')) {
			document.form1.action = "memberDelete.do";
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
<h2>회원정보</h2>
<form name="form1" method="post">
<table border="1" width="400">
	<tr>
		<td>아이디</td>
		<td><input type="text" name="id" value="${dto.id}" readonly></td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td><input type="password" name="passwd"></td>
	</tr>
	<tr>
		<td>이름</td>
		<td><input type="text" name="name" value="${dto.name}"></td>
	</tr>
	<tr>
		<td>이메일</td>
		<td><input type="text" name="email" value="${dto.email}"></td>
	</tr>
	<tr>
		<td>회원가입일자</td>
		<td><fmt:formatDate value="${dto.regi_date}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<input type="button" value="목록" id="btnList">
			<input type="button" value="수정" id="btnUpdate">
			<input type="button" value="삭제" id="btnDelete">
			<div id="msg" style="color: red">${msg }</div>
		</td>
	</tr>
</table>
</form>

</body>
</html>