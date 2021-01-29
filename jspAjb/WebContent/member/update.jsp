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
<title>상세보기</title>
</head>
<body>
	<h2>회원 상세정보</h2>
	<form name="updateForm">
	<input type="hidden" name="ip" value="<%=Inet4Address.getLocalHost().getHostAddress()%>">
		<table>
			<tr>
				<td>등급:</td>
				<td><input type="text" name="grade" value="<%=dto.getGrade()%>" ></td>
			</tr>
			<tr>
				<td>아이디:</td>
				<td><input type="text" name="id" value="<%=dto.getId()%>" readonly></td>
			</tr>
			<tr>
				<td>비밀번호:</td>
				<td><input type="password" name="pw"></td>
			</tr>
			<tr>
				<td>비밀번호 확인:</td>
				<td><input type="password" name="pwcheck"></td>
			</tr>
			<tr>
				<td>닉네임:</td>
				<td><input type="text" name="nickname" value="<%=dto.getNickname()%>" ></td>
			</tr>
			<tr>
				<td>이름:</td>
				<td><input type="text" name="name" value="<%=dto.getName()%>" ></td>
			</tr>
			<tr>
				<td>이메일:</td>
				<td><input type="text" name="email" value="<%=dto.getEmail()%>" ></td>
			</tr>
			<tr>
				<td>전화번호:</td>
				<td><input type="text" name="phone" value="<%=dto.getPhone()%>" ></td>
			</tr>
			<tr>
				<td>주소:</td>
				<td><input type="text" name="address" value="<%=dto.getAddress()%>" ></td>
			</tr>
			<tr>
				<td>성별:</td>
				<td>
					<input type="text" name="gender" value="<%=dto.getGender() %>" readonly>
				</td>
			</tr>
			<tr>
				<td>직업:</td>
				<td><input type="text" name="job" value="<%=dto.getJob()%>" ></td>
			</tr>
		</table>
		<br>
		<button type="button" onclick="sujeong();">수정하기</button>
		<button type="button" onclick="location.href='list.jsp';">취소</button>
	</form>
</body>
</html>
<script>
	function sujeong(){
		
		 if(document.updateForm.pw.value.trim() ==""){
			alert('비밀번호를 입력하세요.')
			document.updateForm.pw.fucus();
			return false;
		}else if(document.updateForm.pw.value != document.updateForm.pwcheck.value){
			alert('비밀번호가 다릅니다.')
			document.updateForm.pwcheck.fucus();
			return false;
		}else if(document.updateForm.nickname.value.trim() ==""){
			alert('닉네임를 입력하세요.')
			document.updateForm.nickname.fucus();
			return false;
		}else if(document.updateForm.name.value.trim() ==""){
			alert('이름을 입력하세요.')
			document.updateForm.name.fucus();
			return false;
		}else if(document.updateForm.email.value.trim() ==""){
			alert('이메일를 입력하세요.')
			document.updateForm.email.fucus();
			return false;
		}else if(document.updateForm.phone.value.trim() ==""){
			alert('전화번호를 입력하세요.')
			document.updateForm.phone.fucus();
			return false;
		}else if(document.updateForm.address.value.trim() ==""){
			alert('주소를 입력하세요.')
			document.updateForm.address.fucus();
			return false;
		}else if(document.updateForm.job.value.trim() ==""){
			alert('직업을 입력하세요.')
			document.updateForm.job.fucus();
			return false;
		}else if(confirm('이 정보로 수정 하시겠습니까?')){
			document.updateForm.method='post';
			document.updateForm.action='updateProc.jsp';
			document.updateForm.submit();
		}
	}
	

</script>