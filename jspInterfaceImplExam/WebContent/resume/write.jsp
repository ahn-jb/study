<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이력서 등록</title>
</head>
<body>
	<h2>이 력 서</h2>
	<form name="writeForm"  method="post" ">
		<h5>-인적사항</h5>
		<table border="1" width="550">
			<tr>
				<td rowspan="4"><input type="text" name="pic" value="사진"></td>
				<td style="background-color : gray;">성 명</td>
				<td><input type="text" name="name" value="" ></td>
			</tr>
			<tr>
				<td style="background-color : gray;">이메일</td>
				<td><input type="text" name="email" value=""></td>
			</tr>
			<tr>
				<td style="background-color : gray;">휴대폰</td>
				<td ><input type="text" name="phone" value=""></td>
			</tr>
			<tr>
				<td style="background-color : gray;">주 소</td>
				<td><input type="text" name="adress" value=""></td>
			</tr>
		</table><br><br>
		<h5>-학력사항</h5>
		<table border="1" width="550">
			<tr>
				<td style="background-color : gray;">기간</td>
				<td style="background-color : gray;">학교명</td>
				<td style="background-color : gray;">전공(학과)</td>
			</tr>
			<tr>
				<td><input type="text" name="gigan1" value=""></td>
				<td><input type="text" name="school1" value=""></td>
				<td><input type="text" name="jeongong1" value=""></td>
			</tr>
			<tr>
				<td><input type="text" name="gigan2" value=""></td>
				<td><input type="text" name="school2" value=""></td>
				<td><input type="text" name="jeongong2" value=""></td>
			</tr>
			<tr>
				<td><input type="text" name="gigan3" value=""></td>
				<td><input type="text" name="school3" value=""></td>
				<td><input type="text" name="jeongong3" value=""></td>
			</tr>
			<tr>
				<td><input type="text" name="gigan4" value=""></td>
				<td><input type="text" name="school4" value=""></td>
				<td><input type="text" name="jeongong4" value=""></td>
			</tr>
		</table><br><br>
		<h5>-어학능력</h5>
		<table border="1" width="550">
			<tr>
				<td rowspan="2" style="background-color : gray;">어학</td>
				<td style="background-color : gray;">Toeic</td>
				<td><input type="text" name="toeic"  value="">점</td>
				<td style="background-color : gray;">일본어</td>
				<td><input type="text" name="japan"  value="">급</td>
			</tr>
			<tr>
				<td style="background-color : gray;">Toefl</td>
				<td><input type="text" name="toefl" value="">점</td>
				<td style="background-color : gray;">중국어</td>
				<td><input type="text" name="china" value="" >급</td>
			</tr>
		</table>
		<button type="button" onclick="save();" >입력</button>
	</form>
</body>
</html>
<script>
	function save(){
		document.writeForm.method="post";
		document.writeForm.action="writeProc.jsp";
		document.writeForm.submit();
	}
</script>