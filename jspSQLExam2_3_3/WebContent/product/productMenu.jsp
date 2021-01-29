<%@page import="java.net.Inet4Address"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/include_import.jsp" %>
<%@ include file="../include/include_check/include_check.jsp" %>
<%@ include file="../include/include_check/include_session.jsp" %>
<%@ include file="../include/include_check/include_session_check.jsp" %>

<%
	int no = cookNo;
														 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품관리</title>
</head>
<body>
	<table border="1" width="100%">
		<tr>
			<td>
				<%@ include file="../include/include_top.jsp" %>
				<%@ include file="../include/include_check/include_access.jsp"%>
				<hr>
				<%@ include file="../include/include_check/include_member_menu.jsp" %>	
			</td>
		</tr>
		<tr>
			<td>
				<form align="center">
					<h2>상품관리 메뉴</h2>
					<a href="../product/product.jsp?no=<%=no%>" >상품추가</a><br>
					<a href="../product/product_list.jsp?no=<%=no%>">상품목록</a><br>
				</form>
			</td>
		</tr>
		<tr>
			<td colspan="1"><%@ include file="../include/include_bottom.jsp" %></td>
		</tr>
	</table>
	
</body>
</html>