<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="db.Dbmethod" %>
<%@ page import="db.HumanDTO" %>
<%
	String aptId = request.getParameter("aptId");

	Dbmethod dao = new Dbmethod();
	HumanDTO dto = dao.getIoT(aptId);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View</title>
</head>
<body>
	<table border="1">
		<tr>
			<td>아이디: <%=dto.getAptId()%></td>
		</tr>
		<tr>
			<td><%=dto.getSecurity() %></td>
		</tr>
		<tr>
			<td><%=dto.getAircondition() %></td>
		</tr>
		<tr>
			<td><%=dto.getLight() %></td>
		</tr>
		<tr>
			<td><%=dto.getTelevision() %></td>
		</tr>
		<tr>
			<td><%=dto.getCucu() %></td>
		</tr>
	</table>
</body>
</html>