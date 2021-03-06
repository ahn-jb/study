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
	<span id="proc_check" style="display:none;">${proc_check}</span>
	<form>
	<div style="display:none;">
	<h2>시험: ${dto.testName}(${dto.testType})</h2>
	<input type="hidden" id="answer_total" value="${answer_total}">
	<input type="hidden" id="testName" value="${dto.testName}">
	<input type="hidden" id="testType" value="${dto.testType}">
	<input type="hidden" id="testNo" value="${dto.no}">
	span_list_size : <span id="span_list_size" style="display:;">${totalRecord}</span><br>
	span_answer_total : <span id = "span_answer_total" style="display:;"></span><br>
	</div>
	<c:forEach var="dto" items="${list}">
	<div style="display:none;">
	<a named="a_${dto.testNumber}"></a>
	q_${dto.testNumber}: <span id="q_${dto.testNumber}"  style="display:none;">${dto.testNumber}</span><br>
	span_answer_${dto.testNumber}: <span id="span_answer_${dto.testNumber}" style="display:none;"></span><br>
	</div>
	<table border="1">
		<tr>
			<td width="400">
				[Q-${dto.testNumber}] ${dto.question}
			</td>
		</tr>
		<tr>
			<td>
				<a href="#a_${dto.testNumber}" onclick="check_answer('1','${dto.testNumber}');"><font style="font-family:'MS Gothic';"><span id="mun1_${dto.testNumber}">①</span></font></a>
				<a href="#a_${dto.testNumber}" onclick="check_answer('1','${dto.testNumber}');">${dto.ans1}</a>
			</td>
		</tr>
		<tr>
			<td>
				<a href="#a_${dto.testNumber}" onclick="check_answer('2','${dto.testNumber}');"><font style="font-family:'MS Gothic';"><span id="mun2_${dto.testNumber}">②</span></font></a>
				<a href="#a_${dto.testNumber}" onclick="check_answer('2','${dto.testNumber}');">${dto.ans2}</a>
			</td>
		</tr>
		<tr>
			<td>
				<a href="#a_${dto.testNumber}" onclick="check_answer('3','${dto.testNumber}');"><font style="font-family:'MS Gothic';"><span id="mun3_${dto.testNumber}">③</span></font></a>
				<a href="#a_${dto.testNumber}" onclick="check_answer('3','${dto.testNumber}');">${dto.ans3}</a>
			</td>
		</tr>
		<tr>
			<td>
				<a href="#a_${dto.testNumber}" onclick="check_answer('4','${dto.testNumber}');"><font style="font-family:'MS Gothic';"><span id="mun4_${dto.testNumber}">④</span></font></a>
				<a href="#a_${dto.testNumber}" onclick="check_answer('4','${dto.testNumber}');">${dto.ans4}</a>
			</td>
		</tr>
	</table>
	<span style="display:none;">${number = number-1} </span>
	</c:forEach>
	</form><br>
	<input type="button" id ="jeongdab" onclick="goSaveProc('save');" value="저장하기" style="display:none;">
	<input type="button" id ="jd_sujeong" onclick="goSaveProc('sujeong');" value="수정하기" style="display:none;">
	<button type="button" onclick="suntaek_proc('sihum_view','','${dto.no}')">취소</button>

<script type="text/javascript">
	function goSaveProc(value1){
		var answer_total = $("#span_answer_total").text();
		var testNo = $('#testNo').val();
		if(answer_total == ''){
			alert('정답을 입력해주세요.');
		}else if(value1 == 'save'){
			if(confirm('저장하시겠습니까?')){				
				suntaek_proc('jeongdabProc','',testNo);
			}
		}else if(value1 == 'sujeong'){
			if(confirm('수정하시겠습니까?')){				
				suntaek_proc('jd_sujeongProc','',testNo);
			}
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
					msg = q_no+ ":" +answer +"|" + msg;
				}
			}
		}
		$("#span_answer_total").text(msg);
	}

	$(document).ready(function(){
		var size =$('#span_list_size').text() *320;
		if(size == 0){
			result.style.height = "400px";
		}else{
			result.style.height = size+"px";
		}
		
		var proc_check = $('#proc_check').text();
		$("#"+proc_check+"").css("display","");
		
		var answer_totalArr = $('#answer_total').val();
		if(answer_totalArr.trim() !=''){
			alert('체크하지 않은 문제가 있습니다.')
			var answer_total = answer_totalArr.split("|");
			for(var i in answer_total ){			
				var answer = answer_total[i].split(":");
// 				console.log("--------reset--------");
// 				console.log(answer[1]);
// 				console.log(answer[0]);
// 				console.log("---------------------");
				check_answer(answer[1],answer[0]);
			}
		}
		
	});
</script>
</body>
</html>