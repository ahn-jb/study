<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>

<%@ page import="student.StudentDAO"%>
<%@ page import="student.StudentDTO"%>    

<%
	StudentDAO dao = new StudentDAO();
	ArrayList<StudentDTO> list = dao.getSelectAll();

%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 리스트</title>
</head>
<body>
	
	<form>
		<table border="1" width="1000" align="center">
			<tr>
				<td>학생 아이디</td>
				<td>학년</td>
				<td>학생 이름</td>
				<td>학생 전화번호</td>
				<td>부모님 이름</td>
				<td>부모님 전화번호</td>
				<td>주소</td>
			</tr>
			<%
				for(int i=0; i<list.size(); i++){
					StudentDTO dto = list.get(i);
				
			%>
			
			<tr>
				<td><%=dto.getSid() %> </td>
				<td><%=dto.getHackyun()%> </td>
				<td><a href="#" onclick="view('<%=dto.getSid()%>');"><%=dto.getSname()%></a> </td>
				<td><%=dto.getSphone()%> </td>
				<td><%=dto.getPname()%> </td>
				<td><%=dto.getPphone()%> </td>
				<td><%=dto.getAddr()%> </td>
			</tr>
			<%} %>
			<tr>
				<td colspan="7">
					<button type="button" onclick="location.href='student.jsp';">등록</button>
				</td>
			</tr>
			
		</table>
	</form>
	
</body>
</html>

<script>
function view(value1){
	location.href='view.jsp?sid='+value1;
}
</script>