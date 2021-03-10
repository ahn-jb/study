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
	<form>
	span_list_size : <span id="span_list_size" style="display:;">${list.size()}</span><br>
	span_answer_total : <span id = "span_answer_total" style="display:;"></span><br>
	<c:forEach var="dto" items="${list}">
	<a named="a_${dto.no}"></a>
	q_${number}: <span id="q_${number}">${dto.no}</span><br>
	span_answer_${number}: <span id="span_answer_${number}" style="display:;"></span><br>
	<table border="1">
		<tr>
			<td>
				Q) ${dto.question}
			</td>
		</tr>
		<tr>
			<td>
				<a href="#a_${dto.no}" onclick="check_answer('1','${number}');"><font style="font-family:'MS Gothic';"><span id="mun1_${number}">①</span></font></a>
				<a href="#a_${dto.no}" onclick="check_answer('1','${number}');">${dto.ans1}</a>
			</td>
		</tr>
		<tr>
			<td>
				<a href="#a_${dto.no}" onclick="check_answer('2','${number}');"><font style="font-family:'MS Gothic';"><span id="mun2_${number}">②</span></font></a>
				<a href="#a_${dto.no}" onclick="check_answer('2','${number}');">${dto.ans2}</a>
			</td>
		</tr>
		<tr>
			<td>
				<a href="#a_${dto.no}" onclick="check_answer('3','${number}');"><font style="font-family:'MS Gothic';"><span id="mun3_${number}">③</span></font></a>
				<a href="#a_${dto.no}" onclick="check_answer('3','${number}');">${dto.ans3}</a>
			</td>
		</tr>
		<tr>
			<td>
				<a href="#a_${dto.no}" onclick="check_answer('4','${number}');"><font style="font-family:'MS Gothic';"><span id="mun4_${number}">④</span></font></a>
				<a href="#a_${dto.no}" onclick="check_answer('4','${number}');">${dto.ans4}</a>
			</td>
		</tr>
		<tr> 
			<td>기간 : ${dto.start_date} ~ ${dto.last_date}</td>
		</tr>
	</table>
	<span style="display:none;">${number = number-1} </span>
	</c:forEach>
	</form>
	<input type="button" onclick="goSaveProc();" value="제출하기">
	<input type="button" id="btnList" value="목록으로">

<script type="text/javascript">
	function goSaveProc(){
		if(confirm('저장하시겠습니까?')){
			var param = {
				"answer_total" : $("#span_answer_total").text()
			}
			$.ajax({
				type: "post",
				data: param,
				url: "${path}/survey_servlet/saveProc.do",
				success: function(){
					suntaek_page('1');
				}
			});
		}
	}
	function check_answer(value1,value2){
		$("#span_answer_"+value2).text(value1);
		$("#span_no").text(value2);
		if(value1 =="1" ){
			$("#mun1_"+value2).text('❶');
			$("#mun2_"+value2).text('②');
			$("#mun3_"+value2).text('③');
			$("#mun4_"+value2).text('④');
		}else if(value1 =="2"){
			$("#mun1_"+value2).text('①');
			$("#mun2_"+value2).text('❷');
			$("#mun3_"+value2).text('③');
			$("#mun4_"+value2).text('④');
		}else if(value1 =="3"){
			$("#mun1_"+value2).text('①');
			$("#mun2_"+value2).text('②');
			$("#mun3_"+value2).text('❸');
			$("#mun4_"+value2).text('④');
		}else if(value1 =="4"){
			$("#mun1_"+value2).text('①');
			$("#mun2_"+value2).text('②');
			$("#mun3_"+value2).text('③');
			$("#mun4_"+value2).text('❹');
		}
		var counter = parseInt($("#span_list_size").text());
		var msg="";
		for(i=counter; i>0; i--){
			var q_no = $("#q_"+i).text();
			var answer = $("#span_answer_"+i).text();
			
			if(answer.length > 0 ){
				if(msg ==''){
					msg = q_no + ":" +answer;
				}else{
					msg =msg+"|" +q_no+ ":" +answer;
				}
			}
		}
		$("#span_answer_total").text(msg);
	}
	$(document).ready(function(){
		$("#btnList").click(function(){
			list();
		});
	});
</script>
</body>
</html>