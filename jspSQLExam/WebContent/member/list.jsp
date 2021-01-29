<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.member.MemberDAO" %>
<%@ page import="model.member.MemberDTO" %>
<%@ include file="../include/include_check/include_check.jsp" %>
<%@ include file="../include/include_check/include_session.jsp" %>




<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
</head>
<body>
	
	<table border="1">
		<tr>
			<td><%@ include file="../include/include_top.jsp" %></td>
		</tr>
		<tr>
			<td>
				<form>
				<h2>마이페이지 -<%=cookNo %></h2>
				<%
				MemberDAO dao = new MemberDAO();
				%>
					<table border="1" width="1000" >
						<tr>
							<td>No</td>
							<td>Id</td>
							<td>Pw</td>
							<td>Name</td>
							<td>Gender</td>
							<td>bornYear</td>
							<td>Grade</td>
							<td>Regidate</td>
						</tr>
						<% 
							MemberDTO dto = dao.getSelectOne(cookNo);
						%>
						
						<tr>
							<td><%=dto.getNo()%></td>
							<td><a href="#" onclick="view('<%=dto.getNo()%>');"><%=dto.getId()%></a></td>
							<td><%=dto.getPw()%></td>
							<td><%=dto.getName()%></td>
							<td><%=dto.getGender()%></td>
							<td><%=dto.getBornYear()%></td>
							<td><%=dto.getGrade()%></td>
							<td><%=dto.getRegidate()%></td>
						</tr>
					</table>
					<br>
				</form>
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
		location.href="view.jsp?id="+value1;
	}
</script>