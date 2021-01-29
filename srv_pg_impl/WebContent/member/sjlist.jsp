<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>

<%@ page import="sj.SjDAO"%>
<%@ page import="sj.SjDTO"%>
<%
	SjDAO dao = new SjDAO();
	ArrayList<SjDTO> list = dao.getSelectAll();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>성적 목록</title>
</head>
<body>
	<h2>성적 목록</h2>
	<table border="1" width="600">
		<tr>
			<td>이름</td>
			<td>시험명</td>
			<td>문제1</td>
			<td>문제2</td>
			<td>문제3</td>
			<td>문제4</td>
			<td>문제5</td>
			<td>점수</td>
		</tr>
		<%for(int i=0; i<list.size(); i++){
			SjDTO dto = list.get(i);
		
		%>
		<tr>
			<td><%=dto.getName() %></td>
			<td><%=dto.getSname()%></td>
			<td><%=dto.getMun_1()%> (<%=dto.getMun_ox_1()%>)</td>
			<td><%=dto.getMun_2()%> (<%=dto.getMun_ox_2()%>)</td>
			<td><%=dto.getMun_3()%> (<%=dto.getMun_ox_3()%>)</td>
			<td><%=dto.getMun_4()%> (<%=dto.getMun_ox_4()%>)</td>
			<td><%=dto.getMun_5()%> (<%=dto.getMun_ox_5()%>)</td>
			<td><%=dto.getJumsu()%></td>
		</tr>
		<%} %>
	</table>
	
</body>
</html>