<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="survey.SurveyDAO" %>
<%@ page import="survey.SurveyDTO" %>
<%@ page import="answer.AnswerDAO"%>
<%@ page import="answer.AnswerDTO"%>


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
	<h2>설문 결과</h2>
	<table border="1" width="900">
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
			
			AnswerDAO dao_A = new AnswerDAO();
			double count = dao_A.getCount(dto.getNo());
			int count1 = dao_A.getCount(dto.getNo(), 1);
			int count2 = dao_A.getCount(dto.getNo(), 2);
			int count3 = dao_A.getCount(dto.getNo(), 3);
			int count4 = dao_A.getCount(dto.getNo(), 4);
			
			Double persent1 = Double.parseDouble(String.format("%.1f", count1*100.0/count));
			Double persent2 = Double.parseDouble(String.format("%.1f", count2*100.0/count));
			Double persent3 = Double.parseDouble(String.format("%.1f", count3*100.0/count));
			Double persent4 = Double.parseDouble(String.format("%.1f", count4*100.0/count));
		%>
		
		<tr>
			<td><%=dto.getNo()%> </td>
			<td><a href="answer_view2.jsp?no=<%=dto.getNo()%>"><%=dto.getQuestion()%></a></td>
			<td><%=dto.getSelect1()%> (<%=count1 %>)[<%=persent1 %> %]</td>
			<td><%=dto.getSelect2()%> (<%=count2 %>)[<%=persent2 %> %]</td>
			<td><%=dto.getSelect3()%> (<%=count3 %>)[<%=persent3 %> %]</td>
			<td><%=dto.getSelect4()%> (<%=count4 %>)[<%=persent4 %> %]</td>
			<td><%=dto.getStatus()%> </td>
		</tr>
		<%} %>
	</table>
	<br>
	<button type="button" onclick="location.href='../survey_answer/answer.jsp';">설문하기</button>
	<button type="button" onclick="location.href='../survey/survey_list.jsp';">설문 목록</button>
</body>
</html>