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

<c:choose>
	<c:when test="${imsiPage == 'viewPasswdPage'}">
		<table border="1" align="center" width="80%">
			<tr>
				<td colspan="2">
					<h2>게시글 보기(비밀글입니다.)</h2>
				</td>
			</tr>
			<tr>
				<td width="150">비밀번호 :</td>
				<td>
					<input type="password" name="view_passwd" id="view_passwd">
					<button type="button" id="btnViewPasswd">확인</button>
				</td>
			</tr>
		</table>
	</c:when>
	<c:otherwise>
	<h2>게시글 보기</h2>
		<table border="1" width="90%" align="center" >
			<tr>
				<td width="100px">작성자:</td>
				<td>${dto.getWriter()}</td>
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
				<td width="100px">이메일:</td>
				<td>${dto.getEmail()}</td>
			</tr>
			<tr>
				<td width="100px">조회수:</td>
				<td>${dto.getHit()}</td>
			</tr>
			<tr>
				<td width="100px">작성일:</td>
				<td>${dto.getRegiDate()}</td>
			</tr>
			<tr>
				<td width="100px">현재글의 답변글:</td>
				<td>${dto.child_counter}</td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="button" onclick="GoPage('write','')">글쓰기</button>
					
					<c:if test="${dto.noticeNo == 0}">
					&nbsp;&nbsp;
					<button type="button" onclick="GoPage('reply','${dto.no}')">답변하기</button>
					</c:if>
					&nbsp;&nbsp;
					
					<button type="button" onclick="GoPage('sujeong','${dto.no}')">수정하기</button>
					&nbsp;&nbsp;
					
<!-- 					관리자거나 본인 일 때 삭제 버튼 생김 -->
					<c:if test="${dto.child_counter == 0 }">
					<button type="button" onclick="GoPage('sakje','${dto.no}')">삭제하기</button>
					&nbsp;&nbsp;
					</c:if>
					<button type="button" onclick="suntaek_page('1');">게시판</button>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					다음글: 
				<c:if test="${dto.getPreNo()>0}">	
					<a href="#" onclick="GoPage('view','${dto.preNo}');">${dto.getPreSubject()}</a> <br>
				</c:if>
				<c:if test="${dto.getPreNo()==0}">	
					(다음 글이 없습니다) <br>
				</c:if>
			
					이전글: 
				<c:if test="${dto.getNextNo()>0}">	
					<a href="#" onclick="GoPage('view','${dto.nextNo}');">${dto.getNextSubject()}</a>
				</c:if>
				<c:if test="${dto.getNextNo() ==0}">	
					(이전 글이 없습니다) 
				</c:if>
				</td>
			</tr>
			<tr>
				<td colspan="2"  style="padding:10 0 0 0;">
					&nbsp;&nbsp;&nbsp;&nbsp;Comment..<br><br> &nbsp;&nbsp;&nbsp;
					 이름 : <input type="text" name="comment_writer" id="comment_writer" size="10">
					 비밀번호 : <input type="text" name="comment_passwd" id="comment_passwd" size="10"> <br>&nbsp;&nbsp;&nbsp;
					 댓글 : <input type="text" name="comment_content" id="comment_content" size="40">
					 <button type="button" id="btnComment">확인</button><br><br>
					<div id="result2"></div>
				</td>
			</tr>
		</table>
	</c:otherwise>	
</c:choose>


<script>
	$(document).ready(function(){
		$("#btnViewPasswd").click(function(){
			GoPage('view',$("#span_no").text());
		});
	});
	
	$(document).ready(function(){
		comment_list();
		
		$("#btnComment").click(function(){
			insert();
			
		});
	});
	function insert(){
		if($("#comment_writer").val().trim() ==''){
			alert("이름을 입력하세요.");
			
		}else if($("#comment_passwd").val().trim() ==''){
			alert('비밀번호를 입력하세요.')
		}else if($("#comment_content").val().trim()==''){
			alert('댓글을 입력하세요.')
		}else{
		var param = {
			"no" : $("#span_no").text(),
			"comment_writer" : $("#comment_writer").val(),
			"comment_passwd" : $("#comment_passwd").val(),
			"comment_content" : $("#comment_content").val()
		}
			$.ajax({
				type:"post",
				data: param,
				url: "${path}/board_servlet/comment_up.do",
				success: function(){
					comment_list();
					$("#comment_writer").val("");
					$("#comment_passwd").val("");
					$("#comment_content").val("");
				}
			});
		}
	}
	function comment_list(value1){	
		var param = {
				"pageNumber" : value1,
				"no" : $("#span_no").text()
		}
		$.ajax({
			type: "post",
			data: param,
			url: "${path}/board_servlet/comment_result.do",
			success: function(data){
				$("#result2").html(data);
				
				if($("#list_size").text() >= 4){
					result.style.height = "1100px";
				}else if($("#list_size").text() >= 2){
					result.style.height = "950px";
				}else{
					result.style.height = "800px";
				}
			}
		});
	}
</script>
</body>
</html>