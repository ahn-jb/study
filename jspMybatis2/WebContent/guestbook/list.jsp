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
		<button type="button" onclick="go('guestbook_list','','');">검색</button> 날짜검색 ex) 21/01/14  <br><br>
		<button type="button" onclick="go('guestbook_write','','');">글쓰기</button>&nbsp;&nbsp;
	</form><br>
	'${count}'개의 글이 있습니다
	<c:if test="${list.size() > 0 }">
			<table border="1" width="1100">
				<c:forEach var="dto" items="${list}">
					<tr>
						<td width="150" align="center">이름</td>
						<td width="200" align="center">${dto.name}</td>
						<td align="center">날짜</td>
						<td align="center">${dto.regi_date}</td>
						<td width="100" rowspan="3" align="center">
							<button type="button" onclick="go('sujeong','',${dto.no});">수정</button>
							<button type="button" onclick="go('sakje','',${dto.no});">삭제</button>
						</td>
					</tr>
					<tr>
						<td align="center">이메일</td>
						<td colspan="3" >${dto.email}</td>
					</tr>
					<tr>
						<td colspan="4">${dto.content}</td>
					</tr>				
				</c:forEach>
				<tr>
					<td colspan="10" align="left">
						<button type="button" onclick="go('resetList','1','');">전체목록</button>
					</td>
				</tr>
			</table>
		<table>
			<c:if test="${totalRecord > 0 }">
			<tr>
				<td colspan="12" align="center"> 
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
	</c:if>
<script>
	function go(value1,value2,value3){
		if(value1 =="guestbook_write"){
			location.href="${path}/guestbook_servlet/write.do";
		}else if(value1 =='guestbook_list'){
			searchForm.method="post";
			searchForm.action="${path}/guestbook_servlet/list.do?pageNumber="+value2;
			searchForm.submit();		
		}else if(value1 == 'sujeong'){
			location.href="${path}/guestbook_servlet/sujeong.do?no="+value3;
		}else if(value1 == 'sakje'){
			location.href="${path}/guestbook_servlet/sakje.do?no="+value3;
		}else if(value1 == 'resetList'){
			location.href= "${path}/guestbook_servlet/list.do?pageNumber="+value2;
		}
	
}	
</script>
</body>
</html>