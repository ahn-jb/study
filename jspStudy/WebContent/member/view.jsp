<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/inc_header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세보기</title>
</head>
<body>	

<h2>회원 상세정보</h2>
	<form name="viewForm">
		<table>
			<tr>
				<td>등급:</td>
				<td><input type="text" name="grade" value="${dto.getGrade()}" readonly></td>
			</tr>
			<tr>
				<td>아이디:</td>
				<td><input type="text" name="id" value="${dto.getId()}" readonly></td>
			</tr>
			<tr>
				<td>비밀번호:</td>
				<td><input type="password" name="pw"></td>
			</tr>
			<tr>
				<td>이름:</td>
				<td><input type="text" name="name" value="${dto.getName()}" readonly></td>
			</tr>
			<tr>
				<td>성별:</td>
				<td>
					<input type="text" name="gender" value="${dto.getGender()}" readonly>
				</td>
			</tr>
			<tr>
				<td>생년:</td>
				<td><input type="text" name="bornYear" value="${dto.getBornYear()}" readonly></td>
			</tr>
	</table>
		<br>
			<button type="button" onclick="sujeong('${dto.getPw()}','${dto.getNo()}');">수정하기</button>
			<button type="button" onclick="remove('${dto.getPw()}','${dto.getNo()}');">삭제하기</button>
			<button type="button" onclick="history.back()">취소</button>
	</form>
<script type="text/javascript">
function sujeong(value1,value2){
	if(document.viewForm.pw.value != value1){
		alert('비밀번호가 다릅니다.')
		location.href="${path}/member_servlet/view.do?no="+value2;
	}else if(confirm('수정 페이지로 가시겠습니까?')){
		location.href="${path}/member_servlet/modify.do?no="+value2;
	}
}

function remove(value1,value2){
	if(document.viewForm.pw.value != value1){
		alert('비밀번호가 다릅니다.')
		location.href="${path}/member_servlet/view.do?no="+value2;
	}else if(confirm('삭제 페이지로 가시겠습니까?')){
		location.href="${path}/member_servlet/delete.do?no="+value2;
	}
}
</script>
</body>
</html>