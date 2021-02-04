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
	<table border="0" width="100%">
	<tr>
		<td>
			<form name="searchForm">
				<h2 align="center">게시판</h2>
				(총 레코드 수:${totalRecord})
				<table border="1" width="100%" align="left">
				<tr>
					<td colspan ="9" align="right" >PageSize-
						<select name="pageSize" style="width:60px" onchange="location.href=this.value">				
							<option value="">[${pageSize}]</option> 
							<option value="${path}/board_servlet/list.do?pageSize=20&pageNumber=${pageNumber}&search=${search}&bunryu=${bunryu}">20</option>
							<option value="${path}/board_servlet/list.do?pageSize=30&pageNumber=${pageNumber}&search=${search}&bunryu=${bunryu}">30</option>
							<option value="${path}/board_servlet/list.do?pageSize=50&pageNumber=${pageNumber}&search=${search}&bunryu=${bunryu}">50</option>
						</select>
					</td>
				</tr>
					<tr align ="center">
						<td>글번호</td>
						<td>제목</td>
						<td>작성자</td>
						<td>등록일</td>
						<td>조회수</td>
						<td>RefNo</td>
						<td>stepNo</td>
						<td>levelNo</td>
						<td>P_No</td>
					</tr>
					<c:if test="${totalRecord > 0 }">
						<c:forEach var="dto" items="${list}">
							<c:if test="${dto.service > 0 }">
							<%  String Re="";%>
								<c:if test="${dto.stepNo >= 2 }">
									<c:forEach  begin="2" end="${dto.stepNo}" step="1">
										<% Re += "&nbsp;&nbsp;&nbsp;";%>
									</c:forEach>
									<%Re= Re+"┗ Re :"; %>
								</c:if>
					<tr>
						<td>${dto.getNum()}</td>
						<td width="650">
							<%=Re %><a href="#" onclick="view('${dto.getNo()}','${bunryu}','${search}');" >${dto.getSubject()}</a>
						</td>
						<td align="center">${dto.getWriter()}</td>
						<td align="center">${dto.getRegiDate()}</td>
						<td align="center">${dto.getHit()}</td>
						<td>${dto.getRefNo()}</td>
						<td>${dto.getStepNo()}</td>
						<td>${dto.getLevelNo()}</td>
						<td>${dto.getP_no()}</td>
					</tr>
							</c:if>
						</c:forEach>
					</c:if>
					<c:if test="${totalRecord == 0 }">
						<tr height="300" align="center">
							<td colspan="9" align="center">게시글이 존재하지 않음.</td>
						</tr>
					</c:if>
					<tr>
						<td colspan="9" align="leff">
							<button type = "button" onclick="location.href='${path}/board_servlet/list.do?pageSize=${pageSize}';">전체글</button>&nbsp;&nbsp;
							<button type = "button" onclick="location.href='${path}/board_servlet/write.do';">글쓰기</button>&nbsp;&nbsp;&nbsp;
							
							<select name="bunryu">
								<option value="total">제목+내용</option>
								<option value="subject">제목</option>
								<option value="content">내용</option>
								<option value="writer">작성자</option>
							</select>
							<input type="text" name="search" style="width:400px" value="">
							<button type="button" onclick="go2();">검색</button>&nbsp;&nbsp;&nbsp; 	
							
							<a href="#" onclick="go('board_list','1');">[첫페이지]</a>&nbsp;&nbsp;
							<c:if test="${startPage > blockSize }">
								<a href="#" onclick="go('board_list','${lastPage -blockSize}','');">[이전 10개]</a>
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
		</td>
	</tr>
</table>
<script>
	function go(value1,value2){
		if(value1 =="board_write"){
			location.href="${path}/board_servlet/write.do";
		}else if(value1 =='board_list'){
			location.href="${path}/board_servlet/list.do?pageSize=${pageSize}&pageNumber="+value2+"&bunryu=${bunryu}&search=${search}";
		}
	}
	function go2(){
		searchForm.method="post";
		searchForm.action="${path}/board_servlet/list.do";
		searchForm.submit();
	}
	function view(value1,value2,value3){
		location.href="${path}/board_servlet/view.do?no="+value1+"&bunryu="+value2+"&search="+value3;
	}
</script>
</body>
</html>