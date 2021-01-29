<%@page import="java.net.Inet4Address"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="etc.member.MemberDAO" %>
<%@ page import="etc.member.MemberDAOImplOracle" %>
<%@ page import="etc.member.MemberDTO" %>
<%@ include file="../include/include_check.jsp" %>
<%@ include file="../include/include_session.jsp" %>
<%@ include file="../include/include_menu.jsp" %>

 <%
 	String id = request.getParameter("id");
 	System.out.print(id);
 	 dao = new MemberDAOImplOracle();
 	 dto = dao.getSelectOne(id);
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세보기</title>
</head>
<body>
	<h2>회원 상세정보</h2>
	<form name="viewForm">
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
		<br>
		<button type="button" onclick="sujeong('<%=dto.getPw()%>');">수정하기</button>
		<button type="button" onclick="remove('<%=dto.getPw()%>');">삭제하기</button>
		<button type="button" onclick="location.href='list.jsp';">목록</button>
	</form>
</body>
</html>
<script>
	function sujeong(value1){
		if(document.viewForm.pw.value != value1){
			alert('비밀번호가 다릅니다.')
			location.href="view.jsp?id="+document.deleteForm.id.value;
		}else if(confirm('수정 페이지로 가시겠습니까?')){
			location.href="update.jsp?id="+document.viewForm.id.value;
		}
	}
	
	function remove(value1){
		if(document.viewForm.pw.value != value1){
			alert('비밀번호가 다릅니다.')
			location.href="view.jsp?id="+document.deleteForm.id.value;
		}else if(confirm('삭제 페이지로 가시겠습니까?')){
			location.href="delete.jsp?id="+document.viewForm.id.value;
		}
	}
</script>