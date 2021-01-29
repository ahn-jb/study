<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>성적 등록</title>
</head>
<body>
	<h2>성적 등록</h2>
	<form name="sjForm">
		<table border="1" width="500">
			<tr> 
				<td>이름</td>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<td>시험</td>
				<td> 
					<input type="radio" name="sname" value="중간고사">중간고사
					<input type="radio" name="sname" value="기말고사">기말고사
				</td>
			</tr>
			<tr>
				<td>
					1.동물이 아닌 것은?(20점)
				</td>
				<td>
					<input type="radio" name="mun_1" value="1">신발
					<input type="radio" name="mun_1" value="2">여우
					<input type="radio" name="mun_1" value="3">늑대
					<input type="radio" name="mun_1" value="4">까치
				</td>
			</tr>
			<tr>
				<td>
					2.먹을 수 없는 것은?(20점)
				</td>
				<td>
					<input type="radio" name="mun_2" value="1">우유
					<input type="radio" name="mun_2" value="2">오일
					<input type="radio" name="mun_2" value="3">식빵
					<input type="radio" name="mun_2" value="4">콜라
				</td>
			</tr>
			<tr>
				<td>
					3.용도가 다른 것은?(20점)
				</td>
				<td>
					<input type="radio" name="mun_3" value="1">구두
					<input type="radio" name="mun_3" value="2">샌들
					<input type="radio" name="mun_3" value="3">우의
					<input type="radio" name="mun_3" value="4">짚신
				</td>
			</tr>
			<tr>
				<td>
					4.student의 의미는?(20점)
				</td>
				<td>
					<input type="radio" name="mun_4" value="1">의사
					<input type="radio" name="mun_4" value="2">군인
					<input type="radio" name="mun_4" value="3">선생
					<input type="radio" name="mun_4" value="4">학생
				</td>
			</tr>
			<tr>
				<td>
					5.한글을 창제한 왕은?(20점)
				</td>
				<td>
					<input type="radio" name="mun_5" value="1">성종
					<input type="radio" name="mun_5" value="2">문종
					<input type="radio" name="mun_5" value="3">세종
					<input type="radio" name="mun_5" value="4">세조
				</td>
			</tr>
		</table>
		<button type="button" onclick="save();">확인</button>
	</form>
</body>
</html>
<script>
function save(){
	if(document.sjForm.name.value.trim() ==""){
		alert('이름을 입력해 주세요.');
		document.sjForm.name.focus();
		return false;
	}else if(document.sjForm.sname.value.trim() ==""){
		alert('시험을 선택해 주세요.');
		document.sjForm.sname.focus();
		return false;
	}else if(document.sjForm.mun_1.value.trim() ==""){
		alert('1번 문제의 답을 선택해 주세요.');
		document.sjForm.mun_1.focus();
		return false;
	}else if(document.sjForm.mun_2.value.trim() ==""){
		alert('2번 문제의 답을 선택해 주세요.');
		document.sjForm.mun_2.focus();
		return false;
	}else if(document.sjForm.mun_3.value.trim() ==""){
		alert('3번 문제의 답을 선택해 주세요.');
		document.sjForm.mun_3.focus();
		return false;
	}else if(document.sjForm.mun_4.value.trim() ==""){
		alert('4번 문제의 답을 선택해 주세요.');
		document.sjForm.mun_4.focus();
		return false;
	}else if(document.sjForm.mun_5.value.trim() ==""){
		alert('5번 문제의 답을 선택해 주세요.');
		document.sjForm.mun_5.focus();
		return false;
	}else if(confirm('제출 하시겠습니까?')){
		document.sjForm.method='post';
		document.sjForm.action='sjProc.jsp';
		document.sjForm.submit();
	}
}
</script>
