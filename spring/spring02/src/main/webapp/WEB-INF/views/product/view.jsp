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

<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
$(function() {
	$("#btnList").click(function() {
		location.href = "productList";
	});
	//수정버튼클릭
	$("#btnUpdate").click(function() {
		document.form1.action = "productUpdate";
		document.form1.submit();
	});
	//삭제버튼클릭
	$("#btnDelete").click(function() {
		if (confirm('삭제하시겠습니까?')) {
			document.form1.action = "productDelete";
			document.form1.submit();
		}
	});
});


function downloadFile(value1) {
	var url = "${path }/productDownloadNo/" + value1;
	location.href = url;
}
</script>

</head>
<body>

<%-- <jsp:include page="../include/inc_menu.jsp" /> --%>
<%@ include file="../include/inc_menu.jsp" %>

${path }<br>
<h2>상품정보</h2>
<table border="1" width="400">
	<tr>
		<td>상품이미지</td>
		<td>
		
			<c:choose>
				<c:when test="${dto.product_img_type == 'image/jpeg' || dto.product_img_type == 'image/png' || dto.product_img_type == 'image/gif'}">
					<img src="${path }/attach/test_img/${dto.product_img}" width="100px" height="100px">
				</c:when>
				<c:otherwise>
					이미지<br>아님
				</c:otherwise>
			</c:choose>	
				
		</td>
	</tr>
	<tr>
		<td>상품명</td>
		<td>${dto.product_name}</td>
	</tr>
	<tr> 
		<td>가격</td>
		<td>${dto.product_price}</td>
	</tr>
	<tr>
		<td>상품설명</td>
		<td>${dto.product_description}</td>
	</tr>
	
	<tr>
		<td>첨부파일</td>
		<td><a href="#" onclick="downloadFile('${dto.product_no}');">[다운로드]</a></td>
	</tr>
		
	<tr>
		<td colspan="2">
		
<form name="form1" method="post" action="${path }/shop/cart/insert.do">
<input type="hidden" name="product_no" value="${dto.product_no }">
<select name="amount">
<c:forEach begin="1" end="10" var="i">
	<option value="${i }">${i }</option>
</c:forEach>
</select>&nbsp;개
<input type="submit" value="장바구니에 담기">
</form>	

		</td>
	</tr>
</table>

<br>
<a href="${path }/productList">[상품목록]</a>	

</body>
</html>