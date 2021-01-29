<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="survey.SurveyDAO" %>
<%@ page import="survey.SurveyDTO" %>


<%
	SurveyDAO dao = new SurveyDAO();
	ArrayList<SurveyDTO> list = dao.getSelectAll();
%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>설문지 목록</title>
</head>
<body>
	<h2>설문지 목록</h2>
	<table border="1" width="700">
		<tr>
			<td>no</td>
			<td>질문</td>
			<td>선택1</td>
			<td>선택2</td>
			<td>선택3</td>
			<td>선택4</td>
			<td>status</td>
		</tr>
		<%for(int i=0; i<list.size(); i++){
			SurveyDTO dto = list.get(i);		
		%>
		
		<tr>
			<td><%=dto.getNo()%> </td>
			<td><a href="survey_view.jsp?no=<%=dto.getNo()%>"><%=dto.getQuestion()%></a></td>
			<td><%=dto.getSelect1()%> </td>
			<td><%=dto.getSelect2()%> </td>
			<td><%=dto.getSelect3()%> </td>
			<td><%=dto.getSelect4()%> </td>
			<td><%=dto.getStatus()%> </td>
		</tr>
		<%} %>
	</table>
	<br>
	<button type="button" onclick="location.href='../survey/survey_write.jsp';">설문지 작성</button>
	<button type="button" onclick="location.href='../survey_answer/answer_list.jsp';">설문 결과</button>
</body>
</html>