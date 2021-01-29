<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>
</head>
<body>
	<h2>회원정보수정</h2>
	
	<table >
		<tr>
			<td width="200px">
				<input type="text" name="email"  style="height:40px; width:500px " value="hong@gmail.com" readonly>
			</td>
		</tr>
	</table>
	&nbsp;&nbsp;반드시 올바른 이메일 사용
	<table>
		<tr>
			<td>
				<input type="text" name="pw" placeholder="비밀번호 (8자리 이상)" style="height:40px; width:500px ">
			</td>
		</tr>
		<tr>
			<td>
				<input type="text" name="pwc" placeholder="비밀번호 확인" style="height:40px; width:500px ">
			</td>
		</tr>
		<tr>
			<td>
				<input type="text" name="name"  style="height:40px; width:500px " value="홍길동">
			</td>
		</tr>
	</table>
	<br>
	<table>
		<tr>
			<td>
				<select name="FOI" style="height:40px; width:200px;">
					<option value="">의견 관심분야 선택 ▼
					<option value="게임">게임
					<option value="sns">SNS
					<option value="동영상">동영상
					<option value="검색">검색
				</select>
			</td>
		</tr>
		<tr>
			<td>
				<input type="text" name="name"  style="height:40px; width:395px " value="01011112222">
				<button type="button"  style="height:46px; width:100px ">인증번호 수신</button>
			</td>
		</tr>
		<tr>
			<td>&nbsp;전화번호 변경시 재인증</td>
		</tr>
		<tr>
			<td>
				<input type="text" name="name" placeholder="인증번호 입력" style="height:40px; width:500px ">
			</td>
		</tr>
	</table>&nbsp;&nbsp;
	<button type="button"  style="height:50px; width:200px" >수정</button>&nbsp;&nbsp;&nbsp;&nbsp;
	<button type="button"  style="height:50px; width:200px" onclick="location.href='login.jsp';">취소</button>

				
	

</body>
</html>