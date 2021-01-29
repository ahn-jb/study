<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원등록</title>
</head>
<body>
	<form name="joinForm">
		<table>
			<tr>
				<td>아이디</td>
				<td> 
					<input type="text" name="id">
				</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td> 
					<input type="password" name="password">
				</td>
			</tr>
			<tr>
				<td>비밀번호 확인</td>
				<td> 
					<input type="password" name="passwordcheck">
				</td>
			</tr>
			<tr>
				<td>이름</td>
				<td> 
					<input type="text" name="name">
				</td>
			</tr>
			<tr>
				<td>주민번호</td>
				<td> 
					<input type="text" name="sid"> -없이 입력
				</td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td> 
					<input type="text" name="phone"> ex) 010-1111-1111 
				</td>
			</tr>
			<tr>
				<td>이메일</td>
				<td> 
					<input type="text" name="email">
				</td>
			</tr>
		</table>
		<br>
		<button type="button" onclick="save();">가입하기</button>
	</form>
</body>
</html>

<script>
 function save(){
	 if(document.joinForm.id.value.trim()==""){
			alert("아이디를 입력하세요.")
			document.joinForm.id.select();
			document.joinForm.id.focus();
			return false;
	 }else  if(document.joinForm.password.value.trim()==""){
			alert("비밀번호를 입력하세요.")
			document.joinForm.password.select();
			document.joinForm.password.focus();
			return false;
	 }else  if(document.joinForm.password.value.trim()!=document.joinForm.passwordcheck.value.trim()){
			alert("비밀번호가 다릅니다.")
			document.joinForm.passwordcheck.select();
			document.joinForm.passwordcheck.focus();
			return false;
	 }else  if(document.joinForm.name.value.trim()==""){
			alert("이름을 입력하세요.")
			document.joinForm.name.select();
			document.joinForm.name.focus();
			return false;
 	 }else  if(document.joinForm.sid.value.trim()==""){
			alert("주민번호를 입력하세요.")
			document.joinForm.sid.select();
			document.joinForm.sid.focus();
			return false;
 	 }else  if(document.joinForm.phone.value.trim()==""){
			alert("전화번호를 입력하세요.")
			document.joinForm.phone.select();
			document.joinForm.phone.focus();
			return false;
 	 }else  if(document.joinForm.email.value.trim()==""){
			alert("이메일를 입력하세요.")
			document.joinForm.email.select();
			document.joinForm.email.focus();
			return false;
 	 }else if(confirm('가입 하시겠습니까?')){
	 		 document.joinForm.method='post';
	 		 document.joinForm.action='memberProc.jsp';
	 		 document.joinForm.submit();
 	 }
	 
	 
	 
 }
</script>