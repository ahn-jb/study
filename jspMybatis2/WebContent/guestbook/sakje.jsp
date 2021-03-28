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
	<div>
		[본인 확인]
		passwd : <input type="text" id="passwd" name="passwd" value=""> &nbsp;&nbsp;
		<button type="button" onclick="sakje();">확인</button>
		<button type="button" onclick="location.href='${path}/guestbook_servlet/list.do';">취소</button>
	</div>

<script>
	function sakje(){
		var pw = "${dto.passwd}";
		var pwchk = $('#passwd').val();
		if(pwchk != pw){
			alert('비밀번호가 다릅니다');
		}else if(confirm('정말 삭제하시겠습니까?')){
			location.href="${path}/guestbook_servlet/sakjeProc.do?no=${dto.no}";
		}
	}
</script>	
</body>
</html>