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
<title>상세보기</title>
</head>
<body>
	<h2>이 력 서</h2>
	<form name="viewForm" >
		<h5>-인적사항</h5>
		<table border="1" width="550">
			<tr>
				<td rowspan="4" width="120"><img src="../img/fluit/<%=dto.getPic()%>" style="width:100px; height:100px;"> </td>
				<td style="background-color : gray;" width="150">성 명</td>
				<td ><%=dto.getName() %></td>
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
		</table><br>
		<button type="button" onclick="update('<%=dto.getNo()%>');">수정하기</button>
		<button type="button" onclick="remove('<%=dto.getNo()%>');">지우기</button>
	</form>
</body>
</html>
<script>
	function update(value1){
		if(confirm('수정하시겠습니까?')){
			document.viewForm.method="post";
			document.viewForm.action="update.jsp?no="+value1;
			document.viewForm.submit();
		}
	}
	function remove(value1){
		if(confirm('삭제하시겠습니까?')){
			document.viewForm.method="post";
			document.viewForm.action="delete.jsp?no="+value1;
			document.viewForm.submit();
		}
	}
</script>