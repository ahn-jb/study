<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/inc_header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
		
	<table border="0" align="center">
		<tr>
			<td colspan="15" align="right" style="padding:5px 20px 10px;">
			<c:if test="${sessionScope.cookNo == null || sessionScope.cookNo == 0}">
				<a href="${path}/member_servlet/login.do">로그인</a>&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="${path}/member_servlet/chuga.do">회원가입</a>
			</c:if>
			
			<c:if test="${sessionScope.cookNo != null && sessionScope.cookNo != 0}">
				<a style="font-size:1.1em; font-weight:bold; ">${sessionScope.cookName}님 환영합니다.</a> &nbsp;&nbsp;
				<a href="#" >[내정보]</a>&nbsp;&nbsp;
				<a href="${path}/member_servlet/logout.do" >[로그아웃]</a>
			</c:if>
			</td> 
		</tr>
		<tr>
			<td style="padding:0px 20px;">
				<a href="${path}">HOME</a>
			</td>
			<c:if test="${sessionScope.cookNo != null && sessionScope.cookNo != 0}">
			<td style="padding:0px 20px;">
				<a href="${path}/member_servlet/list.do">회원관리</a>
			</td>
			</c:if>
			<td style="padding:0px 20px;">
				<a href="#">메모장</a>
			</td>
			<td style="padding:0px 20px;">
				<a href="#">방명록</a>
			</td>
			<td style="padding:0px 20px;">
				<a href="#">설문조사</a>
			</td>
			<td style="padding:0px 20px;">
				<a href="#">게시판</a>
			</td>
			<td style="padding:0px 20px;">
				<a href="#">쇼핑몰</a>
			</td>
			<td style="padding:0px 20px;">
				<a href="#">관리자</a>
			</td>
		</tr>	
	</table>
		
</body>
</html>