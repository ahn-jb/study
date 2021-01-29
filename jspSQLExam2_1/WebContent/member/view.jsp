<%@page import="java.net.Inet4Address"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/include_import.jsp" %>
<%@ include file="../include/include_check/include_check.jsp" %>
<%@ include file="../include/include_check/include_session.jsp" %>
<%@ include file="../include/include_check/include_session_check.jsp" %>

<%
	int no = Integer.parseInt(request.getParameter("no"));
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세보기</title>
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
			<form name="viewForm">
			<h2>회원 상세정보</h2>
			<input type="hidden" name="ip" value="<%=Inet4Address.getLocalHost().getHostAddress()%>">
	
			 <%
			 	
			 	MemberDAO dao = new MemberDAO();
			 	MemberDTO dto = dao.getSelectOneNo(no);
			 %>
				<table>
					<tr>
						<td>등급:</td>
						<td><input type="text" name="grade" value="<%=dto.getGrade()%>" readonly></td>
					</tr>
					<tr>
						<td>아이디:</td>
						<td><input type="text" name="id" value="<%=dto.getId()%>" readonly></td>
					</tr>
					<tr>
						<td>비밀번호:</td>
						<td><input type="password" name="pw"> 비밀번호를 입력해주세요!</td>
					</tr>
					<tr>
						<td>이름:</td>
						<td><input type="text" name="name" value="<%=dto.getName()%>" readonly></td>
					</tr>
					<tr>
						<td>성별:</td>
						<td>
							<input type="text" name="gender" value="<%=dto.getGender() %>" readonly>
						</td>
					</tr>
					<tr>
						<td>생년:</td>
						<td><input type="text" name="job" value="<%=dto.getBornYear()%>" readonly></td>
					</tr>
					
				</table>
				<br>
				<button type="button" onclick="sujeong('<%=dto.getPw()%>','<%=dto.getNo()%>');">수정하기</button>
				<button type="button" onclick="remove('<%=dto.getPw()%>');">삭제하기</button>
				<button type="button" onclick="location.href='list.jsp';">목록</button>
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
	function sujeong(value1,value2){
		if(document.viewForm.pw.value != value1){
			alert('비밀번호가 다릅니다.')
			location.href="view.jsp?no="+value2;
		}else if(confirm('수정 페이지로 가시겠습니까?')){
			location.href="update.jsp?no="+value2;
		}
	}
	
	function remove(value1){
		if(document.viewForm.pw.value != value1){
			alert('비밀번호가 다릅니다.')
			location.href="view.jsp?no="+value2;
		}else if(confirm('삭제 페이지로 가시겠습니까?')){
			location.href="delete.jsp?no="+value2;
		}
	}
</script>