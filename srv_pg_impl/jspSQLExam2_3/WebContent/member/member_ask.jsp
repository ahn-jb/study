<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/include_import.jsp" %>
<%@ include file="../include/include_check/include_check.jsp" %>
<%@ include file="../include/include_check/include_session.jsp" %>
<%@ include file="../include/include_check/include_session_check.jsp" %>

<%
	int no = Integer.parseInt(request.getParameter("no"));
	MemberDAO_imsi dao2 = new MemberDAO_imsi();
	ArrayList<MemberDTO> list = dao2.getSelectAllAsk();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의관리</title>
</head>
<body>

<script>
	function asklist(value1,value2){
		location.href="member_answer.jsp?no_member="+value1+"&no_ask="+value2;
	}
</script>

	<table border="1" width="100%">
		<tr>
			<td>
				<%@ include file="../include/include_top.jsp" %>
				<%@ include file="../include/include_check/include_access.jsp"%>
				<hr>
				<%@ include file="../include/include_check/include_member_menu.jsp" %>
			</td>
		</tr>
		<tr>
			<td>
				<form name="askForm">
				<h2>문의목록</h2>
			
					<table border="1" width="100%" >
						<tr>
							<td>No</td>
							<td>아이디</td>
							<td>상담분류</td>
							<td>제목</td>
							<td>내용</td>
							<td>날짜</td>
							<td align="center">답변</td>
						</tr>
						<% for(int i=0; i<list.size(); i++){
							MemberDTO dto2 = list.get(i);
						
						if(dto2.getNo() > 0){ %>
						<tr>
							<td><%=dto2.getNo() %></td>
							<td><%=dto2.getId()%></td>
							<td><%=dto2.getBunryu()%></td>
							<td><a href="#" onclick="asklist('<%=no%>','<%=dto2.getNo()%>');"><%=dto2.getSubject() %></a></td>
							<td><%=dto2.getContent() %></td>
							<td><%=dto2.getRegidate() %></td>
							<td align="center"><%=dto2.getAnswer() %></td>
						</tr>
						<%}else{ %>
						<tr>
							<td colspan="5" align="center">문의내역이 없습니다. </td>
						</tr>
						<%}} %>
					</table>
				</form>
			</td>
		</tr>
		<tr>
			<td colspan="1"><%@ include file="../include/include_bottom.jsp" %></td>
		</tr>
	</table>
</body>
</html>