<%@page import="java.net.Inet4Address"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/include_import.jsp" %>
<%@ include file="../include/include_check/include_check.jsp" %>
<%@ include file="../include/include_check/include_session.jsp" %>
<%@ include file="../include/include_check/include_session_check.jsp" %>


<%
	int no = Integer.parseInt(request.getParameter("no"));//여기서 실행시키면 받아오는 no가 없기때문에 오류가 생김             
															//이렇게 된 이유는 세션이 cookId인데 고치기 귀찮아서 냅두어서 이렇게 됨  
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
				<form name="updateForm">
				<h2>회원 상세정보</h2>
				<input type="hidden" name="ip" value="<%=Inet4Address.getLocalHost().getHostAddress()%>">
				 <%
				 
				 	MemberDAO dao = new MemberDAO();
				 	MemberDTO dto = dao.getSelectOneNo(no);
				 	 
				 	 MemberDTO dto2 = dao.getSelectOneId(cookId);
				 %>
					<table>
							<tr>
								<td>등급:</td>
								<td>
									<%if(dto2.getGrade()==1){ %>
									<input type="text" name="grade" value="<%=dto.getGrade()%>" >
									<%}else{ %>
									<input type="text" name="grade" value="<%=dto.getGrade()%>" readonly>
									<%} %>
								</td>
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
								<td>이름:</td>
								<td><input type="text" name="name" value="<%=dto.getName()%>"></td>
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
					<button type="button" onclick="sujeong();">수정하기</button>
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
	function sujeong(){
		
		 if(document.updateForm.pw.value.trim() ==""){
			alert('비밀번호를 입력하세요.')
			document.updateForm.pw.fucus();
			return false;
		}else if(document.updateForm.pw.value != document.updateForm.pwcheck.value){
			alert('비밀번호가 다릅니다.')
			document.updateForm.pwcheck.fucus();
			return false;
		}else if(confirm('이 정보로 수정 하시겠습니까?')){
			document.updateForm.method='post';
			document.updateForm.action='updateProc.jsp';
			document.updateForm.submit();
		}
	}
	
</script>