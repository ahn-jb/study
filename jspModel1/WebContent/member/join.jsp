<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="../include/include_check.jsp" %>
 <%@page import="java.net.Inet4Address"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	
	<h2>회원가입</h2>
	<form name="joinForm">
	<input type="hidden" name="grade" value="4">
	<input type="hidden" name="ip" value="<%=Inet4Address.getLocalHost().getHostAddress()%>">
		<table>
			<tr>
				<td>아이디:</td>
				<td><input type="text" name="id"></td>
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
				<td>닉네임:</td>
				<td><input type="text" name="nickname"></td>
			</tr>
			<tr>
				<td>이름:</td>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<td>이메일:</td>
				<td><input type="text" name="email"></td>
			</tr>
			<tr>
				<td>전화번호:</td>
				<td><input type="text" name="phone"></td>
			</tr>
			<tr>
				<td>주소:</td>
				<td><input type="text" name="address"></td>
			</tr>
			<tr>
				<td>성별:</td>
				<td>
					<select name="gender">
						<option value="M">남자
						<option value="F">여자
					</select>
				</td>
			</tr>
			<tr>
				<td>직업:</td>
				<td><input type="text" name="job"></td>
			</tr>
		</table>
		<br>
		<button type="button" onclick="save();">가입하기</button>
	</form>
	
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
			document.joinForm.pw.fucus();
			return false;
		}else if(document.joinForm.pw.value != document.joinForm.pwcheck.value){
			alert('비밀번호가 다릅니다.')
			document.joinForm.pwcheck.fucus();
			return false;
		}else if(document.joinForm.nickname.value.trim() ==""){
			alert('닉네임를 입력하세요.')
			document.joinForm.nickname.fucus();
			return false;
		}else if(document.joinForm.name.value.trim() ==""){
			alert('이름을 입력하세요.')
			document.joinForm.name.fucus();
			return false;
		}else if(document.joinForm.email.value.trim() ==""){
			alert('이메일를 입력하세요.')
			document.joinForm.email.fucus();
			return false;
		}else if(document.joinForm.phone.value.trim() ==""){
			alert('전화번호를 입력하세요.')
			document.joinForm.phone.fucus();
			return false;
		}else if(document.joinForm.address.value.trim() ==""){
			alert('주소를 입력하세요.')
			document.joinForm.address.fucus();
			return false;
		}else if(document.joinForm.job.value.trim() ==""){
			alert('직업을 입력하세요.')
			document.joinForm.job.fucus();
			return false;
		}else if(confirm('이 정보로 가입하시겠습니까?')){
			document.joinForm.method='post';
			document.joinForm.action='joinProc.jsp';
			document.joinForm.submit();
		}
	}
</script>