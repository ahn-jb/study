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
	<table width="30%">
		<tr>
			<td colsapn="10" >
				<h2>시험결과</h2>
			</td>
		</tr>
		<tr>
			<td>
				<table border="1" width="100%">
					<tr>
						<td align="center">
							[${munje_total}] 문항 중  [${jeongdab_count}] 문항을 맞추셨습니다. <br>
							<c:if test="${fail_munje.trim() != ''}">
								틀린 문항으로는 "${fail_munje}" 이 있습니다.
							</c:if>
							<c:if test="${fail_munje.trim() == ''}">
								틀린 문항이 없습니다. 
							</c:if>
						</td>
					</tr>
					<tr>
						<td align="center">
							<button type="button" onclick="suntaek_proc('test','1','${testNo}')">다시치기</button>
							<button type="button" onclick="suntaek_proc('test_suntaek','1','')">다른시험 치기</button>
							<button type="button" onclick="suntaek_proc('resetList','1','')">목록</button>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
<script type="text/javascript">
$(document).ready(function(){
	result.style.height = "300px";
});
</script>
</body>
</html>