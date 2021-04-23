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
<h2>test07Proc.do / exam01Result.jsp</h2>

<h2>상품분류 : ${map.dto.productBunryu }</h2>
<h2>상품이름 : ${map.dto.productName }</h2>
<h2>상품가격 : ${map.dto.productPrice }</h2>
<h2>할인률 : ${map.dto.productSalePercent }</h2>
<h2>할인금액 : ${map.dto.productSaleMoney }</h2>
<h2>제조사 : ${map.dto.productCompany }</h2>

</body>
</html>