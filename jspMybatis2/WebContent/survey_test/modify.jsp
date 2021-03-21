<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/inc_header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>상세보기</h2>
	<form name="modify">
		<table>
			<tr>
				<td>no</td>
				<td><input type="text" name="no" value="${dto.getNo()}" readonly> </td>
			</tr>
			<tr>
				<td>질문</td>
				<td><input type="text" name="question" value="${dto.getQuestion()}"></td>
			</tr>
			<tr>
				<td>선택1</td>
				<td><input type="text" name="ans1" value="${dto.getAns1()}"></td>
			</tr>
			<tr>
				<td>선택2</td>
				<td><input type="text" name="ans2" value="${dto.getAns2()}"></td>
			</tr>
			<tr>
				<td>선택3</td>
				<td><input type="text" name="ans3" value="${dto.getAns3()}"></td>
			</tr>
			<tr>
				<td>선택4</td>
				<td><input type="text" name="ans4" value="${dto.getAns4()}"></td>
			</tr>
			<tr>
				<td>status</td>
				<td><input type="text" name="status" value="${dto.getStatus()}"></td>
			</tr>
		</table>
		<button type="button" onclick="sujeong();">저장</button>
	</form>
<script>
	function sujeong(){
		alert('aaa');
		 modify.method="post";
		 modify.action="${path}/test_servlet/modifyProc.do";
		 modify.submit();
	}
</script>
</body>
</html>