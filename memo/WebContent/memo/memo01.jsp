<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>

<script>
$(document).ready(function(){
	$("#btnSave").click(function(){
		insert();
	});
});
function insert(){
	alert("aaaa");
	
	var writer = $("#writer").val();
	var memo = $('#memo').val();
	var param = "weiter= "+ writer + "&memo" + memo;
	
	$.ajax({
			type:"post",
			data:param,
			url:"처리페이지",
			success: function(){
				list();
				$("#writer").val("");
				$("#memo").val("");
			}
	})
}
</script>


</head>
<body>




<h2>메모장</h2>
이름:<input type="text" id="writer" size="10"><br>
메모:<input type="text" id="memo" size ="40">
	<input type="button" id="btnSave" value="확인">

</body>
</html>
