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
	<form name="testChugaForm">
		<table border="0" width="90%">
			<tr>
				<td colspan="3">
					<h2>시험등록</h2>
				</td>
			</tr>
			<tr>
				<td>
					<table border="1" width="80%"> 
						<tr>
							<td>시험명</td>
							<td><input type="text" id="test_name" name="test_name"></td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td>
					<button type="button" onclick="btn3('testChugaProc')">등록하기</button>
					<button type="button" onclick="btn3('testList')">목록</button>
				</td>
			</tr>
		</table>
	</form>
<script>
	function btn3(value1){
		if(value1 == "testChugaProc"){
			testChugaForm.method="post";
			testChugaForm.action="${path}/student_servlet/testChugaProc.do";
			testChugaForm.submit();
		}else if(value1 =="testList"){
			location.href="${path}/student_servlet/test.do";
		}
	}
</script>
</body>
</html>