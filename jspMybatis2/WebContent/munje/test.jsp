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
	<h2>시험: ${dto.testName}(${dto.testType})</h2>
	<c:if test="${alert == '채점 완료.' }">
		<h4 align="center">
			[${munje_total}] 문항 중  [${jeongdab_count}] 문항을 맞추셨습니다. <br>
			<c:if test="${fail_munje_coment.trim() != ''}">
				틀린 문항으로는 "${failMunje_coment}" 이 있습니다.
			</c:if>
			<c:if test="${fail_munje_coment.trim() == ''}">
				틀린 문항이 없습니다. 
			</c:if><br>
			<button type="button" onclick="suntaek_proc('test','1','${testNo}')">다시치기</button>
			<button type="button" onclick="suntaek_proc('test_suntaek','1','')">다른시험 치기</button>
		</h4>
	</c:if>
		
	<input type="hidden" id="fail_munje" value="${fail_munje}"><br>
	<input type="hidden" id="alert" value="${alert}"><br>
	<input type="hidden" id="answer_total" value="${answer_total}"><br>
	<input type="hidden" id="testNo" value="${dto.no}"><br>
	span_list_size : <span id="span_list_size" style="display:;">${totalRecord}</span><br>
	span_answer_total : <span id = "span_answer_total" style="display:;"></span><br>
	<c:forEach var="dto" items="${list}">
	<a named="a_${dto.testNumber}"></a>
	q_${dto.testNumber}: <span id="q_${dto.testNumber}">${dto.testNumber}</span><br>
	span_answer_${dto.testNumber}: <span id="span_answer_${dto.testNumber}" style="display:;"></span><br>
	<table border="1">
		<tr>
			<td width="400">
				[Q-${dto.testNumber}] &nbsp; ${dto.question}  <span id="f_${dto.testNumber}" style="float:right; color: red; display:none;">오답</span>
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
	<input type="button" onclick="goSaveProc();" value="제출하기">
	<input type="button" onclick="suntaek_proc('resetList','1','')" value ="목록">
	<br><br>
<script type="text/javascript">
	function goSaveProc(){
		var answer_total = $("#span_answer_total").text();
		var testNo = $('#testNo').val();
		
		if(answer_total == ''){
			alert('정답을 입력해주세요.');
		}else if(confirm('제출 하시겠습니까?')){
			suntaek_proc('test_result','',testNo);
		}
	}
	function check_answer(value1,value2){
// 		console.log("-----check_answer------");
// 		console.log(value1);
// 		console.log(value2);
// 		console.log("-----------------------");
		$("#span_answer_"+value2).text(value1);
		$("#span_no").text(value2);
		if(value1 =="1"){
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
		
		var answer_totalArr = $('#answer_total').val();
		var al = $('#alert').val();
		if(answer_totalArr.trim() !=''){
			alert(al);
			
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
		var fail_munjeArr = $('#fail_munje').val();
		var fail_munje = fail_munjeArr.split(",");
		for(var j in fail_munje){
			var num = fail_munje[j];
			$('#f_'+num).css("display","");
		}
	});
</script>
</body>
</html>