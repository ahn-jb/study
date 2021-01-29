<%@page import="java.net.Inet4Address"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.member.MemberDAO" %>
<%@ page import="model.member.MemberDTO" %>
<%@ include file="../include/include_check/include_check.jsp" %>
<%@ include file="../include/include_check/include_session.jsp" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>삭제하기</title>
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
				<form name="deleteForm">
				<h2>회원 탈퇴</h2>
				<input type="hidden" name="ip" value="<%=Inet4Address.getLocalHost().getHostAddress()%>">
			 <%
				 int no = Integer.parseInt(request.getParameter("no"));
			 	 MemberDAO dao2 = new MemberDAO();
			 	 MemberDTO dto2 = dao2.getSelectOne(no);
			 %>
					<table>
							<tr>
								<td>등급:</td>
								<td><input type="text" name="grade" value="<%=dto2.getGrade()%>" ></td>
							</tr>
							<tr>
								<td>아이디:</td>
								<td><input type="text" name="id" value="<%=dto2.getId()%>" readonly></td>
							</tr>
							<tr>
								<td>비밀번호:</td>
								<td><input type="password" name="pw"></td>
							</tr>
							<tr>
								<td>이름:</td>
								<td><input type="text" name="name" value="<%=dto2.getName()%>"></td>
							</tr>
							<tr>
								<td>성별:</td>
								<td>
									<input type="text" name="gender" value="<%=dto2.getGender() %>" readonly>
								</td>
							</tr>
							<tr>
								<td>생년:</td>
								<td><input type="text" name="job" value="<%=dto2.getBornYear()%>" readonly></td>
							</tr>
						</table>
					<br><br>
					<table border="1">
						<tr>
							<td>탈퇴를 원하시면 따라적어주세요. </td>
						</tr>
						<tr>
							<td><input type="text" name="text1" value="탈퇴하겠습니다" readonly></td>
						</tr>
						<tr>
							<td><input type="text" name="text2" ></td>
						</tr>
					</table>
					<br>
					<button type="button" onclick="remove('<%=dto2.getPw()%>','<%=dto2.getNo()%>');">삭제하기</button>
					<button type="button" onclick="location.href='list.jsp';">취소</button>
				
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
	function remove(value1,value2){
		if(document.deleteForm.pw.value != value1){
			alert('비밀번호가 다릅니다.')
			location.href="delete.jsp?no="+value2;
		}else if(document.deleteForm.text1.value != document.deleteForm.text2.value){
			alert('잘못 입력하셨습니다.')
			document.deleteForm.text2.fucus();
			return false;
		}else if(confirm('탈퇴 하시겠습니까?')){
			location.href="deleteProc.jsp?no="+value2;
		}
	}
	
</script>