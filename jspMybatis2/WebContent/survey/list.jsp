<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/inc_header.jsp" %>

<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>

<table border="0" align="center" width="80%">
	<tr>
		<td colspan="7">
			<h2>설문조사 목록</h2>
		</td>
	</tr>
	<tr>
		<td colspan="7">
			<select name="search_option" id="search_option">
<%-- 			<c:choose> --%>
<%-- 				<c:when test="${search_option == 'question'}"> --%>
<!-- 					<option value="">-선택-</option> -->
<!-- 					<option value="question" selected="selected">질문내용</option> -->
<%-- 				</c:when> --%>
<%-- 			</c:choose> --%>
<%-- 			<c:otherwise> --%>
<!-- 				<option value="" selected="selected">-선택-</option> -->
<!-- 				<option value="question">질문내용</option> -->
<%-- 			</c:otherwise> --%>
				<option value="" selected>-선택-</option>
				<option value="question">질문내용</option>
			</select>
			<input type="text" name="search_data" id="search_data" value="${search_data}" style="width:: 150px;">&nbsp;
			<input type="date" name="search_date_s" id="search_date_s" value="${search_date_s}" style="width:: 150px;"> ~
			<input type="date" name="search_date_e" id="search_date_e" value="${search_date_e}" style="width:: 150px;"><br>
			<input type="checkbox" name="search_date_check" id="search_date_check" value="O">
			<span style="color:blue; font-size:9px;">(날짜 검색시 체크)</span>&nbsp;
			<input type="button" value="검색" onclick="search();">	
		</td>
	</tr>
	<tr>
		<td style="padding: 10px 0px 5px;">전체 ${totalRecord}건입니다.</td>
	</tr>
	<tr>
		<td style="padding: 0 0 20px 0;">
			<table border="1" width="100%">
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
					<td><a href="#" onclick="sunteak_proc('view','','${dto.no}');">${dto.question}</a></td>
					<td align="center">${dto.start_date}<br>${dto.last_date}</td>
					<td align="center">${dto.survey_count}</td>
					<td align="center">${dto.status}</td>
					<td align="center"> 
						<input type="button" onclick="sunteak_proc('send','','${dto.no}');"value="설문응답">&nbsp;&nbsp;
						<input type="button" onclick="sunteak_proc('modify','','${dto.no}');" value="수정">&nbsp;&nbsp;
						<input type="button" onclick="sunteak_proc('sakje','','${dto.no}');"value="삭제">
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
		<td colspan="7" height="50" align="right">
			<button type="button" onclick="sunteak_proc('resetList','1','');">전체 설문목록</button>
			<button type="button" onclick="sunteak_proc('startList','1','');">진행중인 설문목록</button>
			<button type="button" onclick="sunteak_proc('endList','1','');">종료된 설문목록</button>
			<button type="button" onclick="sunteak_proc('chuga','','');">등록하기</button>
<!-- 			<button type="button" onclick="sunteak_proc('munje','','');">문제풀이</button> -->
		</td>
	</tr>
</table>
<%-- ${list.size()} --%>
<script>
// 	$(function() {
// 	  $( "#search_date_s, #search_date_e" ).datepicker({
// 		 changeMonth: true, 
// 		 changeYear: true,
//    		 dateFormat: 'yy-mm-dd'
// 	  });
// 	});

	function search(){
		$("#span_search_option").text($("#search_option").val());
		$("#span_search_data").text($("#search_data").val());
		if($("input:checkbox[id=search_date_check]").is(":checked")==true){
			$("#span_search_date_check").text($("#search_date_check").val());
			$("#span_search_date_s").text($("#search_date_s").val());
			$("#span_search_date_e").text($("#search_date_e").val());
		}
		if($("input:checkbox[id=search_date_check]").is(":checked")==false){
			$("#span_search_date_check").text("");
// 			$("#span_search_date_s").text('');
// 			$("#span_search_date_e").text('');
		}
		sunteak_proc('list','','');
	}
	

	function list_2(){
		var param= {}
		$.ajax({
			type: "post",
			data: param,
			url: "${path}/survey_servlet/list_2.do",
			success : function(data){
				$("#result").html(data);
			}
		});
	}
</script>