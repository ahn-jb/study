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
			<td colspan="3" align="center">
				<h2>시험관리</h2>
			</td>
		</tr>
		<tr>
			<td>
				<table border="1" width="80%" align="center">
					<tr>
						<td>순번</td>
						<td>시험명</td>
						<td>등록일</td>
					</tr>
					<c:if test="${totalRecord > 0 }">
						<c:forEach var="dto" items="${list}">
							<tr>
								<td>${dto.test_no}</td>
								<td>${dto.test_name}</td>
								<td>${dto.test_regidate }</td>
							</tr>
						</c:forEach>
					</c:if>
					<c:if test="${totalRecord == 0 }">
						<tr height="300" align="center">
							<td colspan="20" align="center">등록된 시험이 없습니다.</td>
						</tr>
					</c:if>
					<tr>
						<td colspan="3">
							<button type="button" onclick="btn2('testChuga')">추가하기</button>
							<button type="button" onclick="btn2('testList')">목록</button>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
<script>
	function btn2(value1){
		if(value1 == 'testChuga'){
			location.href="${path}/student_servlet/testChuga.do";
		}else if(value1 =='testList'){
			location.href="${path}/student_servlet/test.do";
		}
	}
</script>
</body>
</html>