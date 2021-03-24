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

<span id="comment_no"></span><br>
<span id="qwer">${qwer}</span>
<span id="list_size" style="display:none;">${list_size}</span>
<table border="0"  align="center" width="90%">
	<c:forEach var="list" items="${list}">
	<c:set var="i" value="${i=i+1}" />
	<tr>
		<td style="padding:0 0 10 0;">
			${list.comment_writer}  (${list.regiDate})
			<button type="button" onclick="comment_D('${i}');" style="float:right;">삭제</button>&nbsp;
			<button type="button" onclick="comment_U('${list.comment_no}','${list.comment_writer}','${list.comment_content}');" style="float:right;">수정</button>
			<br>
			<br>
			${list.comment_content}
			<button type="button" id="comment_censle${i}" onclick="comment_censle('${i}');" style=" height:24px; float:right; display:none;">취소</button>
			<button type="button" id="comment_chk${i}" onclick="comment_sakje('${list.comment_no}');" style=" height:24px; float:right; display:none;">확인</button>
			<input type="hidden" name="pwchk" id="pwchk${i}" value="" style="width:70px; height:15px; float:right;" placeholder="비밀번호">
			<br>
			---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
		</td>

	</tr>
	</c:forEach>
	
		<tr>
			<td colspan="4" align="center"> 
				<a href="#" onclick="suntaek_proc2('comment_result','1','');">[첫페이지]</a>&nbsp;&nbsp;
				<c:if test="${startPage > blockSize }">
					<a href="#" onclick="suntaek_proc2('comment_result','${lastPage -blockSize}','');">[이전 10개]</a>
				</c:if>
				<c:if test="${startPage <=blockSize }"> [이전10개] </c:if>&nbsp;&nbsp;
				<c:forEach var="i" begin="${startPage}" end="${lastPage}" step="1">
				<c:if test="${i == pageNumber}"> [${i}]</c:if>
				<c:if test="${i != pageNumber}">
					<a href="#" onclick="suntaek_proc2('comment_result','${i}','')">${i}</a>
				</c:if>
				</c:forEach>&nbsp;&nbsp;
				<c:if test="${lastPage < totalPage }">
					<a href="#" onclick="suntaek_proc2('comment_result','${startPage + blockSize}','');">[다음 10개]</a>
				</c:if>
				<c:if test="${lastPage >= totalPage }"> [다음10개] </c:if>&nbsp;&nbsp;
				<a href="#" onclick="suntaek_proc2('comment_result','${totalPage}','');">[끝페이지]</a> 	
			</td>
		</tr>

</table>
<script type="text/javascript">
	function comment_D(value1){
		var pwchk = document.getElementById("pwchk"+value1);
		pwchk.type= "text";
		var check = document.getElementById("comment_chk"+value1);
		check.style.display = "";
		var cencle = document.getElementById("comment_censle"+value1);
		cencle.style.display = "";
	}
	function comment_censle(value1){
		var passwd = document.getElementById("pwchk"+value1);
		passwd.type= "hidden";
		var check = document.getElementById("comment_chk"+value1);
		check.style.display = "none";
		var cencle = document.getElementById("comment_censle"+value1);
		cencle.style.display = "none";
		$('#pwchk'+value1).val("");
	}
	
	function comment_sakje(value1){
		$('#comment_no').text(value1);
		suntaek_proc2('commentSakje','','');
		
	}
	
	
	
</script>
</body>
</html>