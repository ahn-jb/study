<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <% request.setCharacterEncoding("UTF-8"); %>
  <%@ page import="board.BoardDAO" %>
  <%@ page import="board.BoardDTO" %>
  
  <%
  	String no_ =request.getParameter("no");
 	int no = Integer.parseInt(no_);
 	
 	
 	BoardDAO dao = new BoardDAO();
 	dao.setUpdateHit(no);
 	BoardDTO dto = dao.getSelectOne(no);
 	
  %>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 보기</title>
</head>
<body>
	<h2>게시글 보기</h2>
	<form name="viewForm">
	<table border="1" width="600" align="left">
		<tr>
			<td width="100px">작성자:</td>
			<td><%=dto.getWriter() %></td>
		</tr>
		<tr>
			<td width="100px">이메일:</td>
			<td><%=dto.getEmail() %></td>
		</tr>
		<tr>
			<td width="100px">제목:</td>
			<td><%=dto.getSubject() %></td>
		</tr>
		<tr height="200">
			<td width="100px">내용:</td>
			<td><%=dto.getContent() %></td>
		</tr>
		<tr>
			<td width="100px">작성일:</td>
			<td><%=dto.getRegiDate() %></td>
		</tr>
		<tr>
			<td width="100px">비밀번호:</td>
			<td><input type="password" name="passwd" value=""></td>
		</tr>
		<tr>
		
			<td colspan="2">
				<a href="#" onclick="move('A','<%=dto.getNo()%>','<%=dto.getPasswd()%>')">[답변하기]</a>
				&nbsp;&nbsp;
				<a href="#" onclick="move('M','<%=dto.getNo()%>','<%=dto.getPasswd()%>')">[수정하기]</a>
				&nbsp;&nbsp;
				<a href="#" onclick="move('D','<%=dto.getNo()%>','<%=dto.getPasswd()%>')">[삭제하기]</a>
				&nbsp;&nbsp;
				<a href="list.jsp">[게시판]</a>
			</td>
		</tr>
		
	</table>
		
	</form>
</body>
</html>
<script>
	function move(value1,value2,value3){
		if(value1=='A'){
			location.href='write.jsp?no='+value2;
		}
		
		if(value1=='M'){
			if(document.viewForm.passwd.value.trim() ==""){
				alert('비밀번호를 입력해주세요.')
				
				document.viewForm.passwd.focus();
				return false;
			}else if(document.viewForm.passwd.value != value3){
				alert('비밀번호가 다릅니다.')
				
				document.viewForm.passwd.focus();
				return false;
			}else if(document.viewForm.passwd.value == value3){
				confirm('수정하시겠습니까?')
				location.href='modify.jsp?no='+value2
			}
		}
		if(value1=='D'){
			if(document.viewForm.passwd.value.trim() ==""){
				alert('비밀번호를 입력해주세요.')
				
				document.viewForm.passwd.focus();
				return false;
			}else if(document.viewForm.passwd.value != value3){
				alert('비밀번호가 다릅니다.')
				
				document.viewForm.passwd.focus();
				return false;
			}else if(document.viewForm.passwd.value == value3){
				confirm('정말 삭제 하시겠습니까?')
				location.href='delete.jsp?no='+value2;
			}
			
		}
	}
</script>