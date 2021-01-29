<%@page import="employees.EmployeesDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="employees.EmployeesDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%
	EmployeesDAO dao = new EmployeesDAO();
	EmployeesDTO dto = dao.getSelectOne("Steven", "King");
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보보기</title>
</head>
<body>
	
	<table border="1">
		<tr>
			<td>Employee_id </td>
			<td>First_name </td>
			<td>Last_name </td>
			<td>Email </td>
			<td>Phone_number </td>
			<td>Hire_date </td>
			<td>Job_id </td>
			<td>Salary </td>
			<td>Commission_pct </td>
			<td>Manager_id </td>
			<td>Department_id </td>
		</tr>
		<tr>
			<td><%=dto.getEmployee_id()     %></td>
			<td><%=dto.getFirst_name()      %></td>
			<td><%=dto.getLast_name()       %></td>
			<td><%=dto.getEmail()           %></td>
			<td><%=dto.getPhone_number()    %></td>
			<td><%=dto.getHire_date()       %></td>
			<td><%=dto.getJob_id()          %></td>
			<td><%=dto.getSalary()          %></td>
			<td><%=dto.getCommission_pct() %></td>
			<td><%=dto.getManager_id()      %></td>
			<td><%=dto.getDepartment_id()   %></td>
		</tr>
	</table>
	
</body>
</html>