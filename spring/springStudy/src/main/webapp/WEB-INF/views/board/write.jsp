<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/inc_header.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
</head>
<body>
	<h2>게시글 쓰기</h2>
	<form name="writeForm" action="">
		<table border="1" width ="800" align="center">
			<tr>
				<td>작성자:</td>
				<td><input type="text" name="writer" id ="writer" value="${cookName}" style="width:40%;" ></td>
			</tr>
			<tr>
				<td>비밀번호:</td>
				<td><input type="password" name="passwd" id ="passwd" value="" style="width:40%;" ></td>
			</tr>
			<tr>
				<td>이메일:</td>
				<td><input type="text" name="email" id ="email" value="" style="width:50%;"></td>
			</tr>
			<tr>
				<td>제목:</td>
				<td><input type="text" name="subject" id ="subject" value="" style="width:70%;"></td>
			</tr>
			<tr>
				<td>내용:</td>
				<td><textarea name="content" id ="content" style="width:98%; height:100px;" ></textarea></td>
			</tr>
			<tr>
				<td>공지글</td>
				<td>
					<input type="hidden" name="noticeGubun" id ="noticeGubun" value="" style="width:10%;">
					<input type="checkbox" name="noticeGubunCheckBox" id="noticeGubunCheckBox" value="T" onclick="clickChk('noticeGubun');">공지글체크
				</td>
			</tr>
			<tr>
				<td>비밀글</td>
				<td>
					<input type="hidden" name="secretGubun" id ="secretGubun" value="" style="width:10%;">
					<input type="checkbox" name="secretGubunCheckBox" id="secretGubunCheckBox" value="T" onclick="clickChk('secretGubun');">비밀글체크	
				</td>
			</tr>
			<tr>
				<td colspan="3">
					<button type="button" id="btnchuga">저장하기</button>
					<button type="button" onclick="suntaek_proc('list','1','');">취소</button>
				</td>						
			</tr>
		</table>
	</form>
<script>
$(document).ready(function(){
	$("#writer").focus();
	
	$("#btnchuga").click(function(){
		if(document.writeForm.writer.value.trim() ==""){
			alert("작성자를 입력하세요.");
			document.writeForm.writer.select();
			document.writeForm.writer.focus();
			return false;
		}else if(document.writeForm.subject.value.trim() ==""){
			alert("제목을 입력하세요.");
			document.writeForm.subject.select();
			document.writeForm.subject.focus();
			return false;
		}else if(document.writeForm.content.value.trim() ==""){
			alert("내용을 입력하세요.");
			document.writeForm.content.select();
			document.writeForm.content.focus();
			return false;	
		}else if(confirm('등록하시겠습니까?')){
			suntaek_proc('writeProc','','');
		}
	});
});

function clickChk(value1){
	if(value1 == 'noticeGubun'){
		if($("input:checkbox[id=noticeGubunCheckBox]").is(":checked")==true){
			$("#noticeGubun").val("T"); 
		}else{
			$("#noticeGubun").val(""); 
		}
	}else if(value1 == 'secretGubun'){
		if($("input:checkbox[id=secretGubunCheckBox]").is(":checked")==true){
			$("#secretGubun").val("T"); 
		}else{
			$("#secretGubun").val(""); 
		}
	}
}

// $(document).ready(function(){
// 	var content = $("#content").text().replace(/(?:\r\n|\r|\n)/g,"<br>");
// 	$("#content").html(content);
// });
</script>
</body>
</html>