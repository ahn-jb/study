<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%request.setCharacterEncoding("UTF-8"); %>
 <%@ page import="resume.ResumeDTO" %>
 <%@ page import="resume.ResumeImpl" %>    

 <%
 	int no = Integer.parseInt(request.getParameter("no"));
 	ResumeImpl dao = new ResumeImpl();
 	ResumeDTO dto = dao.getSelectOne(no);
 %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정하기</title>
</head>
<body>
	<h2>이 력 서</h2>
	<form name="updateForm" >
		<h5>-인적사항</h5>
		<table border="1" width="550">
			<tr>
				<td rowspan="4"><input type="text" name="pic" value="<%=dto.getPic() %>"></td>
				<td>성 명</td>
				<td><input type="text" name="name" value="<%=dto.getName() %>" readonly></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="text" name="email" value="<%=dto.getEmail() %>"></td>
			</tr>
			<tr>
				<td>휴대폰</td>
				<td><input type="text" name="phone" value="<%=dto.getPhone() %>"></td>
			</tr>
			<tr>
				<td>주 소</td>
				<td><input type="text" name="adress" value="<%=dto.getAdress() %>"></td>
			</tr>
		</table><br><br>
		<h5>-학력사항</h5>
		<table border="1" width="550">
			<tr>
				<td>기간</td>
				<td>학교명</td>
				<td>전공(학과)</td>
			</tr>
			<tr>
				<td><input type="text" name="gigan1" value="<%=dto.getGigan1() %>"></td>
				<td><input type="text" name="school1" value="<%=dto.getSchool1() %>"></td>
				<td><input type="text" name="jeongong1" value="<%=dto.getJeongong1() %>"></td>
			</tr>
			<tr>
				<td><input type="text" name="gigan2" value="<%=dto.getGigan2() %>"></td>
				<td><input type="text" name="school2" value="<%=dto.getSchool2() %>"></td>
				<td><input type="text" name="jeongong2" value="<%=dto.getJeongong2() %>"></td>
			</tr>
			<tr>
				<td><input type="text" name="gigan3" value="<%=dto.getGigan3() %>"></td>
				<td><input type="text" name="school3" value="<%=dto.getSchool3() %>"></td>
				<td><input type="text" name="jeongong3" value="<%=dto.getJeongong3() %>"></td>
			</tr>
			<tr>
				<td><input type="text" name="gigan4" value="<%=dto.getGigan4() %>"></td>
				<td><input type="text" name="school4" value="<%=dto.getSchool4() %>"></td>
				<td><input type="text" name="jeongong4" value="<%=dto.getJeongong4() %>"></td>
			</tr>
		</table><br><br>
		<h5>-어학능력</h5>
		<table border="1" width="550">
			<tr>
				<td rowspan="2">어학</td>
				<td>Toeic</td>
				<td><input type="text" name="toeic"  value="<%=dto.getToeic()%>">점</td>
				<td>일본어</td>
				<td><input type="text" name="japan"  value="<%=dto.getJapan()%>">급</td>
			</tr>
			<tr>
				<td>Toefl</td>
				<td><input type="text" name="toefl" value="<%=dto.getToefl()%>">점</td>
				<td>중국어</td>
				<td><input type="text" name="china" value="<%=dto.getChina()%>">급</td>
			</tr>
		</table>
		<button type="button" onclick="go('<%=dto.getNo()%>');">수정하기</button>
	</form>
</body>
</html>
<script>
	function go(value1){
		document.updateForm.method="post";
		document.updateForm.action="updateProc.jsp?no="+value1;
		document.updateForm.submit();
	}
</script>