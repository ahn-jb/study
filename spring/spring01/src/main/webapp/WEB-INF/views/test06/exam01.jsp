<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/inc_menu.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="test06Proc.do" method="post">
		상품분류 : <input type="text" name="product_bunryu" id="product_bunryu" value=""> <br>
		상품이름 : <input type="text" name="product_name" id="product_name" value=""> <br>
		상품가격 : <input type="text" name="product_price" id="product_price" value="">원<br>
		할인률 : <input type="text" name="harin" id="harin" value="">% <br>
		제조사	: <input type="text" name="maid" id="maid" value=""> <br>
		<input type="submit" value="확인">
	</form>
</body>
</html>