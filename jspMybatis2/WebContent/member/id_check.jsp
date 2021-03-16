<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/inc_header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	
	<form name="DirForm">
		<table border="1" align="center" width="80%">
		<tr>
			<td colspan="2">
				<h2>아이디검색</h2>
			</td>
		</tr>
			<tr>
				<td width="100" >아이디</td>
				<td>
					<input type="text" id="id" name="id" value="" style="width: 100px;">
					<span id="spanMsg"></span><br>					
					<input type="text" id="result" name="result" value="" style="width: 100px;">
					
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center" style="height:50px;">
					<button type="button" onclick="asdsa();">검색</button>
					<span id="spanView" style="display: none;">
						<button type="button" onclick="save2();">적용</button>
					</span>
				</td>
			</tr>
		</table>
	</form>
<script>
	function asdsa(){
// 		alert('aaaa');
		var id = $("#id").val();
		if(id == ''){
// 			$("#spanMsg").html('아이디를 입력하세요.');
// 			$("#spanMsg").css('color','blue');
// 			$("#spanMsg").css('font-size','8px');
// 			return;
			alert('아이디를 입력하세요.');
			$("#id").focus();
			return;
		}
		$.ajax({
			type: "post",
			data: $('form').serialize(),
			url: "${path}/member_servlet/id_check_win_open_proc.do",
			success: function(data){
				$("#id").val(id);
				$("#result").val(data);
								
				if($("#result").val().length == 0){
					$("#spanMsg").html('사용할 수 없는 아이디입니다.');
					$("#spanMsg").css('color','red');
					$("#spanMsg").css('font-size','8px');
					$("#spanView").show();
				}else{
					$("#spanMsg").html('사용할 수 있는 아이디입니다');
					$("#spanMsg").css('color','blue');
					$("#spanMsg").css('font-size','8px');
					$("#spanView").show();
				}
			}
				
		});
	}


	function save2(){
		var id = $('#id').val();
		var result = $("#result").val();
		if(id == result && id.length >0 ){
			var id =document.getElementById("id").value;
			opener.document.getElementById("id").value=id;
			window.close();
		}else{
			alert('다시 검색해주세요.');
			$("#id").val('');
			$("#result").val('');
			$("#id").focus();
		}
	}
</script>	
</body>
</html>