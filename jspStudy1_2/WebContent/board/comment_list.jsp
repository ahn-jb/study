<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/inc_header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리스트</title>
</head>
<body>
<span id="list_size" style="display:none;">${list_size}</span>
<table border="0"  align="center" width="90%">
	<c:forEach var="list" items="${list}">
	<tr>
		<td style="padding:0 0 10 0;">
			${list.comment_writer}  (${list.regiDate})<br>
			${list.comment_content}<br>
			---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
		</td>

	</tr>
	</c:forEach>
		<tr>
			<td colspan="4" align="center"> 
				<a href="#" onclick="gogo('board_list','1');">[첫페이지]</a>&nbsp;&nbsp;
				<c:if test="${startPage > blockSize }">
					<a href="#" onclick="gogo('board_list','${lastPage -blockSize}','');">[이전 10개]</a>
				</c:if>
				<c:if test="${startPage <=blockSize }"> [이전10개] </c:if>&nbsp;&nbsp;
				<c:forEach var="i" begin="${startPage}" end="${lastPage}" step="1">
				<c:if test="${i == pageNumber}"> [${i}]</c:if>
				<c:if test="${i != pageNumber}">
					<a href="#" onclick="gogo('board_list','${i}')">${i}</a>
				</c:if>
				</c:forEach>&nbsp;&nbsp;
				<c:if test="${lastPage < totalPage }">
					<a href="#" onclick="gogo('board_list','${startPage + blockSize}');">[다음 10개]</a>
				</c:if>
				<c:if test="${lastPage >= totalPage }"> [다음10개] </c:if>&nbsp;&nbsp;
				<a href="#" onclick="gogo('board_list','${totalPage}');">[끝페이지]</a> 	
			</td>
		</tr>

</table>
<script type="text/javascript">
	function gogo(value1,value2){
		comment_list(value2);
	}


</script>
</body>
</html>