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
				<h2>시험 추가</h2>
			</td>
		</tr>
		<tr>
			<td>
				<table border="1" width="80%">
					<tr>
						<td>시험명</td>
						<td>
							<input type="text" id="testName" name="testName" value="">
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
		 				<td colspan="10" align="center">
		 					<button type="button" id="" onclick="suntaek_proc('sihum_chugaProc','1','');">추가</button>
		 					<button type="button" id="" onclick="suntaek_proc('resetList','1','');">목록</button>
		 				</td>
		 			</tr>
				</table>
			</td>
		</tr>
	</table>
<script type="text/javascript">
	
</script>	
</body>
</html>