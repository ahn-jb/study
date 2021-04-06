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
	<span id="span_list_gubun" style="display:none;">${list_gubun}</span>
	<table border="0" align="center" width="80%" >
		<tr>
			<td colspan="7">
				<h2 id="all" style="display:none;">전체 설문조사 목록</h2>
				<h2 id="ing" style="display:none;">진행중인 설문조사 목록</h2>
				<h2 id="end" style="display:none;">종료된 설문조사 목록</h2>
			</td>
		</tr>
		<tr>
			<td colspan="7">
				<form name="search">
					<select name="search_option" id="search_option">
						<c:choose>
						<c:when test="${search_option == 'question'}">
							<option value="">-선택-</option>
							<option value="question" selected="selected">질문내용</option>
						</c:when>
						<c:otherwise>
							<option value="" selected="selected">-선택-</option>
							<option value="question">질문내용</option>
						</c:otherwise>
						</c:choose>
					</select>
					<input type="text" name="search_data" id="search_data" value="${search_data}" style="width:: 150px;">&nbsp;
					<input type="date" name="search_date_s" id="search_date_s" value="${search_date_s}" style="width:: 150px;"> ~
					<input type="date" name="search_date_e" id="search_date_e" value="${search_date_e}" style="width:: 150px;"><br>
					<c:choose>
						<c:when test="${search_date_check== 'O'}">
							<input type="checkbox" name="search_date_check" id="search_date_check" value="O" checked="checked">
						</c:when>
						<c:otherwise>
							<input type="checkbox" name="search_date_check" id="search_date_check" value="O" >
						</c:otherwise>
					</c:choose>
					<span style="color:blue; font-size:9px;">(날짜 검색시 체크)</span>&nbsp;
					<input type="button" value="검색" onclick="go1();">	
				</form>
			</td>
		</tr>
		<tr>
			<td style="padding: 10px 0px 5px;">전체 ${totalRecord}건입니다.</td>
		</tr>
		<tr>
			<td style="padding: 0 0 20px 0;">
				<table border="1" width="100%" >
					<tr>
						<th>순번</th>
						<th width="40%">질문</th>
						<th width="20%">기간</th>
						<th>참여수</th>
						<th>상태</th>
						<th width="20%">관리</th>
					</tr>
					<c:forEach var="dto" items="${list}">
					<tr>
						<td align="center">${number}</td>
						<td><a href="#" onclick="sunteak_view('${dto.no}');" style="text-decoration: none">${dto.question}</a></td>
						<td align="center">${dto.start_date}<br>${dto.last_date}</td>
						<td align="center">${dto.survey_count}</td>
						<td align="center">${dto.status}</td>
						<td align="center"> 
							<input type="button" onclick="sunteak_send('${dto.no}');"value="설문응답">&nbsp;&nbsp;
							<input type="button" onclick="sunteak_update('${dto.no}');" value="수정">&nbsp;&nbsp;
							<input type="button" onclick="sunteak_remove('${dto.no}');"value="삭제">
						</td>
					</tr>
					<c:set var="number" value="${number=number-1}"></c:set>
					</c:forEach>
					<c:if test="${list.size() == 0}">
					<tr>
						<td colspan="10" align="center"><h3>목록이 없습니다.</h3></td>
					</tr>
					</c:if>
				</table>
			</td>
		</tr>
		<tr>
			<td>
				<button type="button" onclick="sunteak_proc('resetList','1','');" style="float:right;">전체 설문목록</button>
				<button type="button" onclick="sunteak_proc('startList','1','');" style="float:right;">진행중인 설문목록</button>
				<button type="button" onclick="sunteak_proc('endList','1','');" style="float:right;">종료된 설문목록</button>
				<button type="button" onclick="sunteak_proc('chuga','','');" style="float:right;">등록하기</button>
			</td>
		</tr>
		<c:if test="${totalRecord > 0 }">
		<tr>
			<td colspan="7" height="50" align="center">
				<a href="#" onclick="uu('survey_list','1','');" style="text-decoration: none">[첫페이지]</a>&nbsp;&nbsp;
				<c:if test="${startPage > blockSize }">
					<a href="#" onclick="uu('survey_list','${startPage -blockSize}','');" style="text-decoration: none">[이전 10개]</a>
				</c:if>
				<c:if test="${startPage <=blockSize }"> [이전10개] </c:if>&nbsp;&nbsp;
				<c:forEach var="i" begin="${startPage}" end="${lastPage}" step="1">
				<c:if test="${i == pageNumber}"> [${i}]</c:if>
				<c:if test="${i != pageNumber}">
					<a href="#" onclick="uu('survey_list','${i}','');" style="text-decoration: none">${i}</a>
				</c:if>
				</c:forEach>&nbsp;&nbsp;
				<c:if test="${lastPage < totalPage }">
					<a href="#" onclick="uu('survey_list','${startPage + blockSize}','');" style="text-decoration: none">[다음 10개]</a>
				</c:if>
				<c:if test="${lastPage >= totalPage }"> [다음10개] </c:if>&nbsp;&nbsp;
				<a href="#" onclick="uu('survey_list','${totalPage}','');" style="text-decoration: none">[끝페이지]</a> 
			</td>
		</tr>
		</c:if>	
	</table>
<script>
	$(document).ready(function(){
		var gubun = $('#span_list_gubun').text();
		$('#'+gubun).css("display","");
	});
	function uu(value1,value2,value3){
		search.method="post";
		search.action="${path}/test_servlet/list.do?pageNumber="+value2;
		search.submit();
	}
	function go1(){
		if(search.search_date_check.value != "O"){
			$("#search_date_s").val("");
			$("#search_date_e").val("");
		}
		search.method="post";
		search.action="${path}/test_servlet/list.do";
		search.submit();
	}
	function chuga(){
		location.href="${path}/test_servlet/chuga.do"
	}
	function sunteak_update(value1){
		location.href="${path}/test_servlet/modify.do?no="+value1;
	}
	function sunteak_remove(value1){
		if(confirm('정말 삭제 하시겠습니까?')){
			location.href="${path}/test_servlet/delete.do?no="+value1;
		}
	}
	function sunteak_send(value1){
		location.href="${path}/test_servlet/send.do?no="+value1;
	}
	
	function sunteak_view(value1){
		location.href="${path}/test_servlet/view.do?no="+value1;
	}
	function list_2(){
		location.href="${path}/test_servlet/list_2.do";
	}
	 function suntaek_list(value1){
			search.method="post";
			search.action="${path}/test_servlet/list.do?list_gubun="+value1;
			search.submit();
		}
</script>
</body>
</html>