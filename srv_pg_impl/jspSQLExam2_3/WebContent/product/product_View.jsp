<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/include_import.jsp" %>
<%@ include file="../include/include_check/include_check.jsp" %>
<%@ include file="../include/include_check/include_session.jsp"%>

<%
	int no = Integer.parseInt(request.getParameter("no_member"));
	int no_product = Integer.parseInt(request.getParameter("no_product"));

	ProductDAO dao2 = new ProductDAO();
	
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
				<form  align="center">
				<h2 >상품목록</h2>
					<table border="1" align="center">
						<%	ProductDTO dto2 = dao2.getSelectOne(no_product); %>
						<tr>
							<td>상품번호</td>
							<td><%=dto2.getNo()%></td>
						</tr>
						<tr>
							<td>상품코드</td>
							<td><%=dto2.getP_code()%></td>
						</tr>
						<tr>
							<td>상품이름</td>	
							<td><%=dto2.getP_name()%></td>
						</tr>
						<tr>
							<td>상품가격</td>
							<td><%=dto2.getP_price()%></td>
						</tr>
						<tr>
							<td>상품갯수</td>
							<td><%=dto2.getP_count()%></td>
						</tr>
						<tr>
							<td>등록날짜</td>
							<td><%=dto2.getRegidate()%></td>
						</tr>
					</table>
					<br>
					<button type="button" onclick="save('<%=no%>','<%=dto2.getNo()%>');">수정</button>&nbsp;&nbsp;
					<button type="button" onclick="save('<%=no%>','<%=dto2.getNo()%>');">삭제</button>
				</form>
			</td>
		</tr>
		<tr>
			<td colspan="1"><%@ include file="../include/include_bottom.jsp" %></td>
		</tr>
	</table>
	
</body>
</html>