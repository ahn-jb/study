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

	<input type="hidden" id="testNo" value="${dto.no}">
	<input type="hidden" id="testName" value="${dto.testName}">
	<input type="hidden" id="testType" value="${dto.testType}">
	<table border="0" width="80%">
		<tr>
			<td>
				<h2>시험 상세보기</h2>
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
							<a href="#" onclick="suntaek_proc('munje_view','','${dto1.munjeNo}')" style="text-decoration: none">Q.${dto1.testNumber} - ${dto1.question}</a><br>
						</c:forEach>
						</td>
					</tr>
					<tr>	
						<td colspan="4">
							<button type="button" onclick="suntaek_proc('sihum_sujeong','','${dto.no}')">수정</button>
							<button type="button" onclick="sihum_sakje('${dto.no}')">삭제</button>
							<button type="button" onclick="suntaek_proc('munje_chuga','','${dto.no}')" >문제추가</button>
							<button type="button" onclick="suntaek_proc('answer_chuga','','${dto.no}')" >정답관리</button>
							<button type="button" onclick="suntaek_proc('resetList','','')">목록</button>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
<script type="text/javascript">
$(document).ready(function(){
	result.style.height = "500px";
});
	function sihum_sakje(value1){
		if(confirm('정말 삭제하시겠습니까?')){
			suntaek_proc('sihum_sakje','',value1);			
		}else{
			
		}
	}
</script>
</body>
</html>