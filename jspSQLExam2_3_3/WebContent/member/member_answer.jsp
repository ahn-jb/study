<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/include_import.jsp" %>
<%@ include file="../include/include_check/include_check.jsp" %>
<%@ include file="../include/include_check/include_session.jsp" %>
<%@ include file="../include/include_check/include_session_check.jsp" %>

<%
	int no = Integer.parseInt(request.getParameter("no_member"));
	int no_ask =Integer.parseInt(request.getParameter("no_ask"));
// 	System.out.println(no_ask);
	MemberDAO dao_2 = new MemberDAO();
	MemberDTO dto_2 = dao_2.getSelectOneNo(no);
	MemberDTO dto2 = dao_2.getSelectAsk(no_ask); 
	
	MemberDTO dto2_answer = dao_2.getSelectAnswer(no_ask);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의 답변하기</title>
</head>
<body>

<script>
	function answer(){
		if(document.answerForm.subject.value.trim() ==""){
			alert('제목을 입력해주세요.')
			document.answerForm.subject.focus();
			return false;
		}else if(document.answerForm.content.value.trim() ==""){
			alert('내용을 입력해주세요.')
			document.answerForm.content.focus();
			return false;
		}else if(confirm('답변 하시겠습니까?')){
			document.answerForm.method="post";
			document.answerForm.action="member_answerProc.jsp";
			document.answerForm.submit();
		}
	}
	function answerUpdate(){
		if(document.answerUpdateForm.subject.value.trim() ==""){
			alert('제목을 입력해주세요.')
			document.answerUpdateForm.subject.focus();
			return false;
		}else if(document.answerUpdateForm.content.value.trim() ==""){
			alert('내용을 입력해주세요.')
			document.answerUpdateForm.content.focus();
			return false;
		}else if(confirm('수정 하시겠습니까?')){
			document.answerUpdateForm.method="post";
			document.answerUpdateForm.action="member_answerUpdate.jsp";
			document.answerUpdateForm.submit();
		}
	
	}
	function answerRemove(value1,value2){
		if(confirm('정말 답변을 삭제하시겠습니까?')){
			location.href="member_answerDelete.jsp?no_ask="+value1+"&no_member="+value2;
		}
	}
	function askRemove(value1,value2){
		if(confirm('정말 문의글을 삭제하시겠습니까?')){
			location.href="member_askDelete.jsp?no_ask="+value1+"&no_member="+value2;
		}
	}
</script>

	<table border="1">
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
				<form>
				<h2>문의 답변하기</h2>
			
					<table border="1" width="1000" >
					<tr>
							<td>No</td>
							<td><%=dto2.getNo()%></td>
						</tr>
						<tr>
							<td>아이디</td>
							<td><%=dto2.getId()%></td>
						</tr>
						<tr>
							<td>상담분류</td>
							<td><%=dto2.getBunryu()%></td>
						</tr>
							
						<tr>
							<td>제목</td>
							<td><%=dto2.getSubject()%></td>
						</tr>
						<tr>
							<td>내용</td>
							<td><%=dto2.getContent()%></td>
						</tr>
						<tr>
							<td>문의날짜</td>
							<td><%=dto2.getRegidate()%></td>
						</tr>
					</table>
				</form>
			</td>
		</tr>
		<tr>
			<td>
			<% if(dto2.getAnswer().equals("X")){%>
				└[Re]
				<form name="answerForm">					
					<input type="hidden" name="no_member" value="<%=no%>">
					<input type="hidden" name="no" value="<%=dto2.getNo()%>">
					<input type="hidden" name="id" value="<%=dto_2.getId()%>">
					
					<table border="1" width="1000">
						<tr>
							<td>아이디</td>
							<td><input type="hidden" name="rank" value="<%=dto_2.getId() %> [<%=rank %>]"><%=dto_2.getId() %> [<%=rank %>]</td>
						</tr>
						<tr>
							<td>제목</td>
							<td><input type="text" name="subject" value="[re]<%=dto2.getSubject()%>"></td>
						</tr>
						<tr>
							<td>내용</td>
							<td><textarea name="content" style="width:300px; height:100px;"></textarea></td>
						</tr>
					</table>
					<br>
					<button type="button" onclick="answer();">답변하기</button>
					<button type="button" onclick="askRemove('<%=dto2.getNo()%>','<%=no%>');">문의 삭제하기</button>
				</form>
				<%}else{ %>
				└[Re]
				<form name="answerUpdateForm">					
					<input type="hidden" name="no_member" value="<%=no%>">
					<input type="hidden" name="no" value="<%=dto2.getNo()%>">
					<input type="hidden" name="id" value="<%=dto_2.getId()%>">
					
					<table border="1" width="1000">
						<tr>
							<td>아이디</td>
							<td><input type="hidden" name="rank" value="<%=dto_2.getId() %> [<%=rank %>]"><%=dto_2.getId() %> [<%=rank %>]</td>
						</tr>
						<tr>
							<td>제목</td>
							<td><input type="text" name="subject" value="[re]<%=dto2.getSubject()%>"></td>
						</tr>
						<tr>
							<td>내용</td>
							<td><textarea name="content" style="width:300px; height:100px;"><%=dto2_answer.getContent() %></textarea></td>
						</tr>
					</table>
					<br>
					<button type="button" onclick="answerUpdate();">수정하기</button>
					<button type="button" onclick="answerRemove('<%=dto2.getNo()%>','<%=no%>');">답변 삭제하기</button>
					<button type="button" onclick="askRemove('<%=dto2.getNo()%>','<%=no%>');">문의 삭제하기</button>
				</form>
				<%} %>
			</td>
		</tr>
		<tr>
			<td colspan="1"><%@ include file="../include/include_bottom.jsp" %></td>
		</tr>
	</table>
</body>
</html>