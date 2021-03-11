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
	<table border="0" width="90%">
		<tr>
			<td colspan="20" align="center">
				<h2>성적관리</h2>
			</td>
		</tr>
		<tr>
			<td>
				<table border="1" align="center" width="80%">
					<tr>
						<td>순번</td>
						<td>학생이름</td>
						<td>시험명</td>
						<td>국어</td>
						<td>영어</td>
						<td>수학</td>
						<td>과학</td>
						<td>사회</td>
						<td>총점</td>
						<td>평균</td>
						<td>등록일</td>
					</tr>
					<c:if test="${totalRecord > 0 }">
						<c:forEach var="dto" items="${list}">
							<tr>
								<td>${dto.SJ_no}</td>
								<td>${dto.name}</td>
								<td>${dto.test_name}</td>
								<td>${dto.kor}</td>
								<td>${dto.eng}</td>
								<td>${dto.mat}</td>
								<td>${dto.sci}</td>
								<td>${dto.his}</td>
								<td>${dto.total}</td>
								<td>${dto.avg}</td>
								<td>${dto.SJ_regidate}</td>
							</tr>
						</c:forEach>
					</c:if>
					<c:if test="${totalRecord == 0}">
						<tr height="300" align="center">
							<td colspan="20" align="center">등록된 학생정보가 없습니다.</td>
						</tr>
						</c:if>
					<tr>
						<td colspan="20">
							<button type="button" onclick="btn4('SJChuga');">성적등록</button>
							<button type="button" onclick="btn4('SJ');'">목록</button>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
<script>
	function btn4(value1){
		if(value1 == 'SJChuga'){
			location.href="${path}/student_servlet/SJChuga.do";
		}else if(value1 == "SJ"){
			location.herf="${path}/student_servlet/SJ.do";
		}
	}
</script>
</body>
</html>