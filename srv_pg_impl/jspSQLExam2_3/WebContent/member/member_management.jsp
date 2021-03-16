<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/include_import.jsp" %>
<%@ include file="../include/include_check/include_check.jsp" %>
<%@ include file="../include/include_check/include_session.jsp" %>
<%@ include file="../include/include_check/include_session_check.jsp" %>


<%
	int no = Integer.parseInt(request.getParameter("no"));
	 MemberDAO_imsi dao2 = new MemberDAO_imsi();
	ArrayList<MemberDTO> list = dao2.getSelectAll();
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
			<%@ include file="../include/include_check/include_access.jsp"%>
			<hr>
			<%@ include file="../include/include_check/include_member_menu.jsp" %>
		</td>
	
	</tr>

	<tr>
		<td>
<%-- 		<%if() %> --%>
			<form>
				<h2>회원관리 -<%=cookId %></h2>
				<table border="1" width="1000" >
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
						MemberDTO  dto2 = list.get(i);	
					%>
					
					<tr>
						<td><%=dto2.getNo()%></td>
						<td><a href="#" onclick="view('<%=dto2.getNo()%>');"><%=dto2.getId()%></a></td>
						<td><%=dto2.getPw()%></td>
						<td><%=dto2.getName()%></td>
						<td><%=dto2.getGender()%></td>
						<td><%=dto2.getBornYear() %></td>
						<td><%=dto2.getGrade()%></td>
						<td><%=dto2.getRegidate()%></td>
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