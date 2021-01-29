<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>

<%@ page import="member.MemberDAO"%>    
<%@ page import="member.MemberDTO"%>

<%	String id = request.getParameter("id");
	MemberDAO dao = new MemberDAO();

	MemberDTO dto = dao.getSelectOne(id);
%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정하기</title>
</head>
<body>
	<h2>수정하기</h2>
	<form name="go">
		<table>
			<tr>
				<td>아이디</td>
				<td> 
					<input type="text" name="id" value="<%=dto.getId()%>" readonly>
				</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td> 
					<input type="password" name="password">
				</td>
			</tr>
			<tr>
				<td>비밀번호 확인</td>
				<td> 
					<input type="password" name="passwordcheck">
				</td>
			</tr>
			<tr>
				<td>이름</td>
				<td> 
					<input type="text" name="name"value="<%=dto.getName()%>">
				</td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td> 
					<input type="text" name="phone" value="<%=dto.getPhone()%>"> ex) 010-1111-1111 
				</td>
			</tr>
			<tr>
				<td>이메일</td>
				<td> 
					<input type="text" name="email" value="<%=dto.getEmail()%>">
				</td>
			</tr>
		</table>
		<br>
		<button type="button" onclick="save();">수정하기</button>
	</form>
</body>
</html>

<script>
 function save(){
	  if(document.go.password.value.trim()==""){
			alert("비밀번호를 입력하세요.")
			document.go.password.select();
			document.go.password.focus();
			return false;
	 }else  if(document.go.password.value.trim()!=document.go.passwordcheck.value.trim()){
			alert("비밀번호가 다릅니다.")
			document.go.passwordcheck.select();
			document.go.passwordcheck.focus();
			return false;
	 }else  if(document.go.name.value.trim()==""){
			alert("이름을 입력하세요.")
			document.go.name.select();
			document.go.name.focus();
			return false;
 	 }else  if(document.go.phone.value.trim()==""){
			alert("전화번호를 입력하세요.")
			document.go.phone.select();
			document.go.phone.focus();
			return false;
 	 }else  if(document.go.email.value.trim()==""){
			alert("이메일를 입력하세요.")
			document.go.email.select();
			document.go.email.focus();
			return false;
 	 }else if(confirm('수정 하시겠습니까?')){
	 		 document.go.method='post';
	 		 document.go.action='updateProc.jsp';
	 		 document.go.submit();
 	 }
	 
	 
	 
 }
</script>