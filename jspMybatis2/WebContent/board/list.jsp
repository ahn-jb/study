<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/inc_header.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
</head>
<body>
	<table border="0" width="80%">
	<tr>
		<td colspan="20">
			<h2 align="center">게시판</h2>
			(총 레코드 수:${totalRecord})
		</td>
	</tr>
	<tr>
		<td>
			<table border="1" width="100%">
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
						<td>조회수</td>
<!-- 						<td>ip</td> -->
<!-- 						<td>회원번호</td> -->
<!-- 						<td>공지</td> -->
<!-- 						<td>비밀글</td> -->
<!-- 						<td>자식글여부</td> -->
<!-- 						<td>RefNo</td> -->
<!-- 						<td>stepNo</td> -->
<!-- 						<td>levelNo</td> -->
<!-- 						<td>P_No</td> -->
					</tr>
					<c:if test="${totalRecord > 0 }">
						<c:forEach var="dto" items="${list}">
							<tr>
								<td>${dto.getNum()}</td>
								<td width="650">
									<c:set var ="Re" value="┗ Re :"></c:set>
									<c:set var="jm" value="　"></c:set>
									<c:if test="${dto.stepNo >= 2 }">
										<c:if test="${dto.stepNo >= 3 }">
											<c:forEach  begin="2" end="${dto.stepNo}" step="1">
												${jm}
											</c:forEach>
										</c:if>
										${Re}
									</c:if>
									<a href="#" onclick="suntaek_proc('view','','${dto.getNo()}');" >${dto.getSubject()}</a>
									<c:if test="${dto.secretGubun == 'T'}">(🔒)</c:if>
									(${dto.comment_counter})
								</td>
								<td align="center">${dto.getWriter()}</td>
								<td align="center">${dto.getRegiDate()}</td>
								<td align="center">${dto.getHit()}</td>
<%-- 								<td>${ip}</td> --%>
<%-- 								<td>${dto.getMemberNo()}</td> --%>
<%-- 								<td>${dto.getNoticeNo()}</td> --%>
<%-- 								<td>${dto.getSecretGubun()}</td> --%>
<%-- 								<td>${dto.getChild_counter()}</td> --%>
<%-- 								<td>${dto.getRefNo()}</td> --%>
<%-- 								<td>${dto.getStepNo()}</td> --%>
<%-- 								<td>${dto.getLevelNo()}</td> --%>
<%-- 								<td>${dto.getP_no()}</td> --%>
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
							<button type = "button" onclick="suntaek_proc('resetList','1');">전체글</button>&nbsp;&nbsp;
							<button type = "button" id="btnWrite">글쓰기</button>&nbsp;&nbsp;&nbsp;
							
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
							<button type="button" onclick="search();">검색</button>&nbsp;&nbsp;&nbsp; 	
							
							<a href="#" onclick="suntaek_proc('list','1','');">[첫페이지]</a>&nbsp;&nbsp;
							<c:if test="${startPage > blockSize }">
								<a href="#" onclick="suntaek_proc('list','${lastPage -blockSize}','');">[이전 10개]</a>
							</c:if>
							<c:if test="${startPage <=blockSize }"> [이전10개] </c:if>&nbsp;&nbsp;
							<c:forEach var="i" begin="${startPage}" end="${lastPage}" step="1">
							<c:if test="${i == pageNumber}"> [${i}]</c:if>
							<c:if test="${i != pageNumber}">
								<a href="#" onclick="suntaek_proc('list','${i}','')">${i}</a>
							</c:if>
							</c:forEach>&nbsp;&nbsp;
							<c:if test="${lastPage < totalPage }">
								<a href="#" onclick="suntaek_proc('list','${startPage + blockSize}','');">[다음 10개]</a>
							</c:if>
							<c:if test="${lastPage >= totalPage }"> [다음10개] </c:if>&nbsp;&nbsp;
							<a href="#" onclick="suntaek_proc('list','${totalPage}','');">[끝페이지]</a> 						
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
<script>
$("#pageSize").change(function(){
	
	var totalRecord = ${totalRecord};
	var pageSize = $("#pageSize").val();
	var pageNumber = $("#span_pageNumber").text();
	if(pageNumber =="" || pageNumber == null){
		pageNumber = 1;
	}
	if(totalRecord - pageNumber*pageSize <0){
		var imsi = totalRecord/pageSize + (totalRecord%pageSize == 0 ? 0:1);
	
		pageNumber = Math.floor(imsi);
		$("#span_pageNumber").text(pageNumber);
	}
	$("#span_pageSize").text($("#pageSize").val());
	
	var result = document.getElementById("result");
	
	if(pageSize ==10){
		result.style.height = "500px";
	}else if(pageSize == 20){
		result.style.height = "800px";
	}else if(pageSize == 30){
		result.style.height = "1000px";
	}
	suntaek_proc('list','1','');
	
});

$("#btnWrite").click(function(){
	suntaek_proc('write','1','');
});

function search(value1,value2){
	$("#span_search_option").text($("#search_option").val());
	$("#span_search_data").text($("#search_data").val());
	suntaek_proc('list','1','');
}

</script>
</body>
</html>