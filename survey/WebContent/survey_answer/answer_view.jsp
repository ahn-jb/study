<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="survey.SurveyDAO" %>
<%@ page import="survey.SurveyDTO" %>
<%@ page import="answer.AnswerDAO"%>
<%@ page import="answer.AnswerDTO"%>

<%
	int no = Integer.parseInt(request.getParameter("no"));
	AnswerDAO dao_A = new AnswerDAO();
	double count = dao_A.getCount(no);
	int count1 = dao_A.getCount(no, 1);
	int count2 = dao_A.getCount(no, 2);
	int count3 = dao_A.getCount(no, 3);
	int count4 = dao_A.getCount(no, 4);
	
	Double persent1 = Double.parseDouble(String.format("%.1f", count1*100.0/count));
	Double persent2 = Double.parseDouble(String.format("%.1f", count2*100.0/count));
	Double persent3 = Double.parseDouble(String.format("%.1f", count3*100.0/count));
	Double persent4 = Double.parseDouble(String.format("%.1f", count4*100.0/count));
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세보기</title>
</head>
<body>
	<h2>상세보기</h2>
	<table border="1">
		<tr>
			<td>선택 번호</td>
			<td>응답수 </td>
			<td>응답률</td>
			<td width="250px">&nbsp;</td>
		</tr>
		<tr>	
			<td>1</td>
			<td><%=count1 %></td>
			<td><%=persent1 %>% </td>
			<td><hr align="left" style="border : solid 10px  blue;" width="<%=persent1%>%"></td>
		</tr>
		<tr>
			<td>2</td>
			<td><%=count2 %></td>
			<td><%=persent2 %>% </td>
			<td><hr align="left" style="border : solid 10px  blue;" width="<%=persent2%>%"></td>
		</tr>
		<tr>
			<td>3</td>
			<td><%=count3 %></td>
			<td><%=persent3 %>% </td>
			<td><hr align="left" style="border : solid 10px  blue;" width="<%=persent3%>%"></td>
		</tr>
		<tr>
			<td>4</td>
			<td><%=count4 %></td>
			<td><%=persent4 %>% </td>
			<td><hr align="left" style="border : solid 10px  blue;" width="<%=persent4%>%"></td>
		</tr>
	</table>
	<br>
	<button type="button" onclick="location.href='answer_list.jsp';">리스트</button>
</body>
</html>