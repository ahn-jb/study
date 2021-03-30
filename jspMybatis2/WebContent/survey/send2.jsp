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
	<h2>설문 응답</h2>
	<span id="span_answer" style="display:none;"></span>
	<input type="hidden" id ="answer" value="">
	<form name="aa">
	<table border="1">
		<tr>
			<td>Q) ${dto.question}</td>
		</tr>
		<tr>
			<td>
				<a href="#" onclick="check_answer('1');"><font style="font-family:'MS Gothic';"><span id="mun1">①</span></font></a>
				<a href="#" onclick="check_answer('1');">${dto.ans1}</a>
			</td>
		</tr>
		<tr>
			<td>
				<a href="#" onclick="check_answer('2');"><font style="font-family:'MS Gothic';"><span id="mun2">②</span></font></a>
				<a href="#" onclick="check_answer('2');">${dto.ans2}</a>
			</td>
		</tr>
		<tr>
			<td>
				<a href="#" onclick="check_answer('3');"><font style="font-family:'MS Gothic';"><span id="mun3">③</span></font></a>
				<a href="#" onclick="check_answer('3');">${dto.ans3}</a>
			</td>
		</tr>
		<tr>
			<td>
				<a href="#" onclick="check_answer('4');"><font style="font-family:'MS Gothic';"><span id="mun4">④</span></font></a>
				<a href="#" onclick="check_answer('4');">${dto.ans4}</a>
			</td>
		</tr>
		<tr> 
			<td>기간 : ${dto.start_date} ~ ${dto.last_date}</td>
		</tr>
	</table>
	</form>
	<input type="button" onclick="send(${dto.getNo()});" value="제출하기">
	<input type="button" id="btnList" value="목록으로">

<script type="text/javascript">
	function send(value1){
		var mun = $('#answer').val();
		if(mun == ""){
			alert('답을 선택 해주세요.')
	
		}else if(confirm('제출하시겠습니까?')){
			sunteak_proc('sendProc','',value1);
		}
	}
	function check_answer(value1){
		$("#span_answer").text(value1);
		if(value1 =="1"){
			$('#answer').val(1);
			$("#mun1").text('❶');
			$("#mun2").text('②');
			$("#mun3").text('③');
			$("#mun4").text('④');
		}else if(value1 =="2"){
			$('#answer').val(2);
			$("#mun1").text('①');
			$("#mun2").text('❷');
			$("#mun3").text('③');
			$("#mun4").text('④');
		}else if(value1 =="3"){
			$('#answer').val(3);
			$("#mun1").text('①');
			$("#mun2").text('②');
			$("#mun3").text('❸');
			$("#mun4").text('④');
		}else if(value1 =="4"){
			$('#answer').val(4);
			$("#mun1").text('①');
			$("#mun2").text('②');
			$("#mun3").text('③');
			$("#mun4").text('❹');
		}
	}
	$(document).ready(function(){
		$("#btnList").click(function(){
			sunteak_proc('resetList','1','');
		});
	});
</script>
</body>
</html>