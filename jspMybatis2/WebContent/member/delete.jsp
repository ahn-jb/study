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

	<form name="deleteForm">
		<h2>회원 탈퇴</h2>
			<table border="1">
				<tr>
					<td>등급:</td>
					<td><input type="text" name="grade" value="${dto.getGrade()}" ></td>
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
					<td><input type="text" name="name" value="${dto.getName()}"></td>
				</tr>
				<tr>
					<td>성별:</td>
					<td>
						<input type="text" name="gender" value="${dto.getGender()}" readonly>
					</td>
				</tr>
				<tr>
					<td>생년:</td>
					<td><input type="text" name="job" value="${dto.getBornYear()}" readonly></td>
				</tr>
			</table>
		<br><br>
		<table border="1">
			<tr>
				<td>탈퇴를 원하시면 따라적어주세요. </td>
			</tr>
			<tr>
				<td><input type="text" name="text1" value="탈퇴하겠습니다" readonly></td>
			</tr>
			<tr>
				<td><input type="text" name="text2" ></td>
			</tr>
		</table>
		<br>
		<button type="button" onclick="remove('${dto.getPw()}','${dto.getNo()}');">삭제하기</button>
		<button type="button" onclick="sunteak_proc('resetList','1','');">취소</button>
	</form>
<script>
	function remove(value1,value2){
		if(document.deleteForm.pw.value != value1){
			alert('비밀번호가 다릅니다.')
			
		}else if(document.deleteForm.text1.value != document.deleteForm.text2.value){
			alert('잘못 입력하셨습니다.')
			document.deleteForm.text2.fucus();
			return false;
		}else if(confirm('탈퇴 하시겠습니까?')){
			sunteak_proc('deleteProc','1',value2);
		}
	}
</script>
</body>
</html>