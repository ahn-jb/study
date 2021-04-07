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
				주민번호
			</td>
			<td>
				${dto.jumin}
			</td>
		</tr>
		<tr>
			<td>
				성별
			</td>
			<td>
				${dto.gender}
			</td>
		</tr>
		<tr>
			<td>
				나이
			</td>
			<td>
				${dto.age}
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
				<button type="button" onclick="location.href='${path}/examSujeong.do?no=${dto.no}';">수정</button>
				<button type="button" onclick="location.href='${path}/examSakje.do?no=${dto.no}';">삭제</button>
				<button type="button" onclick="location.href='${path}/examList.do';">리스트</button>
			</td>
		</tr>
	</table>
</body>
</html>