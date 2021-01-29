<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 정보 등록</title>
</head>
<body>
	
	<form name="studentForm">
	<table border="0">
	<tr>
		<td>학생아이디:</td> 
		<td><input type="text" name="sid"></td>
	</tr>
	<tr> 
		<td>학생이름:</td>
		<td><input type="text" name="sname"></td>
	</tr>
	<tr>	
		<td>학생전화번호:</td> 
		<td><input type="text" name="sphone"></td>
	</tr>	
	<tr>	
		<td>부모이름:</td> 
		<td><input type="text" name="pname"></td>
	</tr>
	<tr>	
		<td>부모전화번호:</td> 
		<td><input type="text" name="pphone"></td>
	</tr>
	<tr>	
		<td>주소:</td> 
		<td><input type="text" name="addr"></td>
	</tr>
	<tr>	
		<td>학년:</td> 
		<td><input type="text" name="hackyun"></td>
	</tr>	
		</table>
		<button onclick="save();">등록하기</button>
	</form>
	
</body>
</html>

<script >
function save(){
	if(document.studentForm.sid.value.trim() ==""){
		alert('학생 아이디를 입력하세요.')
		document.studentForm.sid.select();
		document.studentForm.sid.focus();
		return false;
	}else if(document.studentForm.sname.value.trim() ==""){
		alert('학생 이름을 입력하세요.')
		document.studentForm.sname.select();
		document.studentForm.sname.focus();
		return false;
	}else if(document.studentForm.sphone.value.trim() ==""){
		alert('학생 전화번호를 입력하세요.')
		document.studentForm.sphone.select();
		document.studentForm.sphone.focus();
		return false;
	}else if(document.studentForm.pname.value.trim() ==""){
		alert('부모님 이름을 입력하세요.')
		document.studentForm.pname.select();
		document.studentForm.pname.focus();
		return false;
	}else if(document.studentForm.pphone.value.trim() ==""){
		alert('부모님 전화번호를 입력하세요.')
		document.studentForm.pphone.select();
		document.studentForm.pphone.focus();
		return false;
	}else if(document.studentForm.addr.value.trim() ==""){
		alert('주소를 입력하세요.')
		document.studentForm.addr.select();
		document.studentForm.addr.focus();
		return false;
	}else if(document.studentForm.hackyun.value.trim() ==""){
		alert('학년을 입력하세요.')
		document.studentForm.hackyun.select();
		document.studentForm.hackyun.focus();
		return false;
	}else if(confirm('등록하시겠습니까?')){
		document.studentForm.method="post";
		document.studentForm.action="studentProc.jsp";
		document.studentForm.submit();
	}
}


</script>