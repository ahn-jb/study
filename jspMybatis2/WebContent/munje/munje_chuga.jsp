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
							<select id="testNumber">
								<c:forEach var="dto" items="${list}" >
									<option value ="${dto.no}">${dto.testName}</option>
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<td>Type:</td>
						<td>
							<input type="radio" id="testType" name="testType" value="A">A
							<input type="radio" id="testType" name="testType" value="B">B
							<input type="radio" id="testType" name="testType" value="C">C
							<input type="radio" id="testType" name="testType" value="D">D
						</td>
					</tr>
					<tr>
						<td>TestNumber</td>
						<td>
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
						<td>Status:</td>
						<td>
							<input type="radio" id="status" name="status" value="0">ON
							<input type="radio" id="status" name="status" value="1">OFF
						</td>
					</tr>
					<tr>
						<td colspan="10" ailgn="center"> 
							<button type="button" onclick="suntaek_proc('munje_chugaProc','','')">추가</button>
							<button type="button" onclick="suntaek_proc('resetList','','')">목록</button>	
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</body>
</html>