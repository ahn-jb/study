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
	<input type="hidden" id="testNo" value="${dto.testNo}">
	<input type="hidden" id="testName" value="${dto.testName}">
	<input type="hidden" id="testType" value="${dto.testType}">
	<table border="0" width="60%">
		<tr>
			<td colspan="20">
				<h2>문제수정</h2>
			</td>
		</tr>
		<tr>
			<td>
				<table border="1" width="80%">
					<tr>
						<td>TestName:</td>
						<td>
							${dto.testName}(${dto.testType})
						</td>
					</tr>
					<tr>
						<td>TestNumber</td>
						<td>
							<input type="text" id="testNumber" name="testNumber" style="width:20%;" value="${dto.testNumber}">
						</td>
					</tr>
					<tr>
						<td>Question:</td>
						<td>
							<textarea id="question" name="question" style="width:80%; height:100px;">${dto.question}</textarea>
						</td>
					</tr>
					<tr>
						<td>Ans1:</td>
						<td>
							<input type="text" id="ans1" name="ans1" style="width:80%;" value="${dto.ans1}">
						</td>
					</tr>
					<tr>
						<td>Ans2:</td>
						<td>
							<input type="text" id="ans2" name="ans2"  style="width:80%;" value="${dto.ans2}">
						</td>
					</tr>
					<tr>
						<td>Ans3:</td>
						<td>
							<input type="text" id="ans3" name="ans3" style="width:80%;" value="${dto.ans3}">
						</td>
					</tr>
					<tr>
						<td>Ans4:</td>
						<td>
							<input type="text" id="ans4" name="ans4"  style="width:80%;" value="${dto.ans4}">
						</td>
					</tr>
					<tr>
						<td colspan="10" ailgn="center"> 
							<button type="button" onclick="suntaek_proc('munje_sujeongProc','','${dto.no}')">문제수정</button>
							<button type="button" onclick="suntaek_proc('resetList','','')">목록</button>	
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</body>
</html>