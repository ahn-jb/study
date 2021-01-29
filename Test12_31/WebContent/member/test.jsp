<%@page import="java.net.Inet4Address"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/include_top_common.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test</title>
</head>
<body>
	
	<table border="1" width="100%">
		<tr>
			<td>
				<jsp:include page="../include/include_top1.jsp" flush="false">
				<jsp:param value="<%=ip %>" name="ip"/></jsp:include>
			</td>
		</tr>
		<tr>
			<td style="padding:50px 20px;  ">
				중단
			</td>
		</tr>
		<tr>
			<td>
				<jsp:include page="../include/include_bottom.jsp" flush="false"></jsp:include>
			</td>
		</tr>
	</table>
</body>
</html>