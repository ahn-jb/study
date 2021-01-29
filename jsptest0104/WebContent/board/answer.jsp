<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <% request.setCharacterEncoding("UTF-8"); %>
  <%@ page import="src.board.model.dao.BoardDAO" %>
  <%@ page import="src.board.model.dto.BoardDTO" %>
 
 <%
 	String no_ = request.getParameter("no");
 	int no;
 	String subject = "";
 	String content = "";
 	if(no_==null||no_.length()== 0){
 		no=0;
 	}else{
 		no = Integer.parseInt(no_);
 		
 		BoardDAO dao = new BoardDAO();
 	 	BoardDTO dto = dao.getSelectOne(no); 
 	 	
 	 	
 		subject= dto.getSubject();
 		content = "";
 	 	content += "[원본글]\n";
 	 	content += dto.getContent();
 	 	content += "\n--------------------------------------\n";
 	}
 	
 	
 	
 	
 %>   
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글쓰기</title>
</head>
<body>
	
	<h2>게시글 쓰기</h2>
	<form name="writeForm" action="">
		<table border="1" width ="600" align="left">
			<input type="hidden" name="no" value="<%=no %>">
			<input type="hidden" name="service" value="1">
			<tr>
				<td>작성자:</td>
				<td><input type="text" name="writer"></td>
			</tr>
			<tr>
				<td>제목:</td>
				<td><input type="text" name="subject" value="<%=subject %>"></td>
			</tr>
			<tr>
				<td>내용:</td>
				<td><textarea name="content" style="width:300px; height:100px;"><%=content %></textarea></td>
			</tr>
			<tr>
				<td>이메일:</td>
				<td><input type="text" name="email"></td>
			</tr>
			<tr>
				<td>비밀번호:</td>
				<td><input type="text" name="passwd"></td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="button" onclick="save();">등록하기</button>
					<button type="button" onclick="location.href='list.jsp';">취소</button>
				</td>	
			</tr>
		</table>
	</form>

</body>
</html>

<script>
function save(){
	if(document.writeForm.writer.value.trim() ==""){
		alert("작성자를 입력하세요.")
		document.writeForm.writer.select();
		document.writeForm.writer.focus();
		return false;
	}else if(document.writeForm.passwd.value.trim() ==""){
		alert("비밀번호를 입력하세요.")
		document.writeForm.passwd.select();
		document.writeForm.passwd.focus();
		return false;
	}else if(document.writeForm.subject.value.trim() ==""){
		alert("제목을 입력하세요.")
		document.writeForm.subject.select();
		document.writeForm.subject.focus();
		return false;
	}else if(document.writeForm.content.value.trim() ==""){
		alert("내용을 입력하세요.")
		document.writeForm.content.select();
		document.writeForm.content.focus();
		return false;
	}else if(confirm('글을 등록하시겠습니까?')){
	document.writeForm.method ="post";
	document.writeForm.action ="answerProc.jsp";
	document.writeForm.submit();
	}
}
</script>