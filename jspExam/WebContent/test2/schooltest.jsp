<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form name="testForm">
		<table>
			<tr>
				<td>학년:</td>
				<td>
					<select name="hackyun">					
					<option value="">선택</option>
					<option value=1>1학년</option>
					<option value=2>2학년</option>
					<option value=3>3학년</option>
					<option value=4>4학년</option>
					<option value=5>5학년</option>
					<option value=6>6학년</option>
					</select>
				</td>			
			</tr>
			<tr>
				<td>시험구분:</td>
				<td>
					<select name="test">
					<option value="">선택 </option>
					<option value="중간고사">중간고사</option>
					<option value="기말고사">기말고사</option>
					</select>
				</td>			
			</tr>
			<tr>
				<td>국어:</td>
				<td><input type="text" name="kor"  maxlength="3" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');"></td>			
			</tr>
			<tr>
				<td>영어:</td>
				<td><input type="text" name="eng"  maxlength="3" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');"></td>			
			</tr>
			<tr>
				<td>수학:</td>
				<td><input type="text" name="mat"  maxlength="3" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');"></td>			
			</tr>
			<tr>
				<td>과학:</td>
				<td><input type="text" name="sci" maxlength="3" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');"></td>			
			</tr>
			<tr>
				<td>학생 아이디:</td>
				<td><input type="text" name="sid"></td>			
			</tr>
		</table>
		<button type="button" onclick="save();" >저장</button>
	</form>
</body>
</html>
<script>
	function save(){
		if(document.testForm.hackyun.value.trim()==""){
			alert("학년을 선택해 주세요.")
			document.testForm.hackyun.focus();
			return false;
		}else if(document.testForm.test.value.trim()==""){
			alert("시험구분을 선택해 주세요.")
			document.testForm.test.focus();
			return false;
		}else if(document.testForm.kor.value.trim()==""){
			alert("국어성적을 입력해 주세요.")
			document.testForm.kor.focus();
			return false;
		}else if(document.testForm.eng.value.trim()==""){
			alert("영어성적을 입력해 주세요.")
			document.testForm.eng.focus();
			return false;
		}else if(document.testForm.mat.value.trim()==""){
			alert("영어성적을 입력해 주세요.")
			document.testForm.mat.focus();
			return false;
		}else if(document.testForm.sci.value.trim()==""){
			alert("과학성적을 입력해 주세요.")
			document.testForm.sci.focus();
			return false;
		}else if(confirm('저장하시겠습니까?')){
			document.testForm.method = "post";
			document.testForm.action = "schooltestProc.jsp";
			document.testForm.submit();
		}
	}
</script>