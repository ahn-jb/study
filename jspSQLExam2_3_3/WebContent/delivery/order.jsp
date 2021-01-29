<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/include_import.jsp" %>
<%@ include file="../include/include_check/include_check.jsp" %>
<%@ include file="../include/include_check/include_session.jsp" %>
<%@ include file="../include/include_check/include_session_check.jsp" %>

<%
	int no = Integer.parseInt(request.getParameter("no"));

	ProductDAO dao_2 = new ProductDAO();
	ArrayList<ProductDTO> list = dao_2.getSelectAllDelivery();
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문페이지</title>
</head>
<body>

<table border="1" width="100%">
<tr >
	<td colspan="1" >		
		<%@ include file="../include/include_top.jsp" %>
		<%@ include file="../include/include_check/include_access.jsp"%>
		<hr>
		<%@ include file="../include/include_check/include_member_menu.jsp" %>
	</td>

</tr>
<tr>
	<td widtd="1000" height="150" >
		<h2>주문페이지</h2>
		<table border="1" width="1000" >
						<tr>
							<td>구매번호</td>
							<td>구매자</td>
							<td>상품코드</td>
							<td>상품이름</td>
							<td>구매갯수</td>
							<td>총 가격</td>
							<td>주소</td>
							<td>현재상황</td>
							<td>구매날짜</td>
						</tr>
					<%for(int i=0; i<list.size(); i++){
						ProductDTO dto_2 = list.get(i);	
						
					%>	
						<tr>
							<td><%=dto_2.getNo()%> </td>
							<td><%=dto_2.getMember_id()%> </td>
							<td><%=dto_2.getP_code()%> </td>
							<td><%=dto_2.getP_name()%> </td>
							<td><%=dto_2.getP_NOP()%> </td>
							<td><%=dto_2.getP_total()%> </td>
							<td><%=dto_2.getMember_addr()%> </td>
							<td><%=dto_2.getCurrent_status()%> </td>
							<td><%=dto_2.getRegidate() %></td>
						</tr>
					<%} %>
					</table>
	</td>
</tr>
<tr>
	<td colspan="1"><%@ include file="../include/include_bottom.jsp" %></td>
</tr>
</table>
	
</body>
</html>