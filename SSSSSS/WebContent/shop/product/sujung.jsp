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
	<table border="1" align="center" width="80%">
		<tr>
			<td colspan="2"><h2>상품수정 - ${dto.no}</h2></td>
		</tr>
		<tr>
			<td style="align:center;">상품명</td>
			<td><input type="text" name="name" id="name" value="${dto.name}"></td>
		</tr>
		<tr>
			<td style="align:center;">가격</td>
			<td><input type="text" name="price" id="price" value="${dto.price}"></td>
		</tr>
		<tr>
			<td style="align:center;">상품설명</td>
			<td><textarea name="description" id="description"  style="width:300px; height:100px;" wrap="hard">${dto.description}</textarea></td>
		</tr>
		<tr>
			<td style="align:center;">현재이미지</td>
			<td>
				<c:if test="${dto.product_img == '-,-,-'}">
					이미지X
				</c:if>
				<c:if test="${dto.product_img != '-,-,-'}">
				<c:set var="temp1" value="${fn:split(dto.product_img,',')[0]}"></c:set>
				<c:set var="temp2" value="${fn:split(temp1,'|')[0]}"></c:set>
				<c:set var="temp3" value="${fn:split(temp1,'|')[1]}"></c:set>
				<img src="${path}/attach/product_img/${temp3}" alt="${dto.name}" title="${dto.name}" style="width:130px; height:70px;">
				</c:if>
			</td>
		</tr>
		<tr>
			<td>상품이미지</td>
			<td>
				<input type="file" name="file" id="product_img">
				<input type="file" name="file" id="product_img">
				<input type="file" name="file" id="product_img">				
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center" height="50px;">
				<button type="button" id="btnSujung">수정하기</button>
				<button type="button" id="btnlist">취소</button>
			</td>
		</tr>
	</table>
<script type="text/javascript">
$(document).ready(function(){
	$("#name").select();
	$("#name").focus();
	
	$("#btnSujung").click(function(){
		if(confirm('수정하시겠습니까?')){
			suntaek_proc('sujungProc','','${dto.no}');
		}
	});
	
	$("#btnlist").click(function(){
		suntaek_proc('list','1','');
	});
});
</script>
</body>
</html>