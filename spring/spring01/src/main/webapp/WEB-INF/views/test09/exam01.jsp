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
	name : <input type="text" name="name" id="name" value=""><br>
	email : <input type="text" name="email" id="email" value=""><br>
	<input type="button" onclick="go2();" value="로그인">
	
	<div id="result"></div>
	
<script type="text/javascript">
	function go2(){
		var param = {
				"id" : $("#id").val(),
				"name" : $("#name").val(),
				"email" : $("#email").val()
		}
		
		$.ajax({
			type : "post",
			data : param,
			url  : "${path}/test09Proc.do",
			success: function(data){
				$("#result").html("id: " +data.id + ", name: " + data.name +", email: "+data.email);
			}
		});
	}
</script>
</body>
</html>