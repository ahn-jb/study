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
				<h2>문제추가</h2>
			</td>
		</tr>
		<tr>
			<td>
				<table border="1" width="80%">
					<tr>
						<td>TestName:</td>
						<td>
							<input type="hidden" id="testNo" value="${dto.no}"> 
							${dto.testName}(${dto.testType})
						</td>
					</tr>
					<tr>
						<td>TestNumber</td>
						<td>
<!-- 							<select id="testNumber"> -->
<%-- 								<c:forEach var="list" items="${list}"> --%>
<%-- 									<option value="${list.testNumber}">${list.testNumber}									 --%>
<%-- 								</c:forEach> --%>
<!-- 							</select> -->
							<input type="text" id="testNumber" name="testNumber" style="width:20%;">
						</td>
					</tr>
					<tr>
						<td>Question:</td>
						<td>
							<textarea id="question" name="question" style="width:80%; height:100px;"></textarea>
						</td>
					</tr>
					<tr>
						<td>Ans1:</td>
						<td>
							<input type="text" id="ans1" name="ans1" style="width:80%;">
						</td>
					</tr>
					<tr>
						<td>Ans2:</td>
						<td>
							<input type="text" id="ans2" name="ans2"  style="width:80%;">
						</td>
					</tr>
					<tr>
						<td>Ans3:</td>
						<td>
							<input type="text" id="ans3" name="ans3" style="width:80%;" >
						</td>
					</tr>
					<tr>
						<td>Ans4:</td>
						<td>
							<input type="text" id="ans4" name="ans4"  style="width:80%;">
						</td>
					</tr>
					<tr>
						<td colspan="10" ailgn="center"> 
							<button type="button" onclick="suntaek_proc('munje_chugaProc','','')">추가</button>
							<button type="button" onclick="suntaek_proc('sihum_view','','${dto.no}')">뒤로가기</button>	
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</body>
</html>