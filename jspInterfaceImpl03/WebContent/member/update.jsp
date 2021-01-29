<%@page import="model.member.MemberExample"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 	request.setCharacterEncoding("UTF-8");
 %>   
<%@ page import="model.member.MemberDTO" %>
<%
	String id = request.getParameter("id");
	MemberExample dao = new MemberExample();
	MemberDTO dto = dao.getSelectOne(id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보수정</title>
</head>
<body>
	<h2>정보수정</h2>
	<form name="joinForm">
		<table border="1">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="id" value="<%=dto.getId()%>" readonly></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pwd" ></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><input type="text" name="phone" value="<%=dto.getPhone()%>"></td>
			</tr>
			<tr>
				<td>직업</td>
				<td>
				<input type="radio" name="job" value="공무원" <%if(dto.getJob().equals("공무원")){out.println("checked");} %>	>공무원
				<input type="radio" name="job" value="개발자"	 <%if(dto.getJob().equals("개발자")){out.println("checked");} %>>개발자			
				<input type="radio" name="job" value="군인"	 <%if(dto.getJob().equals("군인")){out.println("checked");} %>>군인			
				<input type="radio" name="job" value="디자이너"<%if(dto.getJob().equals("디자이너")){out.println("checked");} %>>디자이너		
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center"><button type="button" onclick="save();">수정하기</button></td>
			</tr>
		</table>
	</form>
</body>
</html>
<script>
	function save(){
		if(document.joinForm.id.value.trim() ==""){
			alert('아이디를 입력해 주세요.');
			document.joinForm.id.focus();
			return false;
		}else if(document.joinForm.pwd.value.trim() ==""){
			alert('비밀번호를 입력해 주세요.');
			document.joinForm.pwd.focus();
			return false;
		}else if(document.joinForm.name.value.trim() ==""){
			alert('이름를 입력해 주세요.');
			document.joinForm.name.focus();
			return false;
		}else if(document.joinForm.phone.value.trim() ==""){
			alert('전화번호를 입력해 주세요.');
			document.joinForm.phone.focus();
			return false;
		}else if(document.joinForm.job.value.trim() ==""){
			alert('직업을 선택해 주세요.');
			document.joinForm.job.focus();
			return false;
		}else if(confirm('이 정보로 가입하시겠습니까? ')){
			document.joinForm.method='post';
			document.joinForm.action='UpdateProc.jsp';
			document.joinForm.submit();
			
		}
	}
</script>