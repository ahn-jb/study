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
	<span id="passwd_check" style="display :;">${dto.passwd}</span>
	<h2>게시글 쓰기</h2>
	<form name="writeForm" action="">
		<table border="1" width ="800" align="center">
			<tr>
				<td>작성자:</td>
				<td><input type="text" name="writer" id ="writer" value="${dto.writer}" style="width:40%;" ></td>
			</tr>
			<tr>
				<td>비밀번호:</td>
				<td><input type="password" name="passwd" id ="passwd" value="" style="width:40%;" ></td>
			</tr>
			<tr>
				<td>이메일:</td>
				<td><input type="text" name="email" id ="email" value="${dto.email}" style="width:50%;" ></td>
			</tr>
			<tr>
				<td>제목:</td>
				<td><input type="text" name="subject" id ="subject" value="${dto.subject}" style="width:70%;"></td>
			</tr>
			<tr>
				<td>내용:</td>
				<td><textarea name="content" id ="content" style="width:98%; height:100px;" >${dto.content}</textarea></td>
			</tr>
			<tr>
				<td>공지글</td>
				<td>
					<input type="text" name="noticeGubun" id ="noticeGubun" value="" style="width:10%;">
					<input type="checkbox" name="noticeGubunCheckBox" id="noticeGubunCheckBox" value="T" onclick="clickChk('noticeGubun');">공지글체크
				</td>
			</tr>
			<tr>
				<td>비밀글</td>
				<td>
					<input type="text" name="secretGubun" id ="secretGubun" value="" style="width:10%;">
					<input type="checkbox" name="secretGubunCheckBox" id="secretGubunCheckBox" value="T" onclick="clickChk('secretGubun');">비밀글체크	
				</td>
			</tr>
			<tr>
				<td colspan="3">
					<button type="button" id="btnSakje">삭제하기</button>
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
	
	$("#btnSakje").click(function(){
		if($("#passwd").val() != $("#passwd_check").text()){
			alert("비밀번호가 다릅니다.")
			document.writeForm.passwd.select();
			document.writeForm.passwd.focus();
			return false;
		}else if(confirm('삭제하시겠습니까?')){
			GoPage('sakjeProc','');
		}

	});
});

$("#btnList").click(function(){
	GoPage('list','');	
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

</script>
</body>
</html>