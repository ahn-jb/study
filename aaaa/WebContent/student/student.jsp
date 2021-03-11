<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/inc_header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form name="searchForm">
		<table border="0" width="100%">
			<tr>
				<td colspan="10" align="center">
					<h2>학생관리</h2>
				</td>
			</tr>
			<tr>
				<td>
					<select name="search_option" id="search_option">
						<c:choose>
							<c:when test="${search_option=='year'}">
								<option value="s_phone">학생 전화번호</option>
								<option value="name">이름</option>
								<option value="class">반</option>
								<option value="year" selected>학년</option>
							</c:when>
							<c:when test="${search_option=='name'}">
								<option value="s_phone">학생 전화번호</option>
								<option value="name" selected>이름</option>
								<option value="class">반</option>
								<option value="year" >학년</option>
							</c:when>
							<c:when test="${search_option=='class'}">
								<option value="s_phone">학생 전화번호</option>
								<option value="name">이름</option>
								<option value="class" selected>반</option>
								<option value="year" >학년</option>
							</c:when>
							<c:when test="${search_option=='s_phone'}">
								<option value="s_phone" selected>학생 전화번호</option>
								<option value="name">이름</option>
								<option value="class">반</option>
								<option value="year" >학년</option>
							</c:when>
							<c:otherwise>	
								<option value="year" >학년</option>
								<option value="name">이름</option>
								<option value="class">반</option>
								<option value="s_phone">학생 전화번호</option>
							</c:otherwise>	
						</c:choose>
					</select>
					<input type="text" name="search_data" id="search_data" style="width:400px" value="${search_data}">
					<button type="button" onclick="go('student_search','1');">검색</button>
				</td>
			</tr>
			<tr>
				<td>
					<table border="1" width="100%">
						<tr align ="center">
							<td width="50">순번</td>
							<td width="70">학년</td>
							<td width="70">반</td>
							<td >번호</td>
							<td width="150">이름</td>
							<td width="170">생년월일</td>							
							<td width="200">학생 전화번호</td>							
							<td width="200">부모님 전화번호</td>							
							<td>주소</td>
							<td width="300">등록일</td>							
						</tr>
						<c:if test="${totalRecord > 0 }">
							<c:forEach var="dto" items="${list}">
								<tr>
									<td>${dto.no}</td>
									<td>${dto.year}</td>
									<td>${dto.s_class}</td>
									<td>${dto.num}</td>
									<td>${dto.name} </td>
									<td>${dto.born}</td>
									<td>${dto.s_phone}</td>
									<td>${dto.p_phone}</td>
									<td>${dto.adr}</td>
									<td>${dto.regidate}</td>							
								</tr>
							</c:forEach>
						</c:if>
						<c:if test="${totalRecord == 0}">
						<tr height="300" align="center">
							<td colspan="20" align="center">등록된 학생정보가 없습니다.</td>
						</tr>
						</c:if>
						<tr>
							<td colspan="10" align="center">
								<a href="#" onclick="go('student_list','1');">[첫페이지]</a>&nbsp;&nbsp;
								<c:if test="${startPage > blockSize }">
									<a href="#" onclick="go('student_list','${lastPage -blockSize}');">[이전 10개]</a>
								</c:if>
								<c:if test="${startPage <=blockSize }"> [이전10개] </c:if>&nbsp;&nbsp;
								<c:forEach var="i" begin="${startPage}" end="${lastPage}" step="1">
								<c:if test="${i == pageNumber}"> [${i}]</c:if>
								<c:if test="${i != pageNumber}">
									<a href="#" onclick="go('student_list','${i}')">${i}</a>
								</c:if>
								</c:forEach>&nbsp;&nbsp;
								<c:if test="${lastPage < totalPage }">
									<a href="#" onclick="go('student_list','${startPage + blockSize}');">[다음 10개]</a>
								</c:if>
								<c:if test="${lastPage >= totalPage }"> [다음10개] </c:if>&nbsp;&nbsp;
								<a href="#" onclick="go('student_list','${totalPage}');">[끝페이지]</a>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td colspan="10" ailgn="right">
					<button type = "button" onclick="go('reset','1');">목록</button>&nbsp;&nbsp;
					<button type = "button" onclick="go('studentChuga','');">학생등록</button>&nbsp;&nbsp;&nbsp;
				</td>
			</tr>
		</table>
	</form>
<script type="text/javascript">
	function go(value1,value2){
		if(value1 =='studentChuga'){
			location.href="${path}/student_servlet/studentChuga.do";
		}else if(value1 == 'student_search'){
			searchForm.method="post";
			searchForm.action="${path}/student_servlet/student.do";
			searchForm.submit();
		}else if(value1 == 'reset'){
			location.href="${path}/student_servlet/student.do";
		}else if(value1 == 'student_list'){
			location.href="${path}/student_servlet/student.do?pageSize="+value2+"&search_option=${search_option}&search_data=${search_data}";
		}
	}
</script>
</body>
</html>