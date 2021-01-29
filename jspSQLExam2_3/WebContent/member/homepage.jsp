<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/include_import.jsp" %>
<%@ include file="../include/include_check/include_check.jsp" %>
<%@ include file="../include/include_check/include_session.jsp" %>

<%
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>홈페이지</title>
</head>
<body>
	<table border="1" width="100%">
	<tr>
		<td colspan="1"><%@ include file="../include/include_top.jsp" %></td>
	</tr>
	<tr>
		<td align="center">
			
			<h2>홈페이지</h2>
			<table border="1">
				<tr>
					<td>
						<a href="../product/product_select.jsp?no_product=1"><img src="../image/productimage/sweetpotato.jpg" style="width:100px; height:100px;"></a><br>
						고구마 5000원 
					</td>
					
				</tr>
			</table>
			
		</td>
	</tr>
	<tr>
		<td colspan="1"><%@ include file="../include/include_bottom.jsp" %></td>
	</tr>
	</table>
</body>
</html>