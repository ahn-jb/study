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
<title>이력서 리스트</title>
</head>
<body>	
 <h2>이력서 목록</h2>
 <hr><br>
	<form>
		<% for(int i=0; i<list.size(); i++){
				ResumeDTO dto = list.get(i);	
		%>
		<table>
		<h2>이 력 서</h2>
			<h5>-인적사항</h5>
			<table border="1" width="550">
				<tr>
					<td rowspan="4" width="100"><img src="../img/<%=dto.getPic()%>" style="width:100px; height:100px;"> </td>
					<td style="background-color : gray;" width="150">성 명</td>
					<td><%=dto.getName() %></td>
				</tr>
				<tr>
					<td style="background-color : gray;" width="150">이메일</td>
					<td><%=dto.getEmail() %></td>
				</tr>
				<tr>
					<td style="background-color : gray;" width="150">휴대폰</td>
					<td><%=dto.getPhone() %></td>
				</tr>
				<tr>
					<td style="background-color : gray;" width="150">주 소</td>
					<td><%=dto.getAdress() %></td>
				</tr>
			</table><br><br>
			<h5>-학력사항</h5>
			<table border="1" width="550">
				<tr>
					<td style="background-color : gray;">기간</td>
					<td style="background-color : gray;">학교명</td>
					<td style="background-color : gray;">전공(학과)</td>
				</tr>
				<tr>
					<td><%=dto.getGigan1() %></td>
					<td><%=dto.getSchool1() %></td>
					<td><%=dto.getJeongong1() %></td>
				</tr>
				<tr>
					<td><%=dto.getGigan2() %></td>
					<td><%=dto.getSchool2() %></td>
					<td><%=dto.getJeongong2() %></td>
				</tr>
				<tr>
					<td><%=dto.getGigan3() %></td>
					<td><%=dto.getSchool3() %></td>
					<td><%=dto.getJeongong3() %></td>
				</tr>
				<tr>
					<td><%=dto.getGigan4() %></td>
					<td><%=dto.getSchool4() %></td>
					<td><%=dto.getJeongong4()%></td>
				</tr>
			</table><br><br>
			<h5>-어학능력</h5>
			<table border="1" width="550">
				<tr>
					<td rowspan="2" style="background-color : gray;">어학</td>
					<td style="background-color : gray;">Toeic</td>
					<td><%=dto.getToeic() %>점</td>
					<td style="background-color : gray;">일본어</td>
					<td><%=dto.getJapan() %>급</td>
				</tr>
				<tr>
					<td style="background-color : gray;">Toefl</td>
					<td><%=dto.getToefl() %>점</td>
					<td style="background-color : gray;">중국어</td>
					<td><%=dto.getChina() %>급</td>
				</tr>
			</table>
			<hr>
			<%} %>
		</table>
		<button type="button" onclick="location.href='write.jsp';">이력서 쓰기</button>		
		<button type="button" onclick="location.href='list.jsp';">회원 리스트</button>
		<button type="button" onclick="location.href='list2.jsp';">이력서 리스트</button>
		<button type="button" onclick="location.href='list3.jsp';">이미지 리스트</button>
	</form>
</body>
</html>