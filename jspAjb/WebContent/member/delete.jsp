<%@page import="java.net.Inet4Address"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="etc.member.MemberDAO" %>
<%@ page import="etc.member.MemberDAOImplOracle" %>
<%@ page import="etc.member.MemberDTO" %>
<%@ include file="../include/include_check.jsp" %>
<%@ include file="../include/include_session.jsp" %>
<%@ include file="../include/include_menu.jsp" %>
<%@ include file="../include/include_access.jsp" %>

 <%
 	String id = request.getParameter("id");
 	 dao = new MemberDAOImplOracle();
 	 dto = dao.getSelectOne(id);
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>삭제하기</title>
</head>
<body>
	<h2>회원 탈퇴</h2>
	<form name="deleteForm">
	<input type="hidden" name="ip" value="<%=Inet4Address.getLocalHost().getHostAddress()%>">
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
				<td>닉네임:</td>
				<td><input type="text" name="nickname" value="<%=dto.getNickname()%>" readonly></td>
			</tr>
			<tr>
				<td>이름:</td>
				<td><input type="text" name="name" value="<%=dto.getName()%>" readonly></td>
			</tr>
			<tr>
				<td>이메일:</td>
				<td><input type="text" name="email" value="<%=dto.getEmail()%>" readonly></td>
			</tr>
			<tr>
				<td>전화번호:</td>
				<td><input type="text" name="phone" value="<%=dto.getPhone()%>" readonly></td>
			</tr>
			<tr>
				<td>주소:</td>
				<td><input type="text" name="address" value="<%=dto.getAddress()%>" readonly></td>
			</tr>
			<tr>
				<td>성별:</td>
				<td>
					<input type="text" name="gender" value="<%=dto.getGender() %>" readonly>
				</td>
			</tr>
			<tr>
				<td>직업:</td>
				<td><input type="text" name="job" value="<%=dto.getJob()%>" readonly></td>
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
		<button type="button" onclick="remove('<%=dto.getPw()%>');">삭제하기</button>
		<button type="button" onclick="location.href='list.jsp';">취소</button>
		
	</form>
</body>
</html>
<script>
	function remove(value1){
		if(document.deleteForm.pw.value != value1){
			alert('비밀번호가 다릅니다.')
			location.href="delete.jsp?id="+document.deleteForm.id.value;
		}else if(document.deleteForm.text1.value != document.deleteForm.text2.value){
			alert('잘못 입력하셨습니다.')
			document.deleteForm.text2.fucus();
			return false;
		}else if(confirm('탈퇴 하시겠습니까?')){
			location.href="deleteProc.jsp?id="+document.deleteForm.id.value;
		}
	}
	
</script>