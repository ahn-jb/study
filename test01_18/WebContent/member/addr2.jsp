<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주소입력</title>
</head>
<body>
	
	<h2  align="center">지번 주소</h2>
	<table  align="center" >
		<tr >
			<td>
				<table  border="1" align="center" >
					<tr>
						<td> 
							
							동명칭&nbsp;&nbsp;&nbsp;<input type="text">&nbsp;&nbsp;
							<button type="button">검색</button>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table><br>
	<table border="1" align="center" width="560">
		<tr>
			<td align="center">선택</td>
			<td align="center">도로명주소</td>
		</tr>
		<tr>
			<td align="center"><input type="radio" name="addr"></td>
			<td >&nbsp;강원도 속초시 중앙동</td>
		</tr>
		<tr>
			<td align="center"><input type="radio" name="addr"></td>
			<td >&nbsp;경기도 과천시 중앙동</td>
		</tr>
		<tr>
			<td align="center"><input type="radio" name="addr"></td>
			<td >&nbsp;경상남도 통영시 중앙동</td>
		</tr>
		<tr>
			<td align="center"><input type="radio" name="addr"></td>
			<td >&nbsp;전라남도 나주시 중앙동</td>
		</tr>
	</table>

</body>
</html>