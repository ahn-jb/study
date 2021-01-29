<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%request.setCharacterEncoding("UTF-8"); %>
 <%@ page import="resume.ResumeDTO" %>
 <%@ page import="resume.ResumeImpl" %>
 
 <%
 	ResumeImpl dao = new ResumeImpl();
 	ArrayList<ResumeDTO> list = dao.getSelectAll();
 %>
 
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 리스트</title>
</head>
<body>
	<h2>회원 목록</h2>
	<form name="listForm">
		<table border="1">
			<tr>
				<td>사진</td>
				<td>이름</td>
				<td>이메일</td>
				<td>휴대폰</td>
				<td>주소</td>
				<td>토익</td>
				<td>토플</td>
				<td>일본어</td>
				<td>중국어</td>
				<td>기간1</td>
				<td>학교명1</td>
				<td>전공1</td>
				<td>기간2</td>
				<td>학교명2</td>
				<td>전공2</td>
				<td>기간3</td>
				<td>학교명3</td>
				<td>전공3</td>
				<td>기간4</td>
				<td>학교명4</td>
				<td>전공4</td>
			</tr>
			<%
				for(int i=0; i<list.size(); i++){
					ResumeDTO dto = list.get(i);
				
			%>
			<tr>
				<td><a href="#" onclick="view('<%=dto.getNo()%>');"><img src="<%=dto.getPic()%>" style="width:100px; height:100px;"></a></td>
				<td><%=dto.getName()%></td>
				<td><%=dto.getEmail()%></td>
				<td><%=dto.getPhone()%></td>
				<td><%=dto.getAdress()%></td>
				<td><%=dto.getToeic()%></td>
				<td><%=dto.getToefl()%></td>
				<td><%=dto.getJapan()%></td>
				<td><%=dto.getChina()%></td>
				<td><%=dto.getGigan1()%></td>
				<td><%=dto.getSchool1()%></td>
				<td><%=dto.getJeongong1()%></td>
				<td><%=dto.getGigan2()%></td>
				<td><%=dto.getSchool2()%></td>
				<td><%=dto.getJeongong2()%></td>
				<td><%=dto.getGigan3()%></td>
				<td><%=dto.getSchool3()%></td>
				<td><%=dto.getJeongong3()%></td>
				<td><%=dto.getGigan4()%></td>
				<td><%=dto.getSchool4()%></td>
				<td><%=dto.getJeongong4()%></td>
			</tr>
			<%} %>
		</table>
		<button type="button" onclick="location.href='write.jsp';">이력서 쓰기</button>		
		<button type="button" onclick="location.href='list.jsp';">회원 리스트</button>
		<button type="button" onclick="location.href='list2.jsp';">이력서 리스트</button>
		<button type="button" onclick="location.href='list3.jsp';">이미지 리스트</button>
	</form>
</body>
</html>
<script>
	function view(value1){
		document.listForm.method="post";
		document.listForm.action="view.jsp?no="+value1;
		document.listForm.submit();
	}
</script>