<%@page import="java.net.Inet4Address"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/include_import.jsp" %>
<%@ include file="../include/include_check/include_check.jsp" %>
<%@ include file="../include/include_check/include_session.jsp" %>
<%@ include file="../include/include_check/include_session_check.jsp" %>

<%
	int no = Integer.parseInt(request.getParameter("no"));
														 
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품추가</title>
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
				<form name="productForm" align="center">
				<h2 >상품추가</h2>
					<table align="center">
						<tr>
							<td>상품코드</td>
							<td><input type="text" name="p_code" ></td>
						</tr>
						<tr>
							<td>상품이름</td>
							<td><input type="text" name="p_name" ></td>
						</tr>
						<tr>
							<td>상품가격</td>
							<td><input type="text" name="p_price"></td>
						</tr>
						<tr>
							<td>상품갯수</td>
							<td><input type="text" name="p_count" ></td>
						</tr>
					</table>
					<br>
					<button type="button" onclick="save(<%=no%>);">상품등록</button>
				</form>
			</td>
		</tr>
		<tr>
			<td colspan="1"><%@ include file="../include/include_bottom.jsp" %></td>
		</tr>
	</table>
	
<script>
	function save(value1){
		if(document.productForm.p_code.value.trim() ==""){
			alert('상품코드를 입력해주세요.')
			document.productForm.p_code.focus();
			return false;
		}else if(document.productForm.p_name.value.trim() ==""){
			alert('상품이름을 입력해주세요.')
			document.productForm.p_name.focus();
			return false;
		}else if(document.productForm.p_price.value.trim()==""){
			alert('상품가격을 입력해주세요.')
			document.productForm.p_price.focus();
			return false;
		}else if(document.productForm.p_count.value.trim()==""){
			alert('상품갯수를 입력해주세요.')
			document.productForm.p_count.focus();
			return false;
		}else if(confirm('상품을 등록하시겠습니까?')){
			document.productForm.method ="post";
			document.productForm.action ="productProc.jsp?no="+value1;
			document.productForm.submit();
		}
	}
</script>	
	
</body>
</html>