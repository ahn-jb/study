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
	<table border="0" width="60%">
		<tr>
			<td colspan="20">
				<h2>시험 수정</h2>
			</td>
		</tr>
		<tr>
			<td>
				<table border="1" width="80%">
					<tr>
						<td>시험명</td>
						<td>
							<input type="text" id="testName" name="testName" value="${dto.testName}">
						</td>						
					</tr>
					<tr>
						<td>Type:</td>
						<td>
							<input type="radio"  name="testType" value="A" onclick="Type('A');">A
							<input type="radio"  name="testType" value="B" onclick="Type('B');">B
							<input type="radio"  name="testType" value="C" onclick="Type('C');">C
							<input type="radio"  name="testType" value="D" onclick="Type('D');">D
							<input type="hidden" id="testType" value="${dto.testType}">
						</td>
					</tr>
					<tr>
						<td>start_date</td>
		 				<td>
		 					<select name="syear" id ="syear">
		 					<c:forEach var="i" begin="0" end="121" step="1">
		 						<option value="${naljaMap['now_y']-i}">${naljaMap['now_y']-i}
		 					</c:forEach>
		 					</select>년
		 					<select name="smonth" id="smonth">
		 					<c:forEach var="i" begin="1" end="12" step="1">
		 					<c:if test="${i<10}">
		 						<option value="0${i}">0${i}
		 					</c:if>
		 					<c:if test="${i>=10}">
		 						<option value="${i}">${i}
							</c:if>
		 					</c:forEach>
		 					</select>월
		 					<select name="sday" id="sday">
		 					<c:forEach var="i" begin="1" end="31" step="1">
							<c:if test="${i<10}">
		 						<option value="0${i}">0${i}
		 					</c:if>
		 					<c:if test="${i>=10}">
		 						<option value="${i}">${i}
							</c:if>
		 					</c:forEach>
		 					</select>일
		 				</td>
		 			</tr>
		 			<tr>
		 				<td>last_date</td>
		 				<td>
		 					<select name="lyear" id="lyear">
		 					<c:forEach var="i" begin="0" end="121" step="1">
		 						<option value="${naljaMap['now_y']-i}">${naljaMap['now_y']-i}
		 					</c:forEach>
		 					</select>년
		 					<select name="lmonth" id="lmonth">
		 					<c:forEach var="i" begin="1" end="12" step="1">
		 					<c:if test="${i<10}">
		 						<option value="0${i}">0${i}
		 					</c:if>
		 					<c:if test="${i>=10}">
		 						<option value="${i}">${i}
							</c:if>
		 					</c:forEach>
		 					</select>월
		 					<select name="lday" id="lday">
		 					<c:forEach var="i" begin="1" end="31" step="1">
		 					<c:if test="${i<10}">
		 						<option value="0${i}">0${i}
		 					</c:if>
							<c:if test="${i>=10}">
		 						<option value="${i}">${i}
							</c:if>
		 					</c:forEach>
		 					</select>일
		 				</td>
		 			</tr>
		 			<tr>
						<td>Status:</td>
						<td>
							<input type="radio"  name="status" value="1" onclick="status('1');">ON
							<input type="radio"  name="status" value="0" onclick="status('0');">OFF
							<input type="hidden" id ="status"  value="${dto.status}">
						</td>
					</tr>
		 			<tr>
		 				<td colspan="10" align="center">
		 					<button type="button" id="" onclick="suntaek_proc('sihum_sujeongProc','1','${dto.no}');">시험수정</button>
		 					<button type="button" onclick="suntaek_proc('sihum_view','','${dto.no}')">뒤로가기</button>	
		 				</td>
		 			</tr>
				</table>
			</td>
		</tr>
	</table>
<script>
function Type(value1){
	$('#testType').val(value1);
}
function status(value1){
	$('#status').val(value1);
}

$(document).ready(function(){
	var testType = $('#testType').val();
	$("input[name=testType][value=" + testType + "]").attr("checked", true);
	
	var status = $('#status').val();
	$("input[name=status][value=" + status + "]").attr("checked", true);
});

</script>
</body>
</html>