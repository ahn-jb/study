<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="survey.SurveyDAO" %>
<%@ page import="survey.SurveyDTO" %>

<%
	SurveyDAO dao = new SurveyDAO();
	ArrayList<SurveyDTO> list = dao.getSelectAll();
	int counter = 0;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>설문조사</title>
</head>
<body>

	<h2>설문조사</h2>
	<form name="answerForm" >
	<%
		for(int i=0; i<list.size(); i++){
			SurveyDTO dto = list.get(i);	
			counter = counter + 1;
			if(dto.getStatus()>0){
	%>
		<input type="hidden" name="no<%=i %>" value="<%=dto.getNo()%>">
		
		<table border="1" width="500">
			<tr>
				<td><%=dto.getQuestion() %></td>
				<td>
					<input type="radio" name="survey_answer_<%=i %>" value="1"><%=dto.getSelect1()%>
					<input type="radio" name="survey_answer_<%=i %>" value="2"><%=dto.getSelect2()%>
					<input type="radio" name="survey_answer_<%=i %>" value="3"><%=dto.getSelect3()%>
					<input type="radio" name="survey_answer_<%=i %>" value="4"><%=dto.getSelect4()%>
				</td>
			</tr>
		</table>
	<%		}%>
	<%	} %>
	<input type="hidden" name="counter" value="<%=counter%>">
	<br><button type="button" onclick="save();">제출하기</button>
	<button type="button" onclick="location.href='../survey_answer/answer_list.jsp';">설문 결과</button>
	</form>
<script>
	function save(){
		document.answerForm.method="post";
		document.answerForm.action="answerProc.jsp";
		document.answerForm.submit();
	}
</script>	
</body>
</html>