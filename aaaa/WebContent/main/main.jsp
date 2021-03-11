<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/inc_header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리</title>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body>
	<table border="1" align="center" width="100%" height="90%">
		<tr>
			<td align="center" style="padding:20px 20px;">
				<jsp:include page="../include/inc_menu.jsp"></jsp:include>
			</td>
		</tr>
		<tr>
			<td align="center" style="padding:50px 50px;">
				<c:choose>
					<c:when test="${menu_gubun == 'student_index'}">
						<jsp:include page="../student/index.jsp" /> 
					</c:when>
					<c:when test="${menu_gubun == 'student_student'}">
						<jsp:include page="../student/student.jsp" /> 
					</c:when>
					<c:when test="${menu_gubun == 'student_studentChuga'}">
						<jsp:include page="../student/studentChuga.jsp" /> 
					</c:when>
					<c:when test="${menu_gubun == 'student_test'}">
						<jsp:include page="../student/test.jsp" /> 
					</c:when>
					<c:when test="${menu_gubun == 'student_testChuga'}">
						<jsp:include page="../student/testChuga.jsp" /> 
					</c:when>
					<c:when test="${menu_gubun == 'student_SJ'}">
						<jsp:include page="../student/SJ.jsp" /> 
					</c:when>
					
					<c:otherwise>
					</c:otherwise>
				</c:choose>
			</td>
		</tr>
	</table>
</body>
</html>