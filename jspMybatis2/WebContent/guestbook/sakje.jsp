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
	<h2>삭제</h2>
	<form name="sakjeForm">
		<div>
			[본인 확인]
			passwd : <input type="password" id="passwd" name="passwd" value=""> &nbsp;&nbsp;
			<button type="button" onclick="sakje();">확인</button>
			<button type="button" onclick="location.href='${path}/guestbook_servlet/list.do';">취소</button>
		</div>
	</form>
<script>
	function sakje(){
		if(confirm('정말 삭제하시겠습니까?')){
			sakjeForm.method = "post";
			sakjeForm.action = "${path}/guestbook_servlet/sakjeProc.do?no=${dto.no}";
			sakjeForm.submit();
		}
	}
</script>	
</body>
</html>