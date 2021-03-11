<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/inc_header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="0" align="center">
		<tr>	
			<td style="padding:0px 20px;" id="index">
				<a href="${path}/student_servlet/index.do">HOME</a>
			</td>
			<td style="padding:0px 20px;" id="student">
				<a href="${path}/student_servlet/student.do">학생관리</a>
			</td>
			<td style="padding:0px 20px;" id="test">
				<a href="${path}/student_servlet/test.do">시험관리</a>
			</td>
			<td style="padding:0px 20px;" id="SJ">
				<a href="${path}/student_servlet/SJ.do">성적관리</a>
			</td>
		</tr>
	</table>
</body>
</html>