<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/include_import.jsp" %>  
<%@ include file="../include/include_top_common.jsp" %>    
<%@ include file="../include/include_session.jsp" %>
<%@ include file="../include/include_session_check.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리스트</title>
</head>
<body>

<script>
	function view(value1){
		location.href="view.jsp?id="+value1;
	}
</script>


		<table border="1" width="100%">
		<tr>
			<td>
				<jsp:include page="../include/include_top1.jsp" flush="false">
				<jsp:param value="<%=ip %>" name="ip"/>
				<jsp:param value="<%=cookId %>" name="cookId"/></jsp:include>
			</td>
		</tr>
		<tr>
			<td style="padding:50px 20px;  ">
				<form>
				<h2>마이페이지 -<%=cookId %></h2>
				<%
					MemberDAO dao = new MemberDAO();
				%>
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
						<% 
							MemberDTO dto1 = dao.getSelectOne(cookId);
							ArrayList<MemberDTO> list = dao.getSelectAll();
							for(int i=0; i<list.size(); i++){
								MemberDTO dto = list.get(i);
							
						%>
						
						<tr>
							<td><%=dto.getNo()%></td>
							<td><a href="#" onclick="view('<%=dto.getId()%>');"><%=dto.getId()%></a></td>
							<td><%=dto.getPw()%></td>
							<td><%=dto.getName()%></td>
							<td><%=dto.getGender()%></td>
							<td><%=dto.getBornYear()%></td>
							<td><%=dto.getGrade()%></td>
							<td><%=dto.getRegidate()%></td>
						</tr>
						<%} %>
					</table>
					<br>
					<button type="button" onclick="location.href='list.jsp';">목록</button>
				</form>
			</td>
		</tr>
		<tr>
			<td>
				<jsp:include page="../include/include_bottom.jsp" flush="false"></jsp:include>
			</td>
		</tr>
	</table>
</body>
</html>