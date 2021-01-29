<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>

<%@ page import="member.MemberDAO"%>    
<%@ page import="member.MemberDTO"%>

<%
	MemberDAO dao = new MemberDAO();
	ArrayList<MemberDTO> list = dao.getSelectAll();
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원리스트</title>
</head>
<body>
	<h2>회원정보</h2>
	<table border="1" width="1000">
		<tr>
			<td>번호</td>
			<td>아이디</td>
			<td>비밀번호</td>
			<td>이름</td>
			<td>주민번호</td>
			<td>전화번호</td>
			<td>이메일</td>
			<td>성별</td>
			<td>나이</td>
			<td>가입일</td>
		</tr>
		<% for(int i=0; i<list.size(); i++){
			MemberDTO dto = list.get(i);
		
		%>
		<tr>
			<td><%=dto.getNo()%></td>
			<td><%=dto.getId()%></td>
			<td><%=dto.getPassword()%></td>
			<td>
				<a href="#" onclick="view('<%=dto.getId()%>');"><%=dto.getName()%></a>
			</td>
			<td><%=dto.getSid()%></td>
			<td><%=dto.getPhone()%></td>
			<td><%=dto.getEmail()%></td>
			<td><%=dto.getGender()%></td>
			<td><%=dto.getAge()%></td>
			<td><%=dto.getWdate()%></td>
		</tr>
		<%} %>
	</table>
	<button type="button" onclick="location.href='member.jsp';">가입하기</button>
</body>
</html>

<script>
function view(value1){
	location.href='view.jsp?id='+value1;
}
</script>