<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/include_import.jsp" %>
<%@ include file="../include/include_check/include_check.jsp" %>
<%@ include file="../include/include_check/include_session.jsp" %>
<%@ include file="../include/include_check/include_session_check.jsp" %>

<%
	int no = Integer.parseInt(request.getParameter("no"));
	MemberDAO dao2 = new MemberDAO();
	ArrayList<MemberDTO> list= dao2.getSelectAsk(cookId);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의목록</title>
</head>
<body>

<script>
	function asklist(value1,value2){
		location.href="mypage_askupdate.jsp?no_member="+value1+"&no_ask="+value2;
	}
	function ask(value1){
		location.href="mypage_ask.jsp?no="+value1;
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
				<form name="askForm">
				<h2>문의목록</h2>
			
					<table border="1" width="1000" >
						<tr >
							<td>아이디</td>
							<td>상담분류</td>
							<td>제목</td>
							<td>내용</td>
							<td>날짜</td>
							<td align="center">답변</td>
						</tr>
						<%for(int i=0; i<list.size(); i++){
							MemberDTO dto2 = list.get(i);
						if(dto2.getNo() > 0){ %>
						<tr>
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
						<%}}%>
					</table>
					<br>
					<button type="button" onclick="ask(<%=no %>);">문의하기</button>
				</form>
			</td>
		</tr>
		<tr>
			<td colspan="1"><%@ include file="../include/include_bottom.jsp" %></td>
		</tr>
	</table>
</body>
</html>