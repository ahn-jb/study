<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/include_import.jsp" %>
<%@ include file="../include/include_check/include_check.jsp" %>
<%@ include file="../include/include_check/include_session.jsp" %>
<%@ include file="../include/include_check/include_session_check.jsp" %>

<%
	int no = Integer.parseInt(request.getParameter("no_member"));
	int no_ask =Integer.parseInt(request.getParameter("no_ask"));
	MemberDAO dao2 = new MemberDAO();
	MemberDTO dto2_ask = dao2.getSelectAsk(no_ask);
	MemberDTO dto2_answer = dao2.getSelectAnswer(no_ask);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의&답변</title>
</head>
<body>

<script>
	function askRemove(value1,value2){
		if(confirm('정말 삭제하시겠습니까?')){
			location.href="mypage_askDelete.jsp?no_ask="+value1+"&no_member="+value2;
		}
	}
</script>

	<table border="1">
		<tr>
			<td>
				<%@ include file="../include/include_top.jsp" %>
				<%@ include file="../include/include_check/include_access.jsp"%>
			</td>
		</tr>
		<tr>
			<td>
				<form name="removeForm">
				<h2>문의&답변  내용</h2>
			
					<table border="1" width="1000" >
					
						<tr>
							<td>아이디</td>
							<td><%= dto2_ask.getId()%></td>
						</tr>
						<tr>
							<td>상담분류</td>
							<td><%= dto2_ask.getBunryu()%></td>
						</tr>
							
						<tr>
							<td>제목</td>
							<td><%= dto2_ask.getSubject()%></td>
						</tr>
						<tr>
							<td>내용</td>
							<td><%= dto2_ask.getContent()%></td>
						</tr>
						<tr>
							<td>문의날짜</td>
							<td><%= dto2_ask.getRegidate()%></td>
						</tr>
					</table>
				</form>
			</td>
		</tr>
	
		<tr>
		<%if(dto2_answer.getNo() == dto2_ask.getNo()){ %>
			<td>
			
				└[Re]
				<form name="answerForm">					
					<input type="hidden" name="no_member" value="<%=no%>">
					<input type="hidden" name="no" value="<%=dto2_answer.getNo()%>">
					<table border="1" width="1000">
						<tr>
							<td>아이디</td>
							<td><%=dto2_answer.getRank() %></td>
						</tr>
						<tr>
							<td>제목</td>
							<td><%=dto2_answer.getSubject() %></td>
						</tr>
						<tr>
							<td>내용</td>
							<td><%=dto2_answer.getContent() %></td>
						</tr>
						<tr>
							<td>답변날짜</td>
							<td><%=dto2_answer.getRegidate() %></td>
						</tr>
					</table>
				</form>
			</td>
			<%}else{ %>
			<td><h3>답변 대기중...</h3></td>
			<%} %>
		</tr>
		<tr>
			<td><button type="button" onclick="askRemove('<%=dto2_ask.getNo()%>',<%=no%>);">삭제하기</button></td>
		</tr>
		<tr>
			<td colspan="1"><%@ include file="../include/include_bottom.jsp" %></td>
		</tr>
	</table>
</body>
</html>