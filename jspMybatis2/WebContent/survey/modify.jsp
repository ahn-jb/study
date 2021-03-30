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
	<form>
		<table border="1">
			<tr>
				<td>no</td>
				<td>${dto.getNo()}</td>
			</tr>
			<tr>
				<td>질문</td>
				<td><input type="text" id="question" name="question" value="${dto.getQuestion()}"></td>
			</tr>
			<tr>
				<td>선택1</td>
				<td><input type="text" id="ans1" name="ans1" value="${dto.getAns1()}"></td>
			</tr>
			<tr>
				<td>선택2</td>
				<td><input type="text" id="ans2" name="ans2" value="${dto.getAns2()}"></td>
			</tr>
			<tr>
				<td>선택3</td>
				<td><input type="text" id="ans3" name="ans3" value="${dto.getAns3()}"></td>
			</tr>
			<tr>
				<td>선택4</td>
				<td><input type="text" id="ans4" name="ans4" value="${dto.getAns4()}"></td>
			</tr>
			<tr>
				<td>status</td>
				<td >
 					<input type="radio" name="status" value="1" onclick="statusChk('1');">진행중
 					<input type="radio" name="status" value="0" onclick="statusChk('0');">종료
 					<input type="hidden" id="status" value="${dto.status}">
 				</td>
			</tr>
			
		</table>
		<button type="button" onclick="sunteak_proc('modifyProc','','${dto.no}');">저장</button>
		<button type="button" onclick="sunteak_proc('resetList','1','');">목록으로</button>
	</form>
<script>
$(document).ready(function(){	
	var status = $('#status').val();
	$("input[name=status][value=" + status + "]").attr("checked", true);
});
function statusChk(value1){
	$('#status').val(value1);
}
</script>
</body>
</html>