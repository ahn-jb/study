<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	
	<form name="loginForm">
		<table border="1">
			<tr>
				<td> 
					아이디:
				</td>
				<td>
					<input type="text" name="id"  onkeypress="nonHangulSpecialKey()">
				</td>
			</tr>
			<tr>
				<td> 
					비밀번호:
				</td>
				<td>
					<input type="text" name="passwd">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="button" onclick="login();" value="로그인">
				</td>
			</tr>
		</table>
	</form>
<script>
	function check_key() {
	 var char_ASCII = event.keyCode;
	  //숫자
	 if (char_ASCII >= 48 && char_ASCII <= 57 )
	   return 1;
	 //영어
	 else if ((char_ASCII>=65 && char_ASCII<=90) || (char_ASCII>=97 && char_ASCII<=122))
	    return 2;
	 //특수기호
	 else if ((char_ASCII>=33 && char_ASCII<=47) || (char_ASCII>=58 && char_ASCII<=64) 
	   || (char_ASCII>=91 && char_ASCII<=96) || (char_ASCII>=123 && char_ASCII<=126))
	    return 4;
	 //한글
	 else if ((char_ASCII >= 12592) || (char_ASCII <= 12687))
	    return 3;
	 else 
	    return 0;
	}
	function nonHangulSpecialKey() {
		 if(check_key() != 1 && check_key() != 2) {
		  event.returnValue = false;   
		  alert("숫자나 영문자만 입력하세요!");
		  return;
		 }
		}
	function login(){
		if(document.loginForm.id.value.trim() == ""){
			alert('아이디를 입력해주세요')
			document.loginForm.id.focus();
			return false;
		}else if(document.loginForm.passwd.value.trim() == ""){
			alert('비밀번호를 입력해주세요')
			document.loginForm.passwd.focus();
			return false;
		}else{
			loginForm.method="post";
			loginForm.action="loginProc.jsp";
			loginForm.submit();
		}
	}
</script>	
</body>
</html>