<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>설문지 만들기</title>
</head>
<body>
	<h2>설문지 생성</h2>
	<form name="surveyForm">
		<table>
			<tr>
				<td>질문</td>
				<td><input type="text" name="question"></td>
			</tr>
			<tr>
				<td>선택1</td>
				<td><input type="text" name="select1"></td>
			</tr>
			<tr>
				<td>선택2</td>
				<td><input type="text" name="select2"></td>
			</tr>
			<tr>
				<td>선택3</td>
				<td><input type="text" name="select3"></td>
			</tr>
			<tr>
				<td>선택4</td>
				<td><input type="text" name="select4"></td>
			</tr>
		</table>
		<button type="button" onclick="save();">저장하기</button>
	</form>
<script>
	function save(){
		document.surveyForm.method="post";
		document.surveyForm.action="survey_writeProc.jsp";
		document.surveyForm.submit();
	}
</script>	
</body>
</html>