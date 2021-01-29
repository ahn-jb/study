<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/include_import.jsp" %>
<%@ include file="../include/include_check/include_check.jsp" %>
<%@ include file="../include/include_check/include_session.jsp" %>
<%@ include file="../include/include_check/include_session_check.jsp" %>


<%
	int no = Integer.parseInt(request.getParameter("no"));
	 MemberDAO dao2 = new MemberDAO();
	ArrayList<MemberDTO> list = dao2.getSelectAll();
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리페이지</title>
</head>
<body>
	<table border="1" width="100%">
	<tr >
		<td colspan="1" >		
			<%@ include file="../include/include_top.jsp" %>
			<%@ include file="../include/include_check/include_access.jsp"%>
			<hr>
			<%@ include file="../include/include_check/include_member_menu.jsp" %>
		</td>
	
	</tr>

	<tr>
		<td widtd="1000" height="150" >
			<h2>관리하기 페이지 입니다.</h2>
		</td>
	</tr>
	<tr>
		<td colspan="1"><%@ include file="../include/include_bottom.jsp" %></td>
	</tr>
	</table>
</body>
</html>
<script>
	function view(value1){
		location.href="view.jsp?no="+value1;
	}
</script>