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
	<form name="sujeongForm" action="">
		<input type="hidden" name="no" id ="no" value="${dto.getNo()}" style="width:40%;" >
		<table border="1" width ="800" align="center">
			<tr>
				<td>작성자:</td>
				<td><input type="text" name="writer" id ="writer" value="${dto.getWriter()}" style="width:40%;" ></td>
			</tr>
			<tr>
				<td>비밀번호:</td>
				<td><input type="password" name="passwd" id ="passwd" value="${dto.getPasswd()}" style="width:40%;" ></td>
			</tr>
			<tr>
				<td>이메일:</td>
				<td><input type="text" name="email" id ="email" value="${dto.getEmail()}" style="width:50%;" ></td>
			</tr>
			<tr>
				<td>제목:</td>
				<td><input type="text" name="subject" id ="subject" value="${dto.getSubject()}" style="width:70%;"></td>
			</tr>
			<tr>
				<td>내용:</td>
				<td><textarea name="content" id ="content" style="width:98%; height:100px;" >${dto.getContent()}</textarea></td>
			</tr>
			<tr>
				<td>공지글</td>
				<td>
					<input type="text" name="noticeGubun" id ="noticeGubun" value="" style="width:10%;">
					<input type="checkbox" name="noticeGubunCheckBox" id="noticeGubunCheckBox" value="" onclick="clickChk('noticeGubun');">공지글체크
				</td>
			</tr>
			<tr>
				<td>비밀글</td>
				<td>
					<input type="text" name="secretGubun" id ="secretGubun" value="" style="width:10%;">
					<input type="checkbox" name="secretGubunCheckBox" id="secretGubunCheckBox" value="" onclick="clickChk('secretGubun');">비밀글체크	
				</td>
			</tr>
			<tr>
				<td colspan="3">
					<button type="button" id="btnSujeong">저장하기</button>
<!-- 					<button type="button" id="btnList">목록</button> -->
					<button type="button" onclick="GoPage('list','')">취소</button>
				</td>						
			</tr>
		</table>
	</form>
<script>
$(document).ready(function(){
	$("#subject").select();
	$("#subject").focus();
	
	$("#btnSujeong").click(function(){
		
		if(document.sujeongForm.writer.value.trim() ==""){
			alert("작성자를 입력하세요.")
			document.sujeongForm.writer.select();
			document.sujeongForm.writer.focus();
			return false;
		}else if(document.sujeongForm.subject.value.trim() ==""){
			alert("제목을 입력하세요.")
			document.sujeongForm.subject.select();
			document.sujeongForm.subject.focus();
			return false;
		}else if(document.sujeongForm.content.value.trim() ==""){
			alert("내용을 입력하세요.")
			document.sujeongForm.content.select();
			document.sujeongForm.content.focus();
			return false;	
		}else if(confirm('수정하시겠습니까?')){
			sujeongForm.method="post";
			sujeongForm.action="${path}/board2_servlet/sujeongProc.do?tbl=${tbl}";
			sujeongForm.submit();
		}

	});
});

$("#btnList").click(function(){
	location.href="${path}/board2_servlet/list.do?tbl=${tbl}";
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
function GoPage(value1,value2){
	if(value1 == 'list'){
		location.href="${path}/board2_servlet/list.do?tbl=${tbl}";
	}	
}
</script>
</body>
</html>