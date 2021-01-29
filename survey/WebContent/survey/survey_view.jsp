<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="survey.SurveyDAO" %>
<%@ page import="survey.SurveyDTO" %>

<%
	int no = Integer.parseInt(request.getParameter("no"));
	SurveyDAO dao = new SurveyDAO();
	SurveyDTO dto = dao.getSelectOne(no);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세보기</title>
</head>
<body>
	<h2>상세보기</h2>
	<form name="viewForm">
		<table>
			<tr>
				<td>no</td>
				<td><input type="text" name="no" value="<%=dto.getNo()%>" readonly> </td>
			</tr>
			<tr>
				<td>질문</td>
				<td><input type="text" name="question" value="<%=dto.getQuestion()%>"></td>
			</tr>
			<tr>
				<td>선택1</td>
				<td><input type="text" name="select1" value="<%=dto.getSelect1()%>"></td>
			</tr>
			<tr>
				<td>선택2</td>
				<td><input type="text" name="select2" value="<%=dto.getSelect2()%>"></td>
			</tr>
			<tr>
				<td>선택3</td>
				<td><input type="text" name="select3" value="<%=dto.getSelect3()%>"></td>
			</tr>
			<tr>
				<td>선택4</td>
				<td><input type="text" name="select4" value="<%=dto.getSelect4()%>"></td>
			</tr>
			<tr>
				<td>status</td>
				<td><input type="text" name="status" value="<%=dto.getStatus()%>"></td>
			</tr>
		</table>
		<button type="button" onclick="sujeong();">수정하기</button>
		<button type="button" onclick="remove('<%=dto.getNo() %>');">삭제하기</button>
	</form>
<script>
	function sujeong(){
		document.viewForm.method="post";
		document.viewForm.action="survey_modify.jsp";
		document.viewForm.submit();
	}
	function remove(value1){
		location.href="survey_delete.jsp?no="+value1;
	}
</script>
</body>
</html>