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
	<form name="send">
		<input type="hidden" id="span_answer" name="answer">
		<input type="hidden" name="no" value="${dto.no}">
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
	<input type="button" onclick="goViewProc('${dto.no}');" value="제출하기">
	<input type="button" id="btnList" value="목록으로" onclick="gogo();">

<script type="text/javascript">
	function goViewProc(value1){
		var answer = $('#span_answer').val();
		if(answer == ''){
			alert('정답을 클릭해 주세요');
		}else if(confirm('제출 하시겠습니까?')){
			send.method="post";
			send.action="${path}/test_servlet/sendProc.do";
			send.submit();
		}
	}
	function check_answer(value1){
		$("#span_answer").val(value1);
		if(value1 =="1"){
			$("#mun1").text('❶');
			$("#mun2").text('②');
			$("#mun3").text('③');
			$("#mun4").text('④');
		}else if(value1 =="2"){
			$("#mun1").text('①');
			$("#mun2").text('❷');
			$("#mun3").text('③');
			$("#mun4").text('④');
		}else if(value1 =="3"){
			$("#mun1").text('①');
			$("#mun2").text('②');
			$("#mun3").text('❸');
			$("#mun4").text('④');
		}else if(value1 =="4"){
			$("#mun1").text('①');
			$("#mun2").text('②');
			$("#mun3").text('③');
			$("#mun4").text('❹');
		}
	}
	function gogo(){
		location.href="${path}/test_servlet/list.do";
	}
</script>
</body>
</html>