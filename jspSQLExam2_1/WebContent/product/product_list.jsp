<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/include_import.jsp" %>
<%@ include file="../include/include_check/include_check.jsp" %>
<%@ include file="../include/include_check/include_session.jsp" %>

<%
	int no = Integer.parseInt(request.getParameter("no"));

	ProductDAO dao2 = new ProductDAO();
	ArrayList<ProductDTO> list = dao2.getSelectAll();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품목록</title>
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
						<tr>
							<td>상품번호</td>
							<td>상품코드</td>
							<td>상품이름</td>
							<td>상품가격</td>
							<td>상품갯수</td>
							<td>등록날짜</td>
						</tr>
						<%for(int i=0; i<list.size(); i++){ %>
						<%	ProductDTO dto2 = list.get(i); %>
						<tr>
							<td><%=dto2.getNo()%></td>
							<td><a href="location.href='../product/product_View.jsp?no_member=<%=no%>&no_product=<%=dto2.getNo()%>'"><%=dto2.getP_code()%></a></td>
							<td><%=dto2.getP_name()%></td>
							<td><%=dto2.getP_price()%></td>
							<td><%=dto2.getP_count()%></td>
							<td><%=dto2.getRegidate()%></td>
						</tr>
						<%} %>
					</table>
					<br>
					<button type="button" onclick="save(<%=no%>);">수정</button>&nbsp;&nbsp;
					<button type="button" onclick="save(<%=no%>);">삭제</button>
				</form>
			</td>
		</tr>
		<tr>
			<td colspan="1"><%@ include file="../include/include_bottom.jsp" %></td>
		</tr>
	</table>
	
</body>
</html>