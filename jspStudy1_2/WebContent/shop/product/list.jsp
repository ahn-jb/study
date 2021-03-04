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

<table border="0" align="center" width="80%">
		<tr>
			<td colspan="7">
				<h2>쇼핑몰 목록</h2>
			</td>
		</tr>
		<tr>
			<td colspan="10">
				<form name="search">				
					<select name="search_option" id="search_option">
						<c:choose>
						<c:when test="${search_option == 'name'}">
							<option value="">-선택-</option>
							<option value="name" selected="selected">상품명</option>
							<option value="discription" >상품설명</option>
							<option value="total">상품명+상품설명</option>
						</c:when>
						<c:when test="${search_option == 'discription'}">
							<option value="">-선택-</option>
							<option value="name" >상품명</option>
							<option value="discription" selected="selected">상품설명</option>
							<option value="total">상품명+상품설명</option>
						</c:when>
						<c:when test="${search_option == 'total'}">
							<option value="">-선택-</option>
							<option value="name" >상품명</option>
							<option value="discription" >상품설명</option>
							<option value="total" selected="selected">상품명+상품설명</option>
						</c:when>
						<c:otherwise>
							<option value="" selected="selected">-선택-</option>
							<option value="name">상품명</option>
							<option value="discription" >상품설명</option>
							<option value="total">상품명+상품설명</option>
						</c:otherwise>
						</c:choose>
					</select>
					<input type="text" name="search_data" id="search_data" value="${search_data}" style="width:: 150px;">
					<input type="button" value="검색" onclick="search2();"><br>
					전체 ${totalRecord}건입니다.
				</form>
			</td>
		</tr>
		<tr>
			<td>
				<table border="1" width="1500">
					<tr>
						<td width="70">상품코드</td>
						<td width="150">상품사진</td>
						<td width="200">상품명</td>
						<td width="100">가격</td>
						<td width="300">상품설명</td>
						<td>파일</td>
						<td width="100">장바구니 수</td>
						<td>등록날자</td>
					</tr>
					<c:forEach var="dto" items="${list}">
						<tr>
							<td>${dto.no}</td>
							<td align="center">
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
<%-- 										<c:if test="${dto.product_img != '-,-,-'}"> --%>
<%-- 										<c:set var="temp1" value="${fn:split(dto.product_img,',')[1]}"></c:set> --%>
<%-- 										<c:set var="temp2" value="${fn:split(temp1,'|')[0]}"></c:set> --%>
<%-- 										<c:set var="temp3" value="${fn:split(temp1,'|')[1]}"></c:set> --%>
<%-- 										<a href="#" onclick="suntaek_proc('view','','${dto.no}');"> --%>
<%-- 											<img src="${path}/attach/product_img/${temp3}" alt="${dto.name}" title="${dto.name}" style="width:130px; height:70px;"> --%>
<!-- 										</a> -->
<%-- 										</c:if> --%>
									</c:otherwise>
								</c:choose>
							</td>
							<td>${dto.name}</td>
							<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${dto.price}" /></td>
							<td>${dto.description}</td>
							<td>${dto.product_img}</td>
							<td><fmt:formatNumber type="number" maxFractionDigits="3" value="0"/></td>
							<td>${dto.regi_date}</td>
						</tr>
						<c:set var="number" value="${number= number-1}"></c:set>
					</c:forEach>
					<c:if test="${list.size() == 0}">
						<tr>
							<td colspan="10" align="center"><h3>목록이 없습니다.</h3></td>
						</tr>
					</c:if>
					<c:if test="${totalRecord > 0 }">
					<tr>
						<td colspan="10" height="50" align="center">
							<a href="#" onclick="uu('survey_list','1','');">[첫페이지]</a>&nbsp;&nbsp;
							<c:if test="${startPage > blockSize }">
								<a href="#" onclick="uu('survey_list','${startPage -blockSize}','');">[이전 10개]</a>
							</c:if>
							<c:if test="${startPage <=blockSize }"> [이전10개] </c:if>&nbsp;&nbsp;
							<c:forEach var="i" begin="${startPage}" end="${lastPage}" step="1">
							<c:if test="${i == pageNumber}"> [${i}]</c:if>
							<c:if test="${i != pageNumber}">
								<a href="#" onclick="uu('survey_list','${i}','');">${i}</a>
							</c:if>
							</c:forEach>&nbsp;&nbsp;
							<c:if test="${lastPage < totalPage }">
								<a href="#" onclick="uu('survey_list','${startPage + blockSize}','');">[다음 10개]</a>
							</c:if>
							<c:if test="${lastPage >= totalPage }"> [다음10개] </c:if>&nbsp;&nbsp;
							<a href="#" onclick="uu('survey_list','${totalPage}','');">[끝페이지]</a> 
						</td>
					</tr>
					</c:if>	
					<tr>
						<td colspan="10" height="50" align="right">
							<button type="button" id="list_all">전체목록</button>
							<button type="button" id="btnChuga">상품 추가</button>
						</td>
					</tr>
				</table>
			</td>
		</tr>
</table>
<script type="text/javascript">
$("#btnChuga").click(function(){
	 suntaek_proc('chuga','','');
});
$("#list_all").click(function(){
	suntaek_proc('list','1','');
});

function search2(){
	$("#span_search_option").text($("#search_option").val())
	$("#span_search_data").text($("#search_data").val())
	suntaek_proc('list','1','');
}
</script>
</body>
</html>