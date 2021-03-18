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
	${dto.passwd}
	<h2>수정</h2>
	<form name="sujeongForm">
		<input type="hidden" name="no" value="${dto.no}">
		<table border="1">
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" style="width:97%;" value="${dto.name}"></td>
			</tr>
			<tr>	
				<td>email</td>
				<td><input type="text" name="email" style="width:97%;" value="${dto.email }"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="passwd" style="width:97%;" value=""></td>
			</tr>
			<tr>
				<td colspan="2">
					<textarea name="content"  style="width :500px; height:100px;" >${dto.content}</textarea>
				</td>
			</tr>
			<tr >
				<td colspan="2" align="center">
					<button type="button" onclick="sujeong();">확인</button>
					<button type="button" onclick="location.href='${path}/guestbook_servlet/list.do';">취소</button>
				</td>
			</tr>
		</table>
	</form>
<script>
	function sujeong(){
		var pw = "${dto.passwd}";
		if(sujeongForm.passwd.value.trim() != pw){
			alert('비밀번호가 다릅니다');
			sujeongForm.passwd.focus();
		}else if(confirm('수정 하시겠습니까?')){
			sujeongForm.method = "post";
			sujeongForm.action = "${path}/guestbook_servlet/sujeongProc.do";
			sujeongForm.submit();
		}
	}
	
</script>
</body>
</html>