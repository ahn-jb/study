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
	<table border="0" width="80%">
		<tr>
			<td colspan="10"><h2>문제 상세보기</h2></td>
		</tr>
		<tr>
			<td>
				<table border="1" width="100%">
					<tr>
						<td>시험명</td>
						<td>${dto.testName}(${dto.testType})</td>
					</tr>
					<tr>
						<td>문제번호</td>
						<td>${dto.testNumber}</td>
					</tr>
					<tr>
						<td>질문</td>
						<td>${dto.question}</td>
					</tr>
					<tr>
						<td>1번</td>
						<td>${dto.ans1}</td>
					</tr>
					<tr>
						<td>2번</td>
						<td>${dto.ans2}</td>
					</tr>
					<tr>
						<td>3번</td>
						<td>${dto.ans3}</td>
					</tr>
					<tr>
						<td>4번</td>
						<td>${dto.ans4}</td>
					</tr>
					<tr>
						<td colspan="10">
							<button type="button" onclick="suntaek_proc('munje_sujeong','','${dto.no}')">수정</button>
							<button type="button" onclick="suntaek_proc('munje_sakje','','${dto.no}')">삭제</button>
							<button type="button" onclick="suntaek_proc('sihum_view','','${dto.testNo}')">시험 상세보기</button>
							<button type="button" onclick="suntaek_proc('resetList','','')">목록</button>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</body>
</html>