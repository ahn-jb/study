<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <% request.setCharacterEncoding("UTF-8"); %>
<%@ include file="../include/include_import.jsp" %>
<%@ include file="../include/include_check/include_check.jsp" %>
<%@ include file="../include/include_check/include_session.jsp" %>
  
  <%
  	String no_ =request.getParameter("no");
 	int no = Integer.parseInt(no_);
 	
 	
 	BoardDAO dao = new BoardDAO(); 
 	dao.setUpdateHit(no);
 	BoardDTO dto = dao.getSelectOne(no);

	MemberDAO dao_member = new MemberDAO();
 	MemberDTO dto_member = dao_member.getSelectOneId(cookId);
 	
  %>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 보기</title>
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
				<h2>게시글 보기</h2>
				<form name="viewForm">
					<table border="1" width="600" align="left" >
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
						
							<td colspan="2">
								<a href="#" onclick="move('A','<%=dto.getNo()%>')">[답변하기]</a>
								&nbsp;&nbsp;
								
								<%if(dto.getWriter().equals(dto_member.getId())){//본인이 쓴글만 수정버튼 생김  %>
								<a href="#" onclick="move('M','<%=dto.getNo()%>')">[수정하기]</a>
								&nbsp;&nbsp;
								<%} %>
								
								<%if(dto_member.getGrade() ==1 || dto.getWriter().equals(dto_member.getId())){//관리자거나 본인 일 때 삭제 버튼 생김%>
								<a href="#" onclick="move('D','<%=dto.getNo()%>')">[삭제하기]</a>
								&nbsp;&nbsp;
								<%} %>
								<a href="list.jsp">[게시판]</a>
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
	function move(value1,value2){
		if(value1=='A'){
			location.href='write.jsp?no='+value2;
		}
		
		if(value1=='M'){
			 if(confirm('수정하시겠습니까?')){
				
				location.href='modify.jsp?no='+value2
			}
		}
		if(value1=='D'){
			 if(confirm('정말 삭제 하시겠습니까?')){
				location.href='delete.jsp?no='+value2;
			}
			
		}
	}
</script>