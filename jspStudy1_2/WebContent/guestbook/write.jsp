<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/inc_header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록</title>
</head>
<body>
	<h2>방명록 작성</h2>
	<form name="writeForm">
		<table border="1">
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" style="width:97%;"></td>
			</tr>
			<tr>	
				<td>email</td>
				<td><input type="text" name="email" style="width:97%;"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="passwd" style="width:97%;"></td>
			</tr>
			<tr>
				<td colspan="2">
					<textarea name="content"  style="width :500px; height:100px;"></textarea>
				</td>
			</tr>
			<tr >
				<td colspan="2" align="center">
					<button type="button" onclick="save();">확인</button>
					<button type="button" onclick="location.href='${path}/guestbook_servlet/list.do';">취소</button>
				</td>
			</tr>
		</table>
	</form>
<script type="text/javascript">
	function save(){
		document.writeForm.method="post";
		document.writeForm.action="${path}/guestbook_servlet/writeProc.do?";
		document.writeForm.submit();
	}
</script>
</body>
</html>