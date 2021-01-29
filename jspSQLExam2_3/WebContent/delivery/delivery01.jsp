<%@page import="java.net.Inet4Address"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/include_import.jsp" %>
<%@ include file="../include/include_check/include_check.jsp" %>
<%@ include file="../include/include_check/include_session.jsp" %>
<%@ include file="../include/include_check/include_session_check.jsp" %>

<%
// 	int no = Integer.parseInt(request.getParameter("no"));
	int no = 1;

	MemberDAO dao_2 = new MemberDAO();
	MemberDTO dto_2 = dao_2.getSelectOneNo(no);
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
				<hr>
				<%@ include file="../include/include_check/include_member_menu.jsp" %>	
			</td>
		</tr>
		<tr>
			<td>
				<form>
					<table>
						<tr> 
							<td>구매자</td>
							<td><input type="text" name="member_id" value="<%=dto_2.getId()%>"><td>
						</tr>
						<tr>
							<td>상품코드</td>
							<td><input type="text" name="p_code" value=""></td>
						</tr>
						<tr>
							<td>상품이름</td>
							<td><input type="text" name="p_name" value=""></td>
						</tr>
						<tr>
							<td>구매 갯수</td>
							<td><input type="text" name="p_NOP" value=""></td>
						</tr>
						<tr>
							<td>총 가격</td>
							<td><input type="text" name="p_total" value=""></td>
						</tr>
						<tr>
							<td>구매자 주소</td>
							<td><input type="text" name="member_addr" value=""></td>
						</tr>
					</table>
				</form>
			</td>
		</tr>
		<tr>
			<td colspan="1"><%@ include file="../include/include_bottom.jsp" %></td>
		</tr>
	</table>
</body>
</html>