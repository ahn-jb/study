<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
 <% String path = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메모</title>

<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<!-- 페이지 로딩이 끝난 후 실행되는 함수 -->
<script>
$(document).ready(function(){
	list();
	$('#btnSave').click(function(){
		alert('등록합니다.');
		insert();
	});
});
function insert(){
	var writer = $("#writer").val();
	var content = $("#content").val();
	var param = "writer="+writer + "&content="+content;//쿼리스트링
	
	$.ajax({
		type:"post",
		data: param,
		url: "<%=path%>/memo_servlet/write.do",
		success: function(){//콜백함수
			list();
			$("#writer").val("");
			$("#content").val("");
		}
	});
// 	if(writer =='222'){
// 		alert('이름을 입력하세요..');
// 		$("#writer").select();
// 		$("#writer").focus();
// 	}
}
function list(){
	var param = "search_gubun=&sdata="
	$.ajax({
		type: "post",
		data: " ",
		url: "<%=path%>/memo_servlet/list.do",
		success: function(result){
			$("#result").html(result);
		}
	});
}
</script>
</head>
<body>
	
	<h2>메모장</h2>
	이름 : <input type="text" id="writer" size="10"><br>
	내용 : <input type="text" id = "content" size="40"><br>
	<input type="button" id="btnSave" value="확인">
	
<!-- 	결과가 출력되는 영역 -->
	<div id="result"></div>
</body>
</html>