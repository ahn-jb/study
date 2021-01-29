<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/inc_header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록 리스트</title>
</head>
<body>
	<h2>방명록</h2><br><br>
	<form name="searchForm">
		<select name="bunryu">
			<option value="name">이름
			<option value="content">내용
			<option value="regi_date">날짜
		</select>
		<input type="text" name="search" style="width:350;">
		<button type="button" onclick="go('guestbook_list','','');">검색</button> 날짜검색 ex) 21/01/14 
	</form><br>
	'${count}'개의 글이 있습니다
	<c:if test="${list.size() > 0 }">
		<c:forEach var="dto" items="${list}">
			<table border="1" width="1000">
				<tr>
					<td>이름</td>
					<td>${dto.name}</td>
					<td>날짜</td>
					<td>${dto.regi_date}</td>
				</tr>
				<tr>
					<td>이메일</td>
					<td colspan="3">${dto.email}</td>
				</tr>
				<tr>
					<td colspan="4">${dto.content}</td>
				</tr>
			</table>
			<table>
				<c:if test="${totalRecord > 0 }">
				<tr>
					<td colspan="12" align="center"> 
						<button type="button" onclick="go('guestbook_write','','');">글쓰기</button>&nbsp;&nbsp;
						<a href="#" onclick="go('guestbook_list','1','');">[첫페이지]</a>&nbsp;&nbsp;
						<c:if test="${startPage > blockSize }">
							<a href="#" onclick="go('guestbook_list','${startPage -blockSize}','');">[이전 10개]</a>
						</c:if>
						<c:if test="${startPage <=blockSize }"> [이전10개] </c:if>&nbsp;&nbsp;
						<c:forEach var="i" begin="${startPage}" end="${lastPage}" step="1">
						<c:if test="${i == pageNumber}"> [${i}]</c:if>
						<c:if test="${i != pageNumber}">
							<a href="#" onclick="go('guestbook_list','${i}','')">${i}</a>
						</c:if>
						</c:forEach>&nbsp;&nbsp;
						<c:if test="${lastPage < totalPage }">
							<a href="#" onclick="go('guestbook_list','${startPage + blockSize}','');">[다음 10개]</a>
						</c:if>
						<c:if test="${lastPage >= totalPage }"> [다음10개] </c:if>&nbsp;&nbsp;
						<a href="#" onclick="go('guestbook_list','${totalPage}','');">[끝페이지]</a> 

					</td>
				</tr>
				</c:if>
			</table>
		</c:forEach>
	</c:if>
<script>
	function go(value1,value2,value3){
		if(value1 =="guestbook_write"){
			location.href="${path}/guestbook_servlet/write.do";
		}else if(value1 =='guestbook_list'){
			searchForm.method="post";
			searchForm.action="${path}/guestbook_servlet/list.do?pageNumber="+value2;
			searchForm.submit();
			
		}
}	
</script>
</body>
</html>