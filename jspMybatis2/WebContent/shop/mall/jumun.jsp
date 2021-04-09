<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/inc_header.jsp" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table width="30%" align="center">
		<tr>
			<td colspan="2" align="center">
				<h2>주문하기</h2>
			</td>
		</tr>
		<tr>
			<td>
				<table border="1" width="100%" height="100">
					<tr>
						<td align="center">
							무통장 입금<br><br>
							
							(Hong's Mall)<br>
							농협 : 1684564-12-321654658<br>
							신한 : 1597461 - 2684664<br>
							금액 : <fmt:formatNumber type="number" maxFractionDigits="3" value="${total_price}" />원<br><br>
							입금 확인후 배송합니다.
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
<script>
$(document).ready(function(){
	result.style.height = "200px";	
});
</script>
</body>
</html>