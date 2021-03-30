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
	<table width="30%">
		<tr>
			<td colspan="2">
				<h2>주문하기</h2>
			</td>
		</tr>
		<tr>
			<td>
				<table border="1" width="100%">
					<tr>
						<td>
							농협 : 1684564 - 12-321654658<br>
							신한 : 15974612684664<br>
							금액 : <fmt:formatNumber type="number" maxFractionDigits="3" value="${total_price}" />원
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</body>
</html>