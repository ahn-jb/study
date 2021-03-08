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
				<td width="100px">작성일:</td>
				<td>${dto.getRegidate()}</td>
			</tr>

			<tr>
				<td colspan="2">
					<button type="button" onclick="GoPage('write','')">글쓰기</button>
					
					<button type="button" onclick="GoPage('sujeong','${dto.no}')">수정하기</button>
					&nbsp;&nbsp;
					
					<button type="button" onclick="GoPage('sakje','${dto.no}')">삭제하기</button>
					&nbsp;&nbsp;

					<button type="button" onclick="GoPage('list','')">게시판</button>
				</td>
			</tr>
		</table>

<script>
	function GoPage(value1,value2){
		if(value1 == 'write'){
			location.href="${path}/board_servlet/write.do";
		}else if(value1 == 'sujeong'){
			location.href="${path}/board_servlet/sujeong.do?no="+value2+"&search_option=${search_option}&search_data=${search_data}";
		}else if(value1 == 'sakje'){
			location.href="${path}/board_servlet/sakje.do?no="+value2;
		}else if(value1 == 'view'){
			location.href="${path}/board_servlet/view.do?no="+value2+"&search_option=${search_option}&search_data=${search_data}";
		}else if(value1 == 'list'){
			location.href="${path}/board_servlet/list.do";
		}
	}
	

	function gogo(value1,value2){
		if(value1 =='board_list'){
			location.href="${path}/board_servlet/view.do?no="+${dto.no}+"&pageNumber="+value2+"&search_option=${search_option}&search_data=${search_data}";
		}
	}

</script>
</body>
</html>