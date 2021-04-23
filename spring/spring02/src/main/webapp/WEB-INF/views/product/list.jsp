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
<h2>상품목록</h2>
<table border="1" width="600">
	<tr>
		<td>상품ID</td>
		<td>상품이미지</td>
		<td>상품명</td>
		<td>상품가격</td>
		<td>파일타입</td>
		<td>파일이름</td>
		<td>&nbsp;</td>
	</tr>
	
	<c:forEach var="dto" items="${list }">
		<tr>
			<td>${dto.product_no }</td>
			<td>
			
				<c:choose>
					<c:when test="${dto.product_img_type == 'image/jpeg' || dto.product_img_type == 'image/png' || dto.product_img_type == 'image/gif'}">
						<img src="${path }/attach/test_img/${dto.product_img}" width="50" height="50">
					</c:when>
					<c:otherwise>
						이미지<br>아님
					</c:otherwise>
				</c:choose>		
					
			</td>
			<td><a href="${path }/productView/${dto.product_no}">${dto.product_name }</a></td><!-- @PathVariable , ?product_id=5 형태로도 가능  -->
			<td>
				<fmt:formatNumber value="${dto.product_price}" pattern="#,###" /><!-- 3자리마다 , 찍어라는 뜻.. -->
			</td>
			<td>${dto.product_img_type }</td>
			<td>${dto.product_img_oldName }</td>
			<td>
				<a href="#" onclick="downloadFile('${dto.product_no}');">[다운로드]</a>
			</td>
		</tr>
	</c:forEach>
</table>

<!--  관리자만상품등록 버튼 표시 -->
<c:if test="${sessionScope.admin_userid != null }">
	<br>
	<button type="button" id="btnAdd">상품등록</button>
</c:if>

<br>
<a href="#" onclick="location.href='productChuga';">[상품등록]</a>


<script>
	function downloadFile(value1) {
		var url = "${path }/productDownloadNo/" + value1;
		location.href = url;
	}
	function downloadFile___(value1, value2) {
		var url = "${path }/productDownload?filePath=" + value1 + "&fileName=" + value2;
		location.href = url;
	}
</script>

</body>
</html>