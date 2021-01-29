<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="memo.MemoDTO"%>
<%@page import="memo.MemoDAO"%>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="dto" class="memo.MemoDTO" scope="page"></jsp:useBean>
<jsp:setProperty name="dto" property="*" />

<%
	MemoDAO dao = new MemoDAO();
	
	if(dto.getName() !=null){
		int result = dao.setInsert(dto);
		
		if(result >0){
			out.println("<script>");
			out.println("alert('메모입력 완료.');");
			out.println("location.href='../memo/memo.jsp';");
			out.println("</script>");

			}else {
			out.println("<script>");
			out.println("alert('처리중 오류가 발생했습니다.');");
			out.println("location.href='../memo/memo.jsp';");
			out.println("</script>");
		}
	}
	ArrayList<MemoDTO> list= dao.getselectAll(); 
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메모</title>
</head>
<body>
	<script>
		function go(){
			document.memoForm.method="post";
			document.memoForm.action="memo.jsp";
			document.memoForm.submit();
		}
	</script>
	<h2>메모장</h2>
	<form name= "memoForm">
	이름 : <input type="text" name="name"> <br>
	메모 : <input type="text" name="memo"> <button type="button" onclick="go()">확인</button>
	</form>
	<table border="1" width="400">
		<tr>
			<td>ID</td>
			<td>이름</td>
			<td>메모</td>
			<td>날짜</td>
		</tr>
		<%for(int i=0; i<list.size(); i++){
			MemoDTO dto1 =list.get(i); %>
		<tr>
			<td><%=dto1.getId() %></td>
			<td><%=dto1.getName() %></td>
			<td><a href="../memo/view.jsp?id=<%=dto1.getId()%>"><%=dto1.getMemo() %></a></td>
			<td><%=dto1.getRegidate() %></td>
		</tr>
		<%} %>
	</table>
</body>
</html>