<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>

<%@ page import="test.TestDAO"%>
<%@ page import="test.TestDTO"%>

<%
	
	String sid = request.getParameter("sid");
	TestDAO dao = new TestDAO();
	TestDTO dto= dao.getSelectone(sid);
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form>
		<table border="1" width="1000" align="center">
			<tr> 
				<td>이름</td>
				<td>시험구분</td>
				<td>국어</td>
				<td>영어</td>
				<td>수학</td>
				<td>과학</td>
				<td>총점</td>
				<td>평균</td> 
			</tr>
			
			<tr> 
				<td><%=dto.getSname() %> </td>
				<td><%=dto.getTest()%></td>
				<td><%=dto.getKor()%></td>
				<td><%=dto.getEng()%></td>
				<td><%=dto.getMat()%></td>
				<td><%=dto.getSci()%></td>
				<td><%=dto.getTot()%></td>
				<td><%=dto.getAvg()%></td> 
			</tr>
			<tr>
				<td colspan="8"><button type="button" onclick="go();">리스트</button> </td>
			</tr>
		</table>
		
	</form>
</body>
</html>
<script>
function go(){
	location.href="list.jsp";
}
</script>
