<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/inc_header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test</title>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body style="background-image:url('${path}/attach/image/background.jpg')" >
	<table border="1" align="center" width="100%" height="90%">
		<tr>
			<td>
				<c:choose>
					<c:when test="${menu_gubun == 'board_list'}">
						<jsp:include page="../board/list.jsp" />
					</c:when>
					<c:when test="${menu_gubun == 'board_write'}">
						<jsp:include page="../board/write.jsp" />
					</c:when>
					<c:when test="${menu_gubun == 'board_view'}">
						<jsp:include page="../board/view.jsp" />
					</c:when>
					<c:when test="${menu_gubun == 'board_answer'}">
						<jsp:include page="../board/answer.jsp" />
					</c:when>
					<c:when test="${menu_gubun == 'board_modify'}">
						<jsp:include page="../board/modify.jsp" />
					</c:when>
					<c:when test="${menu_gubun == 'exception'}">
						<jsp:include page="../main/exception.jsp" />
					</c:when>
					<c:otherwise>
					</c:otherwise>
				</c:choose>
			</td>
		</tr>
	</table>
</body>
</html>