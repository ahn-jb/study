<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ include file="../include/inc_header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<h2>상세보기</h2>
	<table border="1" width="1200">
		<tr>
			<td align="center" width="150px">총 응답수</td>
			<td align="center">질문</td>
			<td align="center">선택한 답변</td>
			<td align="center">응답수 </td>
			<td align="center">%</td>
			<td width="250px">&nbsp;</td>
		</tr>
		<tr>
			<td rowspan="6" align="center"><h3>${ans[0]}</h3></td>
		</tr>
		<tr>
			<td rowspan="6" align="center">${dto.getQuestion()}</td>
		</tr>
		<tr>	
			<td width="400">A1 - ${dto.getAns1()}</td>
			<td align="center">${ans[1]}</td>
			<td align="center">
				<c:if test="${persent[0] == 'NaN'}">
					0%			
				</c:if>
				<c:if test="${persent[0] != 'NaN' }">			
					${persent[0]}% 
				</c:if>
			</td>
			<td>
				<c:if test="${persent[0] == 'NaN'}">
					<hr align="left" style="border : solid 10px  blue;" width=" 0.0%">
				</c:if>
				<c:if test="${persent[0] != 'NaN'}">
					<hr align="left" style="border : solid 10px  blue;" width="${persent[0]}% ">
				</c:if>
			</td>
		</tr>
		<tr>
			<td >A2 - ${dto.getAns2()}</td>
			<td align="center">${ans[2]}</td>
			<td align="center">
				<c:if test="${persent[1] == 'NaN'}">
					0%			
				</c:if>
				<c:if test="${persent[1] != 'NaN' }">			
					${persent[1]}% 
				</c:if>
			</td>
			<td>
				<c:if test="${persent[0] == 'NaN'}">
					<hr align="left" style="border : solid 10px  blue;" width="0%">
				</c:if>
				<c:if test="${persent[0] != 'NaN'}">
					<hr align="left" style="border : solid 10px  blue;" width="${persent[1]}% ">
				</c:if>
			</td>
		</tr>
		<tr>
			<td >A3 - ${dto.getAns3()}</td>
			<td align="center">${ans[3]}</td>
			<td align="center">
				<c:if test="${persent[2] == 'NaN'}">
					0%			
				</c:if>
				<c:if test="${persent[2] != 'NaN' }">			
					${persent[2]}% 
				</c:if>
			</td>
			<td>
				<c:if test="${persent[2] == 'NaN'}">
					<hr align="left" style="border : solid 10px  blue;" width="0%">
				</c:if>
				<c:if test="${persent[2] != 'NaN'}">
					<hr align="left" style="border : solid 10px  blue;" width="${persent[2]}% ">
				</c:if>
			</td>
		</tr>
		<tr>
			<td >A4 - ${dto.getAns4()}</td>
			<td align="center">${ans[4]}</td>
			<td align="center">
				<c:if test="${persent[3] == 'NaN'}">
					0%			
				</c:if>
				<c:if test="${persent[3] != 'NaN' }">			
					${persent[3]}% 
				</c:if>
			</td>
			<td>
				<c:if test="${persent[3] == 'NaN'}">
					<hr align="left" style="border : solid 10px  blue;" width="0%">
				</c:if>
				<c:if test="${persent[3] != 'NaN'}">
					<hr align="left" style="border : solid 10px  blue;" width="${persent[3]}% ">
				</c:if>
			</td>
		</tr>
	</table>
	<br>
	<input type="button" id="btnList" value="목록으로">
<script type="text/javascript">
$(document).ready(function(){
	$("#btnList").click(function(){
		location.href="${path}/test_servlet/list.do";
	});
});
</script>
</body>
</html>