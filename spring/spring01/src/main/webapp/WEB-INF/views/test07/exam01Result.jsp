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
	<h2>test07.do / exam01Result.jsp</h2>
	<h2>상품분류 : ${dto.getProduct_bunryu()}</h2>
	<h2>상품이름 : ${dto.getProduct_name()}</h2>
	<h2>상품가격 : ${dto.getProduct_price()}원</h2>
	<h2>할인률 : ${dto.getHarin()}%</h2>
	<h2>할인금액 : ${dto.getHarin_price()}원</h2>
	<h2>제조사 : ${dto.getMaid()}</h2>

</body>
</html>