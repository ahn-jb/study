<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/inc_header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form name="updateForm">
		<h2>회원 상세정보</h2>
		<table>
			<tr>
				<td>등급:</td>
				<td>
					<c:if test ="${ dto.getGrade()==1}">
					<input type="text" name="grade" value="${dto.getGrade()}" >
					</c:if>
					<c:if test ="${ dto.getGrade()!=1}">
					<input type="text" name="grade" value="${dto.getGrade()}" readonly>
					</c:if>
				</td>
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
				<td>비밀번호 확인:</td>
				<td><input type="password" name="pwcheck"></td>
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
				<td><input type="text" name="bornYear" value="${dto.getBornYear()}" readonly></td>
			</tr>
		</table>
		<br>
		<button type="button" onclick="sujeong();">수정하기</button>
		<button type="button" onclick="location.href='${path}/member_servlet/list.do';">취소</button>
		<input type="hidden" name="no" value="${dto.getNo()}" readonly>
	</form>
<script>
	function sujeong(){
		 if(document.updateForm.pw.value.trim() ==""){
			alert('비밀번호를 입력하세요.')
			document.updateForm.pw.fucus();
			return false;
		}else if(document.updateForm.pw.value != document.updateForm.pwcheck.value){
			alert('비밀번호가 다릅니다.')
			document.updateForm.pwcheck.fucus();
			return false;
		}else if(confirm('이 정보로 수정 하시겠습니까?')){
			document.updateForm.method='post';
			document.updateForm.action='${path}/member_servlet/modifyProc.do';
			document.updateForm.submit();
		}
	}
</script>
</body>
</html>