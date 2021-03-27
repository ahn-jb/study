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

	<table border="0" width="30%">
		<tr>
			<td colspan="10">
				<h2>시험지 선택</h2>
			</td>
		</tr>
		<tr>
			<td>
				<table border="1" width="100%">
					<tr>
						<td>시험선택</td>
						<td>
							<select id="testNo">
								<c:forEach var="dto" items="${list}" >
									<option value ="${dto.no}">${dto.testName}(${dto.testType})</option>
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<td colspan="10">
							<button type="button" onclick="test('jeongdab');">정답작성</button>
							<button type="button" onclick="test('jd_sujeong');">정답수정</button>
							<button type="button" onclick="suntaek_proc('resetList','1','')">취소</button>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
<script>
function test(value1){
	var testNo = $('#testNo').val();
	if(value1 == 'jeongdab'){
		suntaek_proc('jeongdab','',testNo);
	}else if(value1 == 'jd_sujeong'){
		suntaek_proc('jd_sujeong','',testNo);
	}
}
</script>
</body>
</html>