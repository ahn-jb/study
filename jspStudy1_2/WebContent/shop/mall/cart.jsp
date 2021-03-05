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
	<span id="span_cartDel" style="display:none;">${span_cartDel}</span><br>
	<span id="span_index" style="display:none;">${span_index}</span><br>
	<table border="0" align="center" width="1000">
		<tr>
			<td colspan="10">
				<h2>장바구니 목록 </h2><br>
			</td>
		</tr>
		<tr>
			<td>
				전체 ${totalRecord}건입니다.
			</td>
		</tr>
		<tr>
			<td>
				<table border="1" align="center" width="100%">
					<tr>	
						<td>
							<input type="checkbox" id="allCheck" value="" />
						</td>
						<td>상품사진</td>
						<td>상품명</td>
						<td>가격</td>
						<td>구매수량</td>
						<td>금액</td>
						<td>등록일</td>
					</tr>
					<c:if test="${totalRecord >0 }">
						<c:forEach var="dto" items="${Cart_list}">
						<tr>
							<td><input type="checkbox"  name="checking" id="checking" value="${dto.no}">&nbsp; ${dto.no}</td>
							<td>
								<c:choose>
									<c:when test="${dto.product_img == '-,-,-'}">
										<a href="#" onclick="suntaek_proc('mall_view','','${dto.productNo}');">이미지X</a>
									</c:when>
									<c:otherwise>
										<c:if test="${dto.product_img != '-,-,-'}">
											<c:set var="temp1" value="${fn:split(dto.product_img,',')[0]}"></c:set>
											<c:set var="temp2" value="${fn:split(temp1,'|')[0]}"></c:set>
											<c:set var="temp3" value="${fn:split(temp1,'|')[1]}"></c:set>
											<a href="#" onclick="suntaek_proc('mall_view','','${dto.productNo}');">
												<img src="${path}/attach/product_img/${temp3}" alt="${dto.product_name}" title="${dto.product_name}" style="width:130px; height:70px;">
											</a>
										</c:if>
									</c:otherwise>
								</c:choose>
							</td>
							<td>${dto.product_name }</td>
							<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${dto.product_price}" /></td>
							<td>${dto.amount }</td>
							<td>${dto.amount * dto.product_price}</td>
							<td>${dto.regi_date}</td>
						</tr>
						<c:set var="total_price" value="${total_price = total_price + (dto.amount * dto.product_price) }"></c:set>
						</c:forEach>
						<tr>
							<td colspan="10" align="center">
								<h4>합계금액 :<fmt:formatNumber type="number" maxFractionDigits="3" value="${total_price}" />원</h4> 
							</td>
						</tr>
					</c:if>
					<c:if test="${totalRecord ==0 }">
					<tr>
						<td colspan="10" align="center"><h3>장바구니가 비어있습니다.</h3></td>
					</tr>
					</c:if>
				</table>
				<button type="button" onclick="cartSakje();">장바구니 비우기</button>
				<button type="button" onclick="suntaek_proc('mall_list_all','1','');">쇼핑하기</button>
				<button type="button" onclick="suntaek_proc('cart_list2','1','');">장바구니</button>
				<button type="button" onclick="suntaek_proc('buy','1','');">주문하기</button>
			</td>
		</tr>
		<c:if test="${totalRecord >0 }">
		<c:set var="tempGubun" value="cart_list2"></c:set>
			<tr>
				<td colspan="10" height="50" align="center">
					<a href="#" onclick="suntaek_proc('${tempGubun}','1','');">[첫페이지]</a>&nbsp;&nbsp;
					<c:if test="${startPage > blockSize }">
						<a href="#" onclick="suntaek_proc('${tempGubun}','${startPage -blockSize}','');">[이전 10개]</a>
					</c:if>
					<c:if test="${startPage <=blockSize }"> [이전10개] </c:if>&nbsp;&nbsp;
					<c:forEach var="i" begin="${startPage}" end="${lastPage}" step="1">
					<c:if test="${i == pageNumber}"> [${i}]</c:if>
					<c:if test="${i != pageNumber}">
						<a href="#" onclick="suntaek_proc('${tempGubun}','${i}','');">${i}</a>
					</c:if>
					</c:forEach>&nbsp;&nbsp;
					<c:if test="${lastPage < totalPage }">
						<a href="#" onclick="suntaek_proc('${tempGubun}','${startPage + blockSize}','');">[다음 10개]</a>
					</c:if>
					<c:if test="${lastPage >= totalPage }"> [다음10개] </c:if>&nbsp;&nbsp;
					<a href="#" onclick="suntaek_proc('${tempGubun}','${totalPage}','');">[끝페이지]</a> 
				</td>
			</tr>
		</c:if>
	</table>
<script>
$(document).ready(function(){
	$("#allCheck").click(function(){
		if($("#allCheck").prop("checked")) {
			$("input[type=checkbox]").prop("checked",true);

		}else{
			$("input[type=checkbox]").prop("checked",false);

		}
	});
});

function cartSakje(){
	var obj="";
	$('input[name=checking]:checked').each(function(index){
// 		alert(index+' | '+$(this).val());
		if(index!=0){
			obj += ",";
		}
		
		obj +=$(this).val();
		
		alert(obj);
		$("#span_cartDel").text(obj);
		$("#span_index").text(index+1);
	});
	suntaek_proc('cart_sakje','','')
}
</script>
</body>
</html>