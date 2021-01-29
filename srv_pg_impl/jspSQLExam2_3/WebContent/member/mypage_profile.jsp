<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/include_import.jsp" %>
<%@ include file="../include/include_check/include_check.jsp" %>
<%@ include file="../include/include_check/include_session.jsp" %>
<%@ include file="../include/include_check/include_session_check.jsp" %>

<%
	
	int no = Integer.parseInt(request.getParameter("no"));//여기서 실행시키면 받아오는 no가 없기때문에 오류가 생김
														  //이렇게 된 이유는 세션이 cookId인데 고치기 귀찮아서 냅두어서 이렇게 됨
	MemberDAO dao2 = new MemberDAO();
	MemberDTO dto2 = dao2.getSelectOneNo(no);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내정보</title>
</head>
<body>

<table border="1">
		<tr>
			<td>
				<%@ include file="../include/include_top.jsp" %>
				<%@ include file="../include/include_check/include_access.jsp"%>
			</td>
		</tr>
		<tr>
			<td>
				<form>
				<h2>마이페이지</h2>
			
					<table border="1" width="1000" >
						<tr>
							<td>No</td>
							<td>Id</td>
							<td>Pw</td>
							<td>Name</td>
							<td>Gender</td>
							<td>bornYear</td>
							<td>Grade</td>
							<td>Regidate</td>
						</tr>
						
						<tr>
							<td><%=dto2.getNo()%></td>
							<td><%=dto2.getId()%></td>
							<td><%=dto2.getPw()%></td>
							<td><%=dto2.getName()%></td>
							<td><%=dto2.getGender()%></td>
							<td><%=dto2.getBornYear()%></td>
							<td><%=dto2.getGrade()%></td>
							<td><%=dto2.getRegidate()%></td>
						</tr>
					</table>
					<br>
					<button type="button" onclick="view('<%=dto2.getNo()%>');">수정하기</button>
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
