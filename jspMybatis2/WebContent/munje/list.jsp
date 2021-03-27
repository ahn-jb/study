<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/inc_header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="0" width="70%">
		<tr>
			<td colspan="20">
				<h2>시험 리스트</h2>
			</td>
		</tr>
		<tr>
			<td colspan="7">
				<select name="search_option" id="search_option">
					<option value="" selected>-선택-</option>
					<option value="testName">시험명</option>
				</select>
				<input type="text" name="search_data" id="search_data" value="${search_data}" style="width:: 150px;">&nbsp;
				<input type="button" value="검색" onclick="search();">	
			</td>
		</tr>
		<tr>
			<td>
				<table border="1" width="100%">
					<tr>
						<td>순번</td>						
						<td>시험명</td>						
						<td>타입</td>						
						<td>기간</td>							
						<td>등록일</td>							
					</tr>
					<c:forEach var="dto" items="${list}">
					<tr>
						<td>${dto.no}</td>
						<td width="200"><a href="#" onclick="suntaek_proc('view','','${dto.no}');">${dto.testName}</a></td>
						<td>${dto.testType}</td>
						<td align="center">${dto.start_date} ~ ${dto.last_date}</td>
						<td>${dto.regi_date}</td>
					</tr>
					</c:forEach>
					<c:if test="${list.size() == 0}">
						<tr>
							<td colspan="10" align="center"><h3>목록이 없습니다.</h3></td>
						</tr>
					</c:if>
				</table>
			</td>
		</tr>
		<c:if test="${totalRecord > 0 }">
			<tr>
				<td colspan="7" height="50" align="center">
					<a href="#" onclick="sunteak_proc('list','1','');">[첫페이지]</a>&nbsp;&nbsp;
					<c:if test="${startPage > blockSize }">
						<a href="#" onclick="sunteak_proc('list','${startPage -blockSize}','');">[이전 10개]</a>
					</c:if>
					<c:if test="${startPage <=blockSize }"> [이전10개] </c:if>&nbsp;&nbsp;
					<c:forEach var="i" begin="${startPage}" end="${lastPage}" step="1">
					<c:if test="${i == pageNumber}"> [${i}]</c:if>
					<c:if test="${i != pageNumber}">
						<a href="#" onclick="sunteak_proc('list','${i}','');">${i}</a>
					</c:if>
					</c:forEach>&nbsp;&nbsp;
					<c:if test="${lastPage < totalPage }">
						<a href="#" onclick="sunteak_proc('list','${startPage + blockSize}','');">[다음 10개]</a>
					</c:if>
					<c:if test="${lastPage >= totalPage }"> [다음10개] </c:if>&nbsp;&nbsp;
					<a href="#" onclick="sunteak_proc('list','${totalPage}','');">[끝페이지]</a> 
				</td>
			</tr>
		</c:if>	
		<tr>
			<td colspan="20" align="right">
				<button type="button" onclick="suntaek_proc('sihum_chuga','','')">시험추가</button>
				<button type="button" onclick="suntaek_proc('munje_chuga','','')">문제추가</button>
				<button type="button" onclick="suntaek_proc('resetList','','')">전체목록</button>
			</td>
		</tr>
	</table>
<script>
function search(){
	$("#span_search_option").text($("#search_option").val());
	$("#span_search_data").text($("#search_data").val());
	suntaek_proc('list','1','');
}
</script>
</body>
</html>