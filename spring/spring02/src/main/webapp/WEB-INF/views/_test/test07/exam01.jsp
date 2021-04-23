<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../../include/inc_header.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%@ include file="../../include/inc_menu.jsp" %>

${path }<br>
<h2>test07.do / exam01.jsp</h2>
<form action="test07Proc.do" method="post">
상품분류 <input type="text" name="productBunryu"><br>
상품이름 <input type="text" name="productName"><br>
상품가격 <input type="text" name="productPrice"><br>
할인률 <input type="text" name="productSalePercent"><br>
할인금액 <input type="text" name="productSaleMoney"><br>
제조사 <input type="text" name="productCompany"><br>
<input type="submit" value="확인">
</form>		

</body>
</html>