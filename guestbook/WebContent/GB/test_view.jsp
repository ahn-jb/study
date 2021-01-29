<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <% request.setCharacterEncoding("UTF-8"); %>
 <%@ page import="guestbook.GbDTO" %>
 <%@ page import="guestbook.GbDAO" %>
 <jsp:useBean id="dto" class="guestbook.GbDTO" scope="page"></jsp:useBean>
 <jsp:setProperty property="*" name="dto"/>
 
 <% 	
 	GbDAO dao = new GbDAO();
 	if(dto.getName() != null){
 		int result = dao.setInsert(dto);
 		
 		if(result >0){
			out.println("<script>");
			out.println("alert('방명록 등록 완료.');");
			out.println("location.href='../GB/test_view.jsp';");
			out.println("</script>");

			}else {
			out.println("<script>");
			out.println("alert('처리중 오류가 발생했습니다.');");
			out.println("location.href='../GB/test_view.jsp';");
			out.println("</script>");
		}
 	}
 	
 	String bunryu = request.getParameter("bunryu");
 	String search = request.getParameter("search");
 	
	ArrayList<GbDTO> list = dao.getSelectAll(bunryu,search);
	
 	int count = dao.getCount(bunryu,search);
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록</title>
</head>
<body>
	
	<h2>방명록</h2><br><br>
	<form name="searchForm">
		<select name="bunryu">
			<option value="name">이름
			<option value="content">내용
			<option value="write_date">날짜
		</select>
		<input type="text" name="search" style="width:350;">
		<button type="button" onclick="go();">검색</button> 날짜검색 ex) 21/01/14 
	</form><br>
	<button type="button" onclick="location.href='test.jsp';">글쓰기</button><br><br>
	'<%=count%>'개의 글이 있습니다
	<%for(int i=0; i<list.size(); i++){ %>
		<%GbDTO dto2 = list.get(i);%>
		<table border="1" width="1000">
			<tr>
				<td>이름</td>
				<td><%=dto2.getName() %></td>
				<td>날짜</td>
				<td><%=dto2.getWrite_date() %> </td>
			</tr>
			<tr>
				<td>이메일</td>
				<td colspan="3"><%=dto2.getEmail() %></td>
			</tr>
			<tr>
				<td colspan="4"><%=dto2.getContent() %></td>
			</tr>
		</table>
	<%} %>
<script>
	function go(){
		location.href="test_view.jsp?bunryu="+document.searchForm.bunryu.value+"&search="+document.searchForm.search.value;
	}
</script>
</body>
</html>