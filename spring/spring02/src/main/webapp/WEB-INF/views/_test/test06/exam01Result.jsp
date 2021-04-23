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
<h2>test06Proc.do / exam01Result.jsp</h2>

<h2>상품분류 : ${productBunryu }</h2>
<h2>상품이름 : ${productName }</h2>
<h2>상품가격 : ${productPrice }</h2>
<h2>할인률 : ${productSalePercent }</h2>
<h2>할인금액 : ${productSaleMoney }</h2>
<h2>제조사 : ${productCompany }</h2>

<hr>

<h2>상품분류 : ${dto.productBunryu }</h2>
<h2>상품이름 : ${dto.productName }</h2>
<h2>상품가격 : ${dto.productPrice }</h2>
<h2>할인률 : ${dto.productSalePercent }</h2>
<h2>할인금액 : ${dto.productSaleMoney }</h2>
<h2>제조사 : ${dto.productCompany }</h2>

</body>
</html>