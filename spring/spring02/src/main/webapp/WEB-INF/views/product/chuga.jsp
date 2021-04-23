<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
     
<%@ include file="../include/inc_header.jsp" %>
     
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="0"/>
<meta http-equiv="Pragma" content="no-cache"/>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%-- <jsp:include page="../include/inc_menu.jsp" /> --%>
<%@ include file="../include/inc_menu.jsp" %>

${path }<br>
<h2>상품등록</h2>
<%-- 
<form name="form1" method="post" action="productChugaProc">
<form id="form1" action="productChugaProc" method="post" enctype="multipart/form-data" target="iframe01">
--%>
<form id="form1" action="productChugaProc" method="post" enctype="multipart/form-data">
<table border="1" width="400">
	<tr>
		<td>상품이름</td>
		<td><input type="text" name="product_name" id="product_name"></td>
	</tr>
	<tr>
		<td>상품가격</td>
		<td><input type="text" name="product_price" id="product_price"></td>
	</tr>
	<tr>
		<td>상품설명</td>
		<td><input type="text" name="product_description" id="product_description"></td>
	</tr>
	<tr>
		<td>상품이미지</td>
		<td>
			<input type="file" name="file"><!-- 여기 name="file"과 Controller 의 MultipartFile file 이 부분의 이름이 같아야 한다. 여기서는 file 로 사용한다. -->
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<input type="submit" value="확인">
		</td>
	</tr>
</table>
</form>

<iframe name="iframe01" style="display: none; width: 500px; height: 300px; border: 1px solid black;"></iframe>

</body>
</html>