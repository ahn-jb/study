<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/inc_menu.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>뷰</h2>
	<table border="1">
		<tr>
			<td>
				아이디
			</td>
			<td>
				${dto.id}
			</td>	
		</tr>
		<tr>
			<td>
				이름
			</td>
			<td>
				${dto.name}
			</td>
		</tr>
		<tr>
			<td>
				이메일
			</td>
			<td>
				${dto.email}
			</td>
		</tr>
		<tr>
			<td>
				등록일
			</td>
			<td>
				${dto.regi_date}
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<button type="button" onclick="location.href='${path}/memberSujeong.do?id=${dto.id}';">수정</button>
				<button type="button" onclick="location.href='${path}/memberSakje.do?id=${dto.id}';">삭제</button>
				<button type="button" onclick="location.href='${path}/memberList.do';">리스트</button>

			</td>
		</tr>
	</table>
</body>
</html>