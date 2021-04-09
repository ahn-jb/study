<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/inc_menu.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h2>로그인</h2>
	id : <input type="text" name="id" id="id" value=""><br>
	pw : <input type="text" name="pw" id="pw" value=""><br>
	<input type="button" onclick="go();" value="로그인">
	
	<div id="result"></div>
	
<script type="text/javascript">
	function go(){
		var param = {
				"id" : $("#id").val(),
				"pw" : $("#pw").val()
		}
		
		$.ajax({
			type : "post",
			data : param,
			url  : "${path}/test08Proc.do",
			success: function(data){
				$("#result").html(data);
			}
		});
	}
</script>
</body>
</html>