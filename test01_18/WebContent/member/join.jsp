<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	
	<table border="1" width="100%">
	<tr>
		<td colspan="1"><%@ include file="../inc/include_top1.jsp" %></td>
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
						<td>주소</td>
						<td>
							<input type="text" name="addr1" style="width:100px;" ><a href="#" style="font-size:0.7em">[우편번호검색] </a>
						</td>
					</tr>
					<tr>
						<td>기본주소</td>
						<td><input type="text" name="addr2"></td>
					</tr>
					<tr>
						<td>상세주소</td>
						<td><input type="text" name="addr3"></td>
					</tr>
					<tr>
						<td colspan="2">
							<button type="button" onclick="save();"  >가입하기</button>
						</td>
					</tr>
				</table><br><br>
			</form>
		</td>
	</tr>
	<tr>
		<td colspan="1" align="center"><%@ include file="../inc/include_bottom.jsp" %></td>
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
		}else if(document.joinForm.addr1.value.trim() ==""){
			alert('주소를 입력하세요.')
			document.joinForm.addr1.focus();
			return false;
		}else if(document.joinForm.addr2.value.trim() ==""){
			alert('기본주소를 입력하세요.')
			document.joinForm.addr2.focus();
			return false;
		}else if(document.joinForm.addr3.value.trim() ==""){
			alert('상서주소를 입력하세요.')
			document.joinForm.addr3.focus();
			return false;
		}else if(confirm('이 정보로 가입하시겠습니까?')){
			document.joinForm.method='post';
			document.joinForm.action='joinProc.jsp';
			document.joinForm.submit();
		}
	}
</script>