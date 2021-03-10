<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table >
		<tr>
			<td colspan="2" width="80%">
				<h2>회원 추가</h2>
			</td>
		</tr>
		<tr>
			<td>
				<table border="1" >
					<tr>
						<td>
							회원이름
						</td>
						<td>
							<input type="text" id="memberName" name="memberName">
						</td>
					</tr>
					<tr>
						<td>
							회원 이메일
						</td>
						<td>
							<input type="text" id="memberEmail" name="memberEmail">
						</td>
					</tr>
					<tr>
						<td>
							생일
						</td>
						<td>
							<input type="date" name="memberbirthday" id="memberbirthday" >
						</td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<button type="button" id="btnSave2">등록하기</button>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
<script>
	$(document).ready(function(){
		$("#memberName").focus();
		
		$("#btnSave2").click(function(){
			if(confirm('등록하시겠습니까?')){
				GoPage('memberChugaProc');
			}
		});
	});
</script>
</body>
</html>