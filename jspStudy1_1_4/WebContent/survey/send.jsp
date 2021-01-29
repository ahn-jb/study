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

	<h2>설문조사</h2>
	<form name="a" >
		<input type="hidden" name="no" value="${dto.getNo()}">	
		<table border="1" style="width:500;">
			<tr>
				<td>Q</td>
				<td>${dto.getQuestion()}</td>
			</tr>
			<tr>
				<td><input type="radio" name="answer" id="answer" value="1"></td>
				<td>
					${dto.getAns1()}
				</td>
			</tr>
			<tr>
				<td><input type="radio" name="answer" id="answer" value="2"></td>
				<td>
					${dto.getAns2()}
				</td>
			</tr>
			<tr>
				<td><input type="radio" name="answer" id="answer" value="3"></td>
				<td>
					${dto.getAns3()}
				</td>
			</tr>
			<tr>
				<td><input type="radio" name="answer" id="answer" value="4"></td>
				<td>
					${dto.getAns4()}
				</td>
			</tr>
			<tr> 
				<td>기간</td>
				<td>${dto.start_date} ~ ${dto.last_date}</td>
			</tr>
		</table>
		<br>
		<input type="button" onclick="send();" value="제출하기">
		<input type="button" id="btnList" value="목록으로">
	</form>
<script>
	function send(){
		if( document.a.answer.value.trim() == ""){
			alert('답을 선택 해주세요.')

		}else{
			$.ajax({
				 type:"post",
				 data:  $('form').serialize(),
				 url: "${path}/survey_servlet/sendProc.do",
				 success: function(result){
					 $("#result").html(result);
					 list();
				 }
			 });
		}
	}
	$(document).ready(function(){
		$("#btnList").click(function(){
			list();
		});
	});
</script>
</body>
</html>