<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/inc_header.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판[TEST]</title>
</head>
<body>
<table border="0" width="100%" align="center">
	<tr>
		<td>
			<form name="searchForm">
				<h2 align="center">게시판</h2>
				(총 레코드 수:${totalRecord})
				<table border="1" width="100%" align="co">
				<tr>
					<td colspan ="20" align="right" >PageSize-
						<select name="pageSize" id="pageSize" style="width:60px" > <%--페이지 사이즈 변경 --%>							
							<option value="">[${pageSize}]</option> 
							<option value="10">10</option>
							<option value="20">20</option>
							<option value="30">30</option>
						</select>
					</td>
				</tr>
					<tr align ="center">
						<td>글번호</td>
						<td>제목</td>
						<td>작성자</td>
						<td>등록일</td>
					</tr>
					<c:if test="${totalRecord > 0 }">
						<c:forEach var="dto" items="${list}">
						
					<tr>
						<td align="center">${dto.getNo()}</td>
						<td width="650" align="center">
							<a href="#" onclick="go('board_view','${dto.getNo()}');" >${dto.getSubject()}</a>
						</td>
						<td align="center">${dto.getWriter()}</td>
						<td align="center">${dto.getRegidate()}</td>
					</tr>
						</c:forEach>
					</c:if>
					<c:if test="${totalRecord == 0 }">
						<tr height="300" align="center">
							<td colspan="20" align="center">게시글이 존재하지 않음.</td>
						</tr>
					</c:if>
					<tr>
						<td colspan="20" align="left">
							<button type = "button" onclick="go('board_reset','1');">전체글</button>&nbsp;&nbsp;
							<button type = "button" onclick="go('board_write','');">글쓰기</button>&nbsp;&nbsp;&nbsp;
							
							<select name="search_option" id="search_option">
							<c:choose>
								<c:when test="${search_option=='writer'}">
									<option value="writer_subject_content">제목+내용+작성자</option>
									<option value="subject">제목</option>
									<option value="content">내용</option>
									<option value="writer" selected>작성자</option>
								</c:when>
								<c:when test="${search_option=='subject'}">
									<option value="writer_subject_content">제목+내용+작성자</option>
									<option value="subject" selected>제목</option>
									<option value="content">내용</option>
									<option value="writer" >작성자</option>
								</c:when>
								<c:when test="${search_option=='content'}">
									<option value="writer_subject_content">제목+내용+작성자</option>
									<option value="subject">제목</option>
									<option value="content" selected>내용</option>
									<option value="writer" >작성자</option>
								</c:when>
								<c:when test="${search_option=='writer_subject_content'}">
									<option value="writer_subject_content" selected>제목+내용+작성자</option>
									<option value="subject">제목</option>
									<option value="content">내용</option>
									<option value="writer" >작성자</option>
								</c:when>
								<c:otherwise>
									<option value="writer_subject_content">제목+내용+작성자</option>
									<option value="subject">제목</option>
									<option value="content">내용</option>
									<option value="writer" >작성자</option>
								</c:otherwise>	
							</c:choose>
							</select>
							<input type="text" name="search_data" id="search_data" style="width:400px" value="${search_data}">
							<button type="button" onclick="go('board_search','1');">검색</button>&nbsp;&nbsp;&nbsp; 	
							
							<a href="#" onclick="go('board_list','1');">[첫페이지]</a>&nbsp;&nbsp;
							<c:if test="${startPage > blockSize }">
								<a href="#" onclick="go('board_list','${lastPage -blockSize}');">[이전 10개]</a>
							</c:if>
							<c:if test="${startPage <=blockSize }"> [이전10개] </c:if>&nbsp;&nbsp;
							<c:forEach var="i" begin="${startPage}" end="${lastPage}" step="1">
							<c:if test="${i == pageNumber}"> [${i}]</c:if>
							<c:if test="${i != pageNumber}">
								<a href="#" onclick="go('board_list','${i}')">${i}</a>
							</c:if>
							</c:forEach>&nbsp;&nbsp;
							<c:if test="${lastPage < totalPage }">
								<a href="#" onclick="go('board_list','${startPage + blockSize}');">[다음 10개]</a>
							</c:if>
							<c:if test="${lastPage >= totalPage }"> [다음10개] </c:if>&nbsp;&nbsp;
							<a href="#" onclick="go('board_list','${totalPage}');">[끝페이지]</a> 						
						</td>
					</tr>
				</table>
			</form>
			<h2 align="center"> -${ip}-</h2>
		</td>
	</tr>
</table>
<script>
function go(value1,value2){
	if(value1 =="board_write"){
		location.href="${path}/board_servlet/write.do";
	}else if(value1 =='board_list'){
		location.href="${path}/board_servlet/list.do?pageSize=${pageSize}&pageNumber="+value2+"&search_option=${search_option}&search_data=${search_data}";
	}else if(value1 =='board_search'){
		searchForm.method="post";
		searchForm.action="${path}/board_servlet/list.do";
		searchForm.submit();
	}else if(value1 == 'board_view'){
		location.href="${path}/board_servlet/view.do?no="+value2+"&search_option=${search_option}&search_data=${search_data}";
	}else if(value1 == 'board_reset'){
		location.href="${path}/board_servlet/list.do";
	}
}
$("#pageSize").change(function(){
	
	var totalRecord = ${totalRecord};
	var pageSize = $("#pageSize").val();
	var pageNumber = ${pageNumber};
	if(pageNumber =="" || pageNumber == null){
		pageNumber = 1;
	}
	if(totalRecord - pageNumber*pageSize <0){
		var imsi = totalRecord/pageSize + (totalRecord%pageSize == 0 ? 0:1);
	
		pageNumber = Math.floor(imsi);
	}
	
	
	location.href="${path}/board_servlet/list.do?pageSize="+pageSize+"&pageNumber="+pageNumber+"&search_option=${search_option}&search_data=${search_data}";
	
});
</script>
</body>
</html>