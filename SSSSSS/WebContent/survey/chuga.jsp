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
 		<table border="1" align="center" width="80%">
 			<tr>
 				<td colspan="2"><h2>설문조사 등록</h2></td>
 			</tr>
 			<tr>
 				<td style="align:center;">question</td>
 				<td><input type="text" name="question" id="question"></td>
 			</tr>
 			<tr>
 				<td style="align:center;">ans1</td>
 				<td><input type="text" name="ans1" id="ans1"></td>
 			</tr>
 			<tr>
 				<td style="align:center;">ans2</td>
 				<td><input type="text" name="ans2" id="ans2"></td>
 			</tr>
 			<tr>
 				<td style="align:center;">ans3</td>
 				<td><input type="text" name="ans3" id="ans3"></td>
 			</tr>
 			<tr>
 				<td style="align:center;">ans4</td>
 				<td><input type="text" name="ans4" id="ans4"></td>
 			</tr>
 			<tr>
 				<td>status</td>
 				<td>
 					<input type="radio" name="status" value="1">진행중
 					<input type="radio" name="status" value="0">종료
 				</td>
 			</tr>
 			<tr>
 				<td>start_date</td>
 				<td>
 					<select name="syear">
 					<c:forEach var="i" begin="0" end="121" step="1">
 						<option value="${naljaMap['now_y']-i}">${naljaMap['now_y']-i}
 					</c:forEach>
 					</select>년
 					<select name="smonth">
 					<c:forEach var="i" begin="1" end="12" step="1">
 					<c:if test="${i<10}">
 						<option value="0${i}">0${i}
 					</c:if>
 					<c:if test="${i>=10}">
 						<option value="${i}">${i}
					</c:if>
 					</c:forEach>
 					</select>월
 					<select name="sday">
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
 					<select name="lyear">
 					<c:forEach var="i" begin="0" end="121" step="1">
 						<option value="${naljaMap['now_y']-i}">${naljaMap['now_y']-i}
 					</c:forEach>
 					</select>년
 					<select name="lmonth">
 					<c:forEach var="i" begin="1" end="12" step="1">
 					<c:if test="${i<10}">
 						<option value="0${i}">0${i}
 					</c:if>
 					<c:if test="${i>=10}">
 						<option value="${i}">${i}
					</c:if>
 					</c:forEach>
 					</select>월
 					<select name="lday">
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
 				<td  colspan="2" style="align:center;">
 					<input type="button" id="btnSave" value="저장하기">
 					<input type="button" id="btnList" value="목록으로">
 				</td>
 			</tr>
 		</table>
 	</form>
<script type="text/javascript">
	$(document).ready(function(){
		$("#btnSave").click(function(){
			chugaProc();
		});
		$("#btnList").click(function(){
			list();
		});
	});
	
</script>
</body>
</html>