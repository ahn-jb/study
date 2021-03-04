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
	<table border="1" width="90%" align="center" >
		<tr>
			<td colspan="2">
				<h2>Shopping Mall</h2>
			</td>
		</tr>
		<tr>
			<td width="100px">상품번호</td>
			<td>${dto.getNo()}</td>
		</tr>
		<tr>
			<td>이미지</td>
			<td>
				<c:choose>
					<c:when test="${dto.product_img == '-,-,-'}">
						<a href="#" onclick="suntaek_proc('view','','${dto.no}');">이미지X</a>
					</c:when>
					<c:otherwise>
						<c:if test="${dto.product_img != '-,-,-'}">
						<c:set var="temp1" value="${fn:split(dto.product_img,',')[0]}"></c:set>
						<c:set var="temp2" value="${fn:split(temp1,'|')[0]}"></c:set>
						<c:set var="temp3" value="${fn:split(temp1,'|')[1]}"></c:set>
						<a href="#" onclick="suntaek_proc('view','','${dto.no}');">
							<img src="${path}/attach/product_img/${temp3}" alt="${dto.name}" title="${dto.name}" style="width:130px; height:70px;">
						</a>
						</c:if>
					</c:otherwise>
				</c:choose>
			</td>
		</tr>
		<tr>
			<td width="200px">상품이름</td>
			<td>${dto.getName()}</td>
		</tr>
		<tr>
			<td width="200px">상품가격</td>
			<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${dto.price}" /></td>
		</tr>
		<tr height="200">
			<td width="200px">상품설명</td>
			<td>${dto.getDescription()}</td>
		</tr>
		<tr>
			<td width="200px">등록일</td>
			<td>${dto.getRegi_date()}</td>
		</tr>
		<tr>
			<td colspan="2">
				<select name="purchase_count" id="purchase_count">
					<option value="1">1개</option>
					<option value="2">2개</option>
					<option value="3">3개</option>
					<option value="4">4개</option>
				</select>
				<button type="button" onclick="suntaek_proc('mall_cart','1','');">장바구니담기</button>
				<button type="button" onclick="suntaek_proc('cart_list2','1','');">장바구니</button>
				<button type="button" onclick="suntaek_proc('mall_list','1','');">목록으로</button>
			</td>				
		</tr>
	</table>
</body>
</html>