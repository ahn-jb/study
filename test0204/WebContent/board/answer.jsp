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
	<h2>답변글 쓰기</h2>
	<form name="writeForm" action="">
		<input type="hidden" name="no" value="${no}">
		<input type="hidden" name="service" value="1">
		<input type="hidden" name="p_no" value="${p_no}>">
		<table border="1" width ="600" align="center">
			<tr>
				<td>작성자:</td>
				<td><input type="text" name="writer" value="${dto.getId()}" style="width:40%;" ></td>
			</tr>
			<tr>
				<td>이메일:</td>
				<td><input type="text" name="email" value="" style="width:80%;"></td>
			</tr>
			<tr>
				<td>제목:</td>
				<td><input type="text" name="subject" value="[re]${subject}" style="width:80%;"></td>
			</tr>
			<tr>
				<td>내용:</td>
				<td><textarea name="content" style="width:100%; height:100px;">${content}</textarea></td>
			</tr>
			
			<tr>
				<td colspan="2">
					<button type="button" onclick="save();">저장하기</button>
					<button type="button" onclick="location.href='${path}/board_servlet/list.do';">취소</button>
				</td>						
			</tr>
		</table>
	</form>
<script>
function save(){
	if(document.writeForm.writer.value.trim() ==""){
		alert("작성자를 입력하세요.")
		document.writeForm.writer.select();
		document.writeForm.writer.focus();
		return false;
	}else if(document.writeForm.subject.value.trim() ==""){
		alert("제목을 입력하세요.")
		document.writeForm.subject.select();
		document.writeForm.subject.focus();
		return false;
	}else if(document.writeForm.content.value.trim() ==""){
		alert("내용을 입력하세요.")
		document.writeForm.content.select();
		document.writeForm.content.focus();
		return false;
	}else if(confirm('글을 등록하시겠습니까?')){
	document.writeForm.method ="post";
	document.writeForm.action ="${path}/board_servlet/answerProc.do";
	document.writeForm.submit();
	}
}
</script>
</body>
</html>