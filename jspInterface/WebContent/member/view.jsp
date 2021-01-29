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
	<form name="view">
		<input type="hidden" name="pw" value="<%=dto.getPassword()%>">
		<input type="hidden" name="no" value="<%=dto.getNo()%>">
		
		<table>
			<tr>
				<td>아이디</td>
				<td> 
					<input type="hidden" name="id" value="<%=dto.getId()%>"><%=dto.getId()%>
				</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td> 
					<input type="password" name="password" value="">
				</td>
			</tr>
			<tr>
				<td>이름</td>
				<td> 
					<%=dto.getName()%>
				</td>
			</tr>
			<tr>
				<td>주민번호</td>
				<td> 
					<%=dto.getSid()%>
				</td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td> 
					<%=dto.getPhone()%>
				</td>
			</tr>
			<tr>
				<td>이메일</td>
				<td> 
					<%=dto.getEmail()%>
				</td>
			</tr>
			<tr>
				<td>
					<button type="button" onclick="go();">수정하기</button>
					<button type="button" onclick="remove();">탈퇴하기</button>
				</td>
			</tr>
		</table>
		
		
	</form>
</body>
</html>

<script>
 function go(){
	if(	document.view.pw.value != document.view.password.value){
		alert('비밀번호가 틀립니다.');
		history.back();
	}else if(confirm('수정페이지로 가시겠습니까?')){
	 		 document.view.method='post';
	 		 document.view.action='update.jsp?id='+document.view.id.value;
	 		 document.view.submit();
 	 }
	
	 
	 
 }
 function remove(){
	 if(document.view.pw.value != document.view.password.value){
			alert('비밀번호가 틀립니다.');
			history.back();
		}else if(confirm('정말 탈퇴 하시겠습니까?')){
	 		 document.view.method='post';
	 		 document.view.action='delete.jsp?id='+document.view.id.value+'&no='+document.view.no.value;
	 		 document.view.submit();
 	 }
 }
</script>