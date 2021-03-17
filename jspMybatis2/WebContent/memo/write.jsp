<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/inc_header.jsp" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메모</title>
</head>
<body>
	
	<span id="span_no" style="display:none;"></span>
	<form name="memoForm">
		<h2>메모장</h2>
		<span id="span_text"></span>
		<table width="400">
			<tr>
				<td>
					이름 : <input type="text" id="writer" size="20"><br> 
					내용 : <input type="text" id ="content" size="40"><br>
				</td>
			</tr>
			<tr>
				<td align="center">
					<br><input type="button"  id="btnSave" value="확인" >
				</td>
			</tr>
		</table>
	</form>
	<br>
<!-- 	결과가 출력되는 영역 -->
	<div id="result"></div>
<script>
$(document).ready(function(){
	list();
	$('#btnSave').click(function(){
		insert();
	});

});
function insert(){
	var no = $("#span_no").text();
	var writer = $("#writer").val();
	var content = $("#content").val();
	var url ="";
// 	alert("no: "+no);
	if(no == "" || no == null){
// 		alert("입력");
		param = {
			"writer" : 	$("#writer").val(),
			"content" : $("#content").val()
		}
		url= "${path}/memo_servlet/writeProc.do"
	}else{
		param = {
				"no" : $("#span_no").text(),
				"writer" : 	$("#writer").val(),
				"content" : $("#content").val()
			}
		url= "${path}/memo_servlet/sujeong.do"
	}
	
	$.ajax({
		type:"post",
		data: param,
		url: url,
		success: function(){//콜백함수
			list();
			$("#writer").val("");
			$("#content").val("");
			$("#span_no").text("");
			$("#span_text").text("");
		}
	});
}
function list(){
	var param = "search_gubun=&sdata="
	$.ajax({
		type: "post",
		data: " ",
		url: "${path}/memo_servlet/list.do?pageNumber=${pageNumber}",
		success: function(result){
			$("#result").html(result);
		}
	});
}
</script>
</body>
</html>