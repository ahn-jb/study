<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/inc_header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>뷰</title>
</head>
<body>
	<h2>게시글 보기</h2>
	<form name="viewForm">
		<table border="1" width="600" align="center" >
			<tr>
				<td width="100px">작성자:</td>
				<td>${dto.getWriter()}</td>
			</tr>
			<tr>
				<td width="100px">이메일:</td>
				<td>${dto.getEmail()}</td>
			</tr>
			<tr>
				<td width="100px">제목:</td>
				<td>${dto.getSubject()}</td>
			</tr>
			<tr height="200">
				<td width="100px">내용:</td>
				<td>${dto.getContent()}</td>
			</tr>
			<tr>
				<td width="100px">작성일:</td>
				<td>${dto.getRegiDate()}</td>
			</tr>
			<tr>
			
				<td colspan="2">
					<a href="#" onclick="move('board_answer')">[답변하기]</a>
					&nbsp;&nbsp;
					<c:if test="${dto.getWriter()==Id}">
					<a href="#" onclick="move('board_modify')">[수정하기]</a>
					&nbsp;&nbsp;
					</c:if>
<!-- 					관리자거나 본인 일 때 삭제 버튼 생김 -->
					<c:if test="${dto.getWriter() == Id || Grade ==1}">
					<a href="#" onclick="move('board_delete')">[삭제하기]</a>
					&nbsp;&nbsp;
					</c:if>
					<a href="${path}/board_servlet/list.do">[게시판]</a>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					다음글: 
				<c:if test="${dto.getPreNo()>0}">	
					<a href="${path}/board_servlet/view.do?no=${dto.getPreNo()}&bunryu=${bunryu}&search=${search}">${dto.getPreSubject()}</a> <br>
				</c:if>
				<c:if test="${dto.getPreNo()==0}">	
					(다음 글이 없습니다) <br>
				</c:if>
			
					이전글: 
				<c:if test="${dto.getNextNo()>0}">	
					<a href="${path}/board_servlet/view.do?no=${dto.getNextNo()}&bunryu=${bunryu}&search=${search}">${dto.getNextSubject()}</a>
				</c:if>
				<c:if test="${dto.getNextNo() ==0}">	
					(이전 글이 없습니다) 
				</c:if>
				</td>
			</tr>
		</table>
	</form>
<script>
	function move(value1){
		if(value1 ="board_answer"){
			location.href="${path}/board_servlet/answer.do?no=${no}"
		}
		if(value1 = "board_modify"){
			
		}
		if(value1 = "board_delete"){
			if(confirm('정말 삭제 하시겠습니까?')){
				location.href="${path}/board_servlet/delete.do?no=${no}"
			}
		}
	}
</script>
</body>
</html>