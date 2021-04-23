<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../../include/inc_header.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script> <!-- 필요함 -->
<script>
//$(선택자).이벤트함수(코드)
//$(document.ready(function(){
$(function(){ //페이지가 로딩되면 자동으로 실행되는 함수..
	$("#btnLogin").click(function(){ //id가 btnLogin인 버튼을 누르면
		var id = $("#id").val(); //태그에 입력한 값..
		var name = $("#name").val();
		var email = $("#email").val();
		param = {"id":id, "name":name, "email":email}; //자바스크립트 객체형식으로..
		$.ajax({ //비동기식 호출
			type: "post",
			data: param,
			url: "test09Proc.do",
			success: function(result){ //콜백함수
				console.log("result:" + result);
				$("#result").html("id: " + result.name + ", name: " + result.name + ", email: " + result.email);
			}
		});
	});
});
</script>

</head>
<body>

<%@ include file="../../include/inc_menu.jsp" %>

${path }<br>
<h2>test09.do / exam01.jsp</h2>

<h2>로그인</h2>
id : <input type="text" name="id" id="id"><br>
name : <input type="text" name="name" id="name"><br>
email : <input type="text" name="email" id="email"><br>
<input type="button" id="btnLogin" value="로그인">

<div id="result"></div>	

</body>
</html>