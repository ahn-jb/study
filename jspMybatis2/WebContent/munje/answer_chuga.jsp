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
	<span id="proc_check"></span>
	<input type="hidden" id="test_name" value="${dto.testName}(${dto.testType})">
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
							<input type="hidden" id="testNo" value="${dto.no}"> 
							${dto.testName}(${dto.testType})
						</td>
					</tr>
					<tr>
						<td colspan="10" align="center">
							<button type="button" onclick="test('jeongdab');">정답작성</button>
							<button type="button" onclick="test('jd_sujeong');">정답수정</button>
							<button type="button" onclick="test('jd_sakje');">정답삭제</button>
							<button type="button" onclick="suntaek_proc('sihum_view','','${dto.no}')">뒤로가기</button>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
<script>


function test(value1){
	$("#proc_check").text(value1);
	var testNo = $('#testNo').val();
	var test_name = $('#test_name').val();
	if(value1 == 'jeongdab'){
		suntaek_proc('jeongdab','',testNo);
	}else if(value1 == 'jd_sujeong'){
		suntaek_proc('jd_sujeong','',testNo);
	}else if(value1 == 'jd_sakje'){
		if(confirm('정말 삭제하시겠습니까?'))
		suntaek_proc('jd_sakje','',testNo);
	}
}
</script>
</body>
</html>