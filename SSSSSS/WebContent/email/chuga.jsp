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
	b:<span id="birth_chk" style="display:;"></span>
	<table border="1" align="center" width="80%">
		<tr>
			<td colspan="2">
				<h2>이메일 보내기</h2>
			</td>
		</tr>
		<tr>
			<td style="align:center;">
				발신자 이름
			</td>
			<td>
				<input type="text" name="fromName" id="fromName" value="ajb" readonly>
			</td>
		</tr>
		<tr>
			<td style="align:center;">
				발신자 이메일
			</td>
			<td>
				<input type="text" name="fromEmail" id="fromEmail" value="ahn05142@gmail.com" readonly>
			</td>
		</tr>
		<tr>
			<td style="align:center;">
				제목
			</td>
			<td>
				<input type="text" name="subject" id="subject" >
			</td>
		</tr>
		<tr>
			<td style="align:center;">
				내용
			</td>
			<td>
				<textarea name="content" id="content" style="width:300px; height:100px;" wrap="hard"></textarea>
			</td>
		</tr>
		<tr>
			<td align="center" colspan="2" height="50px;">
				<button type="button" id="btnSave">메일보내기</button>
				<button type="button" id="btnSave3">메일보내기(생일)</button>
				<button type="button" onclick="GoPage('memberChuga');">회원등록</button>
			</td>
		</tr>
	</table>
<script>
	$(document).ready(function(){
		$("#fromName").focus();
		
		$("#btnSave").click(function(){
			if(confirm('발송하시겠습니까?')){
				GoPage('chugaProc');
			}
		});
		$("#btnSave3").click(function(){
			if(confirm('발송하시겠습니까?')){
				$('#birth_chk').text("1");
				GoPage('chugaProc');
			}
		});
	});
</script>
</body>
</html>