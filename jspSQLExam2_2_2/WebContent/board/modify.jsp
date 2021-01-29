<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <% request.setCharacterEncoding("UTF-8"); %>   
<%@ include file="../include/include_import.jsp" %>
<%@ include file="../include/include_check/include_check.jsp" %>
<%@ include file="../include/include_check/include_session.jsp" %>
<%@ include file="../include/include_check/include_session_check.jsp" %>

 
 <%
 	String no_ =request.getParameter("no");
	int no = Integer.parseInt(no_);
	
 	BoardDAO dao = new BoardDAO();
 	BoardDTO dto = dao.getSelectOne(no);
 	
 	MemberDAO dao_member = new MemberDAO();
 	MemberDTO dto_member = dao_member.getSelectOneId(cookId);
 	
 	if(!dto.getWriter().equals(dto_member.getId())){
 		out.println("<script>");
		out.println("alert('작성자가 아닙니다.');");
		out.println("location.href='../board/list.jsp';");
		out.println("</script>");
 	}
 	
 %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>
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
				<form name="modifyForm">
					<input type="hidden" name="no" value="<%=dto.getNo()%>">
					<table border="1" width="600" align="left">
						<tr>
							<td width="100px">작성자:</td>
							<td><input type="text" name="writer" value="<%=dto.getWriter() %>" readonly></td>
						</tr>
						<tr>
							<td width="100px">이메일:</td>
							<td><input type="text" name="email" value="<%=dto.getEmail() %>"></td>
						</tr>
						<tr>
							<td width="100px">제목:</td>
							<td><input type="text" name="subject" value="<%=dto.getSubject() %>"></td>
						</tr>
						<tr height="300">
							<td width="100px">내용:</td>
							<td><textarea type="text" name="content" style="width:500px; height:300px;" ><%=dto.getContent() %></textarea></td>
						</tr>
						<tr>
							<td width="100px">작성일:</td>
							<td><input type="text" name="regiDate" value="<%=dto.getRegiDate() %>" readonly></td>
						</tr>
						<tr>
						
							<td colspan="2">
								<a href="#" onclick="modify();">[수정하기]</a>
								&nbsp;&nbsp;
								<a href="list.jsp" >[취소]</a>
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
 function modify(){
	 if(confirm('수정 하시겠습니까?')){
		 	document.modifyForm.method ="post";
			document.modifyForm.action ="modifyProc.jsp";
			document.modifyForm.submit();
	 }
 }
</script>