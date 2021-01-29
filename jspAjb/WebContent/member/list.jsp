<%@page import="java.net.Inet4Address"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="etc.member.MemberDAOImplOracle" %>
<%@ page import="etc.member.MemberDAO" %>
<%@ page import="etc.member.MemberDTO" %>
<%@ include file="../include/include_check.jsp" %>
<%@ include file="../include/include_session.jsp" %>
<%@ include file="../include/include_menu.jsp" %>


<%
	 dao = new MemberDAOImplOracle();
	ArrayList<MemberDTO> list = dao.getSelectAll();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>목록</title>
</head>
<body>
	
	<h2>회원목록 -<%=cookId %></h2>
	<form>
		<table border="1" width="1000" >
			<tr>
				<td>No</td>
				<td>Id</td>
				<td>Pw</td>
				<td>Nick-Name</td>
				<td>Name</td>
				<td>E-mail</td>
				<td>Phone</td>
				<td>Address</td>
				<td>Gender</td>
				<td>Job</td>
				<td>Grade</td>
				<td>Regi_date</td>
			</tr>
			<% for(int i=0; i<list.size(); i++){
				 dto = list.get(i);	
			%>
			
			<tr>
				<td><%=dto.getNo()%></td>
				
				<%
				if(dto.getGrade().equals("2")|| dto.getGrade().equals("3")|| dto.getGrade().equals("4")){ 
					if(dto.getId().equals(cookId)){
				%>
				<td><a href="#" onclick="view('<%=dto.getId()%>');"><%=dto.getId()%></a></td>
				<%	}
				else{%>				
				<td><%=dto.getId()%></td>
				<%} }else{%>
				<td><%=dto.getId()%></td>
				<%} %>
				
				<td><%=dto.getPw()%></td>
				<td><%=dto.getNickname()%></td>
				<td><%=dto.getName()%></td>
				<td><%=dto.getEmail()%></td>
				<td><%=dto.getPhone()%></td>
				<td><%=dto.getAddress()%></td>
				<td><%=dto.getGender()%></td>
				<td><%=dto.getJob()%></td>
				<td><%=dto.getGrade()%></td>
				<td><%=dto.getRegi_date()%></td>
			</tr>
			<%}%>
		</table>
		<br>
		<button type="button" onclick="location.href='list.jsp';">목록</button>
	</form>
</body>
</html>
<script>
	function view(value1){
		location.href="view.jsp?id="+value1;
	}
</script>