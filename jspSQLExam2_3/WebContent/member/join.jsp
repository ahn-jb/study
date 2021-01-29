<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/include_import.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	
	<table border="1" width="100%">
	<tr>
		<td colspan="1"><%@ include file="../include/include_top1.jsp" %></td>
	</tr>
	<tr>
		<td>
			<form name="joinForm" align="center">
			<h2>회원가입</h2>
				<table border="1" align="center" width="600">
					<tr>
						<td>아이디</td>
						<td><input type="text" name="id"></td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td><input type="password" name="pw"></td>
					</tr>
					<tr>
						<td>비밀번호 확인</td>
						<td><input type="password" name="pwcheck"></td>
					</tr>
					<tr>
						<td>이름</td>
						<td><input type="text" name="name"></td>
					</tr>
					<tr>
						<td>성별</td>
						<td>
							<input type="radio" name="gender" value="M">남자
							<input type="radio" name="gender" value="F">여자
						</td>
					</tr>
					<tr>
						<td>생년</td>
						<td><input type="text" name="bornYear"></td>
					</tr>
					<tr>
						<td colspan="2">
							<button type="button" onclick="save();"  >가입하기</button>
						</td>
					</tr>
				</table>
				
			</form>
		</td>
	</tr>
	<tr>
		<td colspan="1"><%@ include file="../include/include_bottom.jsp" %></td>
	</tr>
	</table>
</body>
</html>
<script>
	function save(){
		if(document.joinForm.id.value.trim() ==""){
			alert('아이디를 입력해 주세요.');
			document.joinForm.id.focus();
			return false;
		}else if(document.joinForm.pw.value.trim() ==""){
			alert('비밀번호를 입력하세요.')
			document.joinForm.pw.focus();
			return false;
		}else if(document.joinForm.pw.value != document.joinForm.pwcheck.value){
			alert('비밀번호가 다릅니다.')
			document.joinForm.pwcheck.focus();
			return false;
		}else if(document.joinForm.name.value.trim() ==""){
			alert('이름을 입력하세요.')
			document.joinForm.name.focus();
			return false;
		}else if(document.joinForm.gender.value.trim() ==""){
			alert('성별을 선택하세요.')
			document.joinForm.gender.focus();
			return false;
		}else if(document.joinForm.bornYear.value.trim() ==""){
			alert('생년을 입력하세요.')
			document.joinForm.bornYear.focus();
			return false;
		}else if(confirm('이 정보로 가입하시겠습니까?')){
			document.joinForm.method='post';
			document.joinForm.action='joinProc.jsp';
			document.joinForm.submit();
		}
	}
</script>