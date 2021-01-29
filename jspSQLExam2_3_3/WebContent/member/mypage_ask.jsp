<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/include_import.jsp" %>
<%@ include file="../include/include_check/include_check.jsp" %>
<%@ include file="../include/include_check/include_session.jsp" %>
<%@ include file="../include/include_check/include_session_check.jsp" %>
 
<%
	int no = Integer.parseInt(request.getParameter("no"));
	MemberDAO dao_2 = new MemberDAO();
	MemberDTO dto_2 = dao_2.getSelectOneNo(no);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의하기</title>
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
				<form name="askForm">
				<h2>1:1문의</h2>
			
					<table border="1" width="1000" >
						<tr>
							<td>아이디</td>
							<td><input type="text" name="id" value="<%=dto_2.getId()%>" readonly></td>
						</tr>
						<tr>
							<td>상담분류</td>
							<td>
								<select name ="bunryu" >
									<option value="구매">구매
									<option value="배송">배송
								</select>
							</td>
						</tr>
							
						<tr>
							<td>제목</td>
							<td><input type="text" name="subject" value=""></td>
						</tr>
						<tr>
							<td>내용</td>
							<td><textarea name="content" style="width:300px; height:100px;"></textarea></td>
						</tr>
					</table>
					<br>
					<button type="button" onclick="ask();">보내기</button>
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
	function ask(){
		if(document.askForm.subject.value.trim() == ""){
			alert('제목을 입력해주세요.')
			document.askForm.subject.focus();
			return false;
		}else if(document.askForm.content.value.trim() ==""){
			alert('내용을 입력해주세요.')
			document.askForm.content.focus();
			return false;
		}else if(confirm('문의를 보내시겠습니까?')){
			document.askForm.method="post";
			document.askForm.action="mypage_askProc.jsp";
			document.askForm.submit();
		}
	}
</script>