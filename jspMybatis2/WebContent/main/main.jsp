<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/inc_header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HONG</title>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body style="background-image:url('${path}/attach/image/background.jpg')" >
	<table border="1" align="center" width="100%" height="90%">
		<tr>
			<td align="center" style="padding:20px 20px;">
				<jsp:include page="../include/inc_menu.jsp"></jsp:include>
			</td>
		</tr>
		<tr>
			<td align="center" style="padding:50px 50px;">
				<c:choose>
					<c:when test="${menu_gubun == 'index'}">
						<jsp:include page="../main/main_sub.jsp" /> 
					</c:when>
					<c:when test="${menu_gubun == 'member_index'}">
						<jsp:include page="../member/index.jsp" />
					</c:when>
<%-- 					<c:when test="${menu_gubun == 'member_chuga'}"> --%>
<%-- 						<jsp:include page="../member/chuga.jsp" /> --%>
<%-- 					</c:when> --%>
					<c:when test="${menu_gubun == 'member_login'}">
						<jsp:include page="../member/login.jsp" />
					</c:when>
					<c:when test="${menu_gubun == 'memo_write'}">
						<jsp:include page="../memo/write.jsp" />
					</c:when>
					<c:otherwise>
					</c:otherwise>
				</c:choose>
			</td>
		</tr>
		<tr>
			<td align="center" style="padding: 20px 20px;" > 
				<jsp:include page="../include/inc_bottom.jsp"></jsp:include>
			</td>
		</tr>
	</table>
</body>
</html>