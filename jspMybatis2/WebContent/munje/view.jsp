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
	<table border="0" width="80%">
		<tr>
			<td>
				<h2>상세보기</h2>
			</td>
		</tr>
		<tr>
			<td>
				<table border="1" width="100%">
					<tr>	
						<td>시험명</td>
						<td>${dto.testName}(${dto.testType})</td>
					</tr>
					<tr>	
						<td>기간</td>
						<td>${dto.start_date} ~ ${dto.last_date}</td>
					</tr>
					<tr>	
						<td>등록일</td>
						<td>${dto.regi_date}</td>
					</tr>
					<tr>	
						<td>문제</td>
						<td>
						<c:forEach var="dto1" items="${list}" >
							<a href="#" onclick="suntaek_proc('munjeView','','${dto1.no}')">Q.${dto1.testNumber}</a><br>
						</c:forEach>
						</td>
					</tr>
					<tr>	
						<td colspan="4">
							<button type="button" onclick="suntaek_proc('sujeong','','${dto.no}')">수정</button>
							<button type="button" onclick="suntaek_proc('sakje','','${dto.no}')">삭제</button>
							<button type="button" onclick="suntaek_proc('resetList','','')">목록</button>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</body>
</html>