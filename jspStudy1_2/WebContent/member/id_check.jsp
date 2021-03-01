<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/inc_header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<form name="DirForm">
		<table border="1" align="center" width="550">
		<tr>
			<td colspan="2">
				<h2>아이디검색</h2>
			</td>
		</tr>
			<tr>
				<td width="100" >아이디</td>
				<td>
					<input type="text" id="use_id" name="id" value="${Id}"><br>
					<c:if test="${result == 0 }">
					<input type="hidden" name="result" value="1">
					사용 할 수 있는 아이디 입니다.
					</c:if>
					<c:if test="${result > 0 }">
					사용 할 수 없는 아이디 입니다.
					</c:if>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center" style="height:50px;">
					<button type="button" onclick="search();">검색</button>
					<button type="button" onclick="save();">적용</button>
				</td>
			</tr>
		</table>
	</form>
<script>
	function search(){
		var id = $("#id").val();
		if(id == ''){
			$("#label_id").html('아이디를 입력하세요.');
			$("#label_id").css('color','blue');
			$("#label_id").css('font-size','8px');
			return;
		}
		var a = "${path}/member_servlet/id_check_win_open_proc.do";
		DirForm.method="post";
		DirForm.action=a;
		DirForm.submit();
		
// 		var param ="id="+id;
// 		$.ajax({
// 			type:"post",
// 			data: param,
// 			url: "${path}/member_servlet/id_check_open_Proc.do",
// 			success: function(result){
// 				if(result>0){
// 					$("#id").val('');
// 					$("#label_id").html('사용할 수 없는 아이디입니다.');
// 					$("#label_id").css('color','red');
// 					$("#label_id").css('font-size','8px');
					
// 				}else{
// 					$("#label_id").html('사용할 수 있는 아이디입니다');
// 					$("#label_id").css('color','blue');
// 					$("#label_id").css('font-size','8px');
// 				}
// 			}
// 		});

	}
	function save(){
		if(document.DirForm.result.value == "1"){
			var id = document.getElementById("use_id").value;
			
			opener.document.getElementById("id").value =id;
			window.close();
		}else {
			alert('아이디를 확인 해주세요.');
		}
	}
</script>	
</body>
</html>