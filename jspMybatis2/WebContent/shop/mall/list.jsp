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
	<table border="0" width="84%">
		<tr>
			<td colspan="2"><h2>Shopping Mall</h2></td>
		</tr>
		<tr>
			<td colspan="10">
				<form name="search">				
					<select name="search_option" id="search_option">
						<c:choose>
						<c:when test="${search_option == 'name'}">
							<option value="">-선택-</option>
							<option value="name" selected="selected">상품명</option>
							<option value="description" >상품설명</option>
							<option value="total">상품명+상품설명</option>
						</c:when>
						<c:when test="${search_option == 'discription'}">
							<option value="">-선택-</option>
							<option value="name" >상품명</option>
							<option value="description" selected="selected">상품설명</option>
							<option value="total">상품명+상품설명</option>
						</c:when>
						<c:when test="${search_option == 'total'}">
							<option value="">-선택-</option>
							<option value="name" >상품명</option>
							<option value="description" >상품설명</option>
							<option value="total" selected="selected">상품명+상품설명</option>
						</c:when>
						<c:otherwise>
							<option value="" selected="selected">-선택-</option>
							<option value="name">상품명</option>
							<option value="description" >상품설명</option>
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
		<c:if test="${totalRecord ==0 }">
			<tr>
				<td>
					<table border="1" align="center" width="100%" height="500">
						<tr>
							<td>상품이 존재하지 않습니다. </td>
						</tr>		
					</table>
				</td>
			</tr>
		</c:if>
		<c:if test="${totalRecord > 0}">
		<tr>
			<td style="paddong:0 0 20px 0; ">
				<c:set var="cell_counter" value="3"></c:set>
				<c:set var="k" value="0"></c:set>
				<table border="1" align="center" width="100%" height="80%">
					<c:forEach var="dto" items="${list}">
						<c:set var="k" value="${k=k+1}"/>
						<c:if test="${k mod cell_counter ==1 }">
							<c:set var="imsi_counter" value="0"></c:set>
						<tr>
						</c:if>
						<td width="34%">
							<c:set var="imsi_counter" value="${imsi_counter= imsi_counter+1 }"></c:set>
							<table border="1" align="center" width="60%" >
								<tr>
									<td align="center" >
										<c:choose>
											<c:when test="${dto.product_img == '-,-,-'}">
												<a href="#" onclick="suntaek_proc('mall_view','','${dto.no}');">이미지X</a>
											</c:when>
											<c:otherwise>
												<c:if test="${dto.product_img != '-,-,-'}">
													<c:set var="temp1" value="${fn:split(dto.product_img,',')[0]}"></c:set>
													<c:set var="temp2" value="${fn:split(temp1,'|')[0]}"></c:set>
													<c:set var="temp3" value="${fn:split(temp1,'|')[1]}"></c:set>
													<a href="#" onclick="suntaek_proc('mall_view','','${dto.no}');">
														<img src="${path}/attach/product_img/${temp3}" alt="${dto.name}" title="${dto.name}" style="width:130px; height:150px; magin:0px 0px;">
													</a>
												</c:if>
											</c:otherwise>
										</c:choose>
									</td>
								</tr>
								<tr>
									<td align="center">${dto.name}</td>
								</tr>
								<tr>
									<td align="center"><fmt:formatNumber type="number" maxFractionDigits="3" value="${dto.price}" />원</td>
								</tr>	
							</table>
						</td>
						<c:if test="${k mod cell_counter == 0 }">
							</tr>
						</c:if>
						<c:set var="number" value="${number = number -1 }" />
					</c:forEach>
			
					<c:if test="${imsi_counter < cell_counter }">
						<c:forEach var="i" begin="${imsi_counter +1 }" end="${cell_counter }" step="1">
						<td >&nbsp;</td>
						</c:forEach>
					</c:if>
				</table>
			</td>
		</tr>
		<tr>
			<td colspan="10" height="50" align="center">
				<button type="button" onclick="suntaek_proc('mall_list_all','1','');" style="float:left">전체목록</button>
				<button type="button" onclick="suntaek_proc('cart_list2','1','');" style="float:left">장바구니</button>
				<c:if test="${totalRecord >=0 }">
					<a href="#" onclick="suntaek_proc('mall_list','1','');">[첫페이지]</a>&nbsp;&nbsp;
					<c:if test="${startPage > blockSize }">
						<a href="#" onclick="suntaek_proc'mall_list','${startPage -blockSize}','');">[이전 10개]</a>
					</c:if>
					<c:if test="${startPage <=blockSize }"> [이전10개] </c:if>&nbsp;&nbsp;
					<c:forEach var="i" begin="${startPage}" end="${lastPage}" step="1">
					<c:if test="${i == pageNumber}"> [${i}]</c:if>
					<c:if test="${i != pageNumber}">
						<a href="#" onclick="suntaek_proc('mall_list','${i}','');">${i}</a>
					</c:if>
					</c:forEach>&nbsp;&nbsp;
					<c:if test="${lastPage < totalPage }">
						<a href="#" onclick="suntaek_proc('mall_list','${startPage + blockSize}','');">[다음 10개]</a>
					</c:if>
					<c:if test="${lastPage >= totalPage }"> [다음10개] </c:if>&nbsp;&nbsp;
					<a href="#" onclick="suntaek_proc('mall_list','${totalPage}','');">[끝페이지]</a> 
				</c:if>
			</td>
		</tr>
		</c:if>
	</table>
<script>
function search2(){
	if(confirm('검색 하시겠습니까?')){
		$("#span_search_option").text($("#search_option").val())
		$("#span_search_data").text($("#search_data").val())	
		suntaek_proc('mall_list','1','');
	}
}
</script>
</body>
</html>