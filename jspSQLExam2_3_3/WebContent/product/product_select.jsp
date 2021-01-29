<%@page import="java.net.Inet4Address"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/include_import.jsp" %>
<%@ include file="../include/include_check/include_check.jsp" %>
<%@ include file="../include/include_check/include_session.jsp" %>
<%@ include file="../include/include_check/include_session_check.jsp" %>

<%
	int no = cookNo;
	int no_product = Integer.parseInt(request.getParameter("no_product"));
	
	MemberDAO dao_2 = new MemberDAO();
	MemberDTO dto_2 = dao_2.getSelectOneNo(no);
	
	ProductDAO dao_3 = new ProductDAO();
	ProductDTO dto_3 = dao_3.getSelectOne(no_product);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품주문</title>
</head>
<body>
	
	<table border="1" width="100%" >
		<tr>
			<td>
				<%@ include file="../include/include_top.jsp" %>
				<%@ include file="../include/include_check/include_access.jsp"%>
			</td>
		</tr>
		<tr>
			<td>
				<form name ="gumaeForm">
				<h2>주문페이지</h2>
					<input type="hidden" name ="no" value="<%=dto_3.getNo()%>">
					<input type="hidden" name ="p_price" value="<%=dto_3.getP_price()%>">
					<table>
						<tr> 
							<td>구매자</td>
							<td><input type="text" name="member_id" value="<%=dto_2.getId()%>"><td>
						</tr>
						<tr>
							<td>상품코드</td>
							<td><input type="text" name="p_code" value="<%=dto_3.getP_code()%>" readonly></td>
						</tr>
						<tr>
							<td>상품이름</td>
							<td><input type="text" name="p_name" value="<%=dto_3.getP_name()%>" readonly></td>
						</tr>
						<tr>
							<td>구매 갯수</td>
							<td><input type="text" name="p_NOP" value=""></td>
						</tr>
						<tr>
							<td>구매자 주소</td>
							<td><input type="text" name="member_addr" value=""></td>
						</tr>
					</table>
						<button type="button" onclick="gumae();">구매하기</button>
						<button type="button" onclick ="location.href='../member/homepage.jsp';">취소</button>
				</form>
			</td>
		</tr>
		<tr>
			<td colspan="1"><%@ include file="../include/include_bottom.jsp" %></td>
		</tr>
	</table>
<script>
	function gumae(){
		document.gumaeForm.method="post";
		document.gumaeForm.action="product_selectProc.jsp";
		document.gumaeForm.submit();
	}
</script>
</body>
</html>