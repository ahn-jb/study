<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <% request.setCharacterEncoding("UTF-8"); %>
<%@ include file="../include/include_import.jsp" %>
<%@ include file="../include/include_check/include_check.jsp" %>
<%@ include file="../include/include_check/include_session.jsp" %>
<%@ include file="../include/include_check/include_session_check.jsp" %>
 
 <%
 	String no_ = request.getParameter("no");
 	int no;
 	int p_no;
 	
 	String subject = "";
 	String content = "";
 	if(no_==null||no_.length()== 0){
 		no=0;
 		p_no=0;
 	}else{
 		no = Integer.parseInt(no_);
 		
 		BoardDAO dao = new BoardDAO();
 	 	BoardDTO dto = dao.getSelectOne(no);
 	 	p_no = no;
 	 	
 		subject= dto.getSubject();
 		content = "";
 	 	content += "[원본글]\n";
 	 	content += dto.getContent();
 	 	content += "\n--------------------------------------\n";
 	}
 	
 	MemberDAO dao_member = new MemberDAO();
 	MemberDTO dto_member = dao_member.getSelectOneNo(cookNo);
 	
 	
 %>   
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글쓰기</title>
</head>
<body>
	
	<table border="1" width="100%">
		<tr>
			<td>
				<%@ include file="../include/include_top.jsp" %>
			</td>
		</tr>
		<tr>
			<td>	
				<h2>게시글 쓰기</h2>
				<form name="writeForm" action="">
					<input type="hidden" name="no" value="<%=no %>">
					<input type="hidden" name="service" value="1">
					<input type="hidden" name="p_no" value="<%=p_no %>">
					<table border="1" width ="600" align="left">
						<tr>
							<td>작성자:</td>
							<td><input type="text" name="writer" value="<%=dto_member.getId() %>" readonly></td>
						</tr>
						<tr>
							<td>이메일:</td>
							<td><input type="text" name="email" value=""></td>
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
							<td colspan="2">
								<button type="button" onclick="save();">저장하기</button>
								<button type="button" onclick="location.href='search.jsp';">취소</button>
							</td>						
						</tr>
					</table>
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
function save(){
	if(document.writeForm.writer.value.trim() ==""){
		alert("작성자를 입력하세요.")
		document.writeForm.writer.select();
		document.writeForm.writer.focus();
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
	document.writeForm.action ="writeProc.jsp";
	document.writeForm.submit();
	}
}
</script>