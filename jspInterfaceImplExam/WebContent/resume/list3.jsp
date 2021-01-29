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
<title>이미지 리스트</title>
</head>
<body>
	<h2>이미지 목록</h2>
	<form name="listForm">
		<table border="1">
			<tr>
				
			<%		
				int loop = list.size();
				while(loop% 3 !=0){
					loop+=1;	
				}
				for(int i=0; i<loop; i++){
					int j =0;
			%>
			<%  				
				if(loop%3 ==0){
					
				}
				ResumeDTO dto = list.get(i);
			%>
				<td>
					<a href="#" onclick="view('<%=dto.getNo()%>');">
					<img src="../img/<%=dto.getPic()%>" style="width:100px; height:100px;">
					</a>
					<br><%=dto.getName()%><br><%=dto.getPhone()%>
			
			 <%	if(i%3==2){%>
			 		</td></tr><tr>
			 	
					<%}
					 	
					 %>	
					
					<%}%>
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