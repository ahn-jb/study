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
	<table>
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
					<input type="button" value="검색" onclick="search();"><br>
					전체 ${totalRecord}건입니다.
				</form>
			</td>
		</tr>
		<tr>
			<td>
				<table border="1" width="1000">
					<c:forEach var="dto" items="${list}" begin="0" end="${fn:length(list)}" step="1" varStatus="i">
						<c:if test="${i.index%3 == 0}">
						<tr>
							<td align="center">
								<table border="1" >
									<tr>
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
										<td>${dto.name}</td>
									</tr>
									<tr>
										<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${dto.price}" /></td>
									</tr>
								</table>
							</td>
							</c:if>
						<c:if test="${i.index%3 == 1}">
							<td align="center">
								<table border="1">
									<tr>
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
										<td>${dto.name}</td>
									</tr>
									<tr>
										<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${dto.price}" /></td>
									</tr>
								</table>
							</td>
							</c:if>
						<c:if test="${i.index%3 == 2 }">
								<td align="center">
									<table border="1">
										<tr>
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
											<td>${dto.name}</td>
										</tr>
										<tr>
											<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${dto.price}" /></td>
										</tr>
									</table>
								</td>
							</tr>
						</c:if>
					</c:forEach>
				</table>
			</td>
		</tr>
	</table>
</body>
</html>