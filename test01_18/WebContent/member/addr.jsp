<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주소입력</title>
</head>
<body>
	
	<h2  align="center">도로명 주소</h2>
	<table  align="center" >
		<tr >
			<td>
				<table  border="1" align="center">
					<tr>
						<td> 
							시군구<input type="text">&nbsp;&nbsp;&nbsp;&nbsp;
							도로명<input type="text">&nbsp;&nbsp;&nbsp;&nbsp;
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
			<td >&nbsp;강원도 동해시 중앙로</td>
		</tr>
		<tr>
			<td align="center"><input type="radio" name="addr"></td>
			<td >&nbsp;서울특별시 구로구 중앙로</td>
		</tr>
		<tr>
			<td align="center"><input type="radio" name="addr"></td>
			<td >&nbsp;제주특별자치도 제주시 중앙로</td>
		</tr>
		<tr>
			<td align="center"><input type="radio" name="addr"></td>
			<td >&nbsp;충청북도 충주시 중앙로</td>
		</tr>
	</table>

</body>
</html>