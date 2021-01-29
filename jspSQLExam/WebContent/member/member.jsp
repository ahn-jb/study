<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.member.MemberDAO" %>
<%@ page import="model.member.MemberDTO" %>
<%@ include file="../include/include_check/include_check.jsp" %>
<%@ include file="../include/include_check/include_session.jsp" %>


<%
	 MemberDAO dao = new MemberDAO();
	ArrayList<MemberDTO> list = dao.getSelectAll();
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리</title>
</head>
<body>
	<table border="1" width="100%">
	<tr >
		<td colspan="1" >		
			<%@ include file="../include/include_top.jsp" %>
			<hr>
			<%@ include file="../include/include_check/include_member_menu.jsp" %>
		</td>
	
	</tr>

	<tr>
		<td>
			<form align="center">
				<h2>회원관리자 -<%=cookNo %></h2>
				<table border="1" width="1000" align="center">
					<tr>
						<td>No</td>
						<td>Id</td>
						<td>Pw</td>
						<td>Name</td>
						<td>Gender</td>
						<td>BornYear</td>
						<td>Grade</td>
						<td>Regidate</td>
					</tr>
					<% for(int i=0; i<list.size(); i++){
						  dto = list.get(i);	
					%>
					
					<tr>
						<td><%=dto.getNo()%></td>
						<td><a href="#" onclick="view('<%=dto.getNo()%>');"><%=dto.getId()%></a></td>
						<td><%=dto.getPw()%></td>
						<td><%=dto.getName()%></td>
						<td><%=dto.getGender()%></td>
						<td><%=dto.getBornYear() %></td>
						<td><%=dto.getGrade()%></td>
						<td><%=dto.getRegidate()%></td>
					</tr>
					<%}%>
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
		location.href="view.jsp?no="+value1;
	}
</script>