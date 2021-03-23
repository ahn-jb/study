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
		<form name="passwdForm">
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
					<button type="button" onclick="GoPage('ViewPasswd','${dto.no}')">확인</button>
				</td>
			</tr>
		</table>
		</form>
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
					<button type="button" onclick="GoPage('list','')">게시판</button>
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
					<form name="commentForm">
						&nbsp;&nbsp;&nbsp;&nbsp;Comment..<br><br> &nbsp;&nbsp;&nbsp;
						<input type="hidden" name="no" id ="no" value="${dto.no}" style="width:40%;">
						 이름 : <input type="text" name="comment_writer" id="comment_writer" size="10">
						 비밀번호 : <input type="text" name="comment_passwd" id="comment_passwd" size="10"> <br>&nbsp;&nbsp;&nbsp;
						 댓글 : <input type="text" name="comment_content" id="comment_content" size="40">
						 <button type="button" id="btnComment">확인</button><br><br>
						 
						 <table border="0"  align="center" width="90%">
							<c:forEach var="list" items="${list}">
							<tr>
								<td style="padding:0 0 10 0;">
									${list.comment_writer}  (${list.regiDate})  <button type="button" onclick=";">삭제</button><br>
									${list.comment_content}<br>
									---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
								</td>
							</tr>
							</c:forEach>
								<tr>
									<td colspan="4" align="center"> 
										<a href="#" onclick="gogo('board_list','1');">[첫페이지]</a>&nbsp;&nbsp;
										<c:if test="${startPage > blockSize }">
											<a href="#" onclick="gogo('board_list','${lastPage -blockSize}','');">[이전 10개]</a>
										</c:if>
										<c:if test="${startPage <=blockSize }"> [이전10개] </c:if>&nbsp;&nbsp;
										<c:forEach var="i" begin="${startPage}" end="${lastPage}" step="1">
										<c:if test="${i == pageNumber}"> [${i}]</c:if>
										<c:if test="${i != pageNumber}">
											<a href="#" onclick="gogo('board_list','${i}')">${i}</a>
										</c:if>
										</c:forEach>&nbsp;&nbsp;
										<c:if test="${lastPage < totalPage }">
											<a href="#" onclick="gogo('board_list','${startPage + blockSize}');">[다음 10개]</a>
										</c:if>
										<c:if test="${lastPage >= totalPage }"> [다음10개] </c:if>&nbsp;&nbsp;
										<a href="#" onclick="gogo('board_list','${totalPage}');">[끝페이지]</a> 	
									</td>
								</tr>
						</table>
					</form>
					
				</td>
			</tr>
		</table>
	</c:otherwise>	
</c:choose>

<script>
	function GoPage(value1,value2){
		if(value1 == 'write'){
			location.href="${path}/board2_servlet/write.do";
		}else if(value1 == 'reply'){
			location.href="${path}/board2_servlet/reply.do?no="+value2;
		}else if(value1 == 'sujeong'){
			location.href="${path}/board2_servlet/sujeong.do?no="+value2+"&search_option=${search_option}&search_data=${search_data}";
		}else if(value1 == 'sakje'){
			location.href="${path}/board2_servlet/sakje.do?no="+value2;
		}else if(value1 == 'view'){
			location.href="${path}/board2_servlet/view.do?no="+value2+"&search_option=${search_option}&search_data=${search_data}";
		}else if(value1 == 'list'){
			location.href="${path}/board2_servlet/list.do";
		}else if(value1 == 'ViewPasswd'){
			passwdForm.method="post";
			passwdForm.action="${path}/board2_servlet/view.do?no="+value2+"&search_option=${search_option}&search_data=${search_data}";
			passwdForm.submit();
		}
	}
	
	$("#btnComment").click(function(){
		commentForm.method="post";
		commentForm.action="${path}/board2_servlet/comment_up.do";
		commentForm.submit();
		
	});
	function gogo(value1,value2){
		if(value1 =='board_list'){
			location.href="${path}/board2_servlet/view.do?no="+${dto.no}+"&pageNumber="+value2+"&search_option=${search_option}&search_data=${search_data}";
		}
	}

</script>
</body>
</html>