<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/inc_header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<title>게시판</title>
</head>
<body>
	<table border="1" align="center" width="100%" height="90%">
		<tr>
			<td align="center" style="padding:50px 50px;">
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
					<c:when test="${menu_gubun == 'board_sujeong'}">
						<jsp:include page="../board/sujeong.jsp" />
					</c:when>
					<c:when test="${menu_gubun == 'board_sakje'}">
						<jsp:include page="../board/sakje.jsp" />
					</c:when>					
				</c:choose>
			 </td>
		</tr>
	</table>
</body>
</html>