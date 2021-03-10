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
	<h2>상품 상세보기</h2>
		<table border="1" width="90%" align="center" >
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
				<td width="200px">파일</td>
				<td>${dto.getProduct_img()}</td>
			</tr>
			<tr>
				<td>장바구니 수량</td>
				<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${dto.buy_count}"/></td>
			</tr>
			<tr>
				<td width="200px">등록일</td>
				<td>${dto.getRegi_date()}</td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="button" onclick="suntaek_proc('chuga','1','');">상품등록</button>
					<button type="button" onclick="suntaek_proc('sujung','','${dto.no}');">상품수정</button>
					<button type="button" onclick="suntaek_proc('sakje','','${dto.no}');">상품삭제</button>
					<button type="button" onclick="suntaek_proc('list','1','');">목록으로</button>
				</td>				
			</tr>
		</table>
</body>
</html>