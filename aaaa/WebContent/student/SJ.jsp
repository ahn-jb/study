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
	<form name="SJSearchForm">
		<table border="0" width="90%">
			<tr>
				<td colspan="20" align="center">
					<h2>성적관리</h2>
				</td>
			</tr>
			<tr>
				<td>
					<select name="search_option" id="search_option">
						<c:choose>
							<c:when test="${search_option=='year'}">
								<option value="name">이름</option>
								<option value="class">반</option>
								<option value="test_name">시험명</option>
								<option value="year" selected>학년</option>
							</c:when>
							<c:when test="${search_option=='name'}">
								<option value="name" selected>이름</option>
								<option value="class">반</option>
								<option value="test_name">시험명</option>
								<option value="year" >학년</option>
							</c:when>
							<c:when test="${search_option=='class'}">
								<option value="name">이름</option>
								<option value="class" selected>반</option>
								<option value="test_name">시험명</option>
								<option value="year" >학년</option>
							</c:when>
							<c:when test="${search_option=='testName'}">
								<option value="name">이름</option>
								<option value="class">반</option>
								<option value="test_name" selected>시험명</option>
								<option value="year" >학년</option>
							</c:when>
							<c:otherwise>
							<option value="test_name">시험명</option>	
								<option value="year" >학년</option>
								<option value="name">이름</option>
								<option value="class">반</option>
							</c:otherwise>	
						</c:choose>
					</select>
					<input type="text" name="search_data" id="search_data" style="width:400px" value="${search_data}">
					<button type="button" onclick="go('SJ_search','1');">검색</button>
				</td>
			</tr>
			<tr>
				<td>
					<table border="1" align="center" width="100%">
						<tr>
							<td>순번</td>
							<td>학년</td>
							<td>반</td>
							<td>학생이름</td>
							<td>시험명</td>
							<td>국어</td>
							<td>영어</td>
							<td>수학</td>
							<td>과학</td>
							<td>사회</td>
							<td>총점</td>
							<td>평균</td>
							<td>등록일</td>
						</tr>
						<c:if test="${totalRecord > 0 }">
							<c:forEach var="dto" items="${list}">
								<tr>
									<td>${dto.SJ_no}</td>
									<td>${dto.year}</td>
									<td>${dto.s_class}</td>								
									<td>${dto.name}</td>
									<td>${dto.test_name}</td>
									<td>${dto.kor}</td>
									<td>${dto.eng}</td>
									<td>${dto.mat}</td>
									<td>${dto.sci}</td>
									<td>${dto.his}</td>
									<td>${dto.total}</td>
									<td>${dto.avg}</td>
									<td>${dto.SJ_regidate}</td>
								</tr>
							</c:forEach>
						</c:if>
						<c:if test="${totalRecord == 0}">
							<tr height="300" align="center">
								<td colspan="20" align="center">등록된 학생정보가 없습니다.</td>
							</tr>
							</c:if>
						<tr>
							<td  rowspan="1" colspan="20" align="center">
								<a href="#" onclick="go('SJ_list','1');">[첫페이지]</a>&nbsp;&nbsp;
								<c:if test="${startPage > blockSize }">
									<a href="#" onclick="go('SJ_list','${lastPage -blockSize}');">[이전 10개]</a>
								</c:if>
								<c:if test="${startPage <=blockSize }"> [이전10개] </c:if>&nbsp;&nbsp;
								<c:forEach var="i" begin="${startPage}" end="${lastPage}" step="1">
								<c:if test="${i == pageNumber}"> [${i}]</c:if>
								<c:if test="${i != pageNumber}">
									<a href="#" onclick="go('SJ_list','${i}')">${i}</a>
								</c:if>
								</c:forEach>&nbsp;&nbsp;
								<c:if test="${lastPage < totalPage }">
									<a href="#" onclick="go('SJ_list','${startPage + blockSize}');">[다음 10개]</a>
								</c:if>
								<c:if test="${lastPage >= totalPage }"> [다음10개] </c:if>&nbsp;&nbsp;
								<a href="#" onclick="go('SJ_list','${totalPage}');">[끝페이지]</a><br><br>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td  colspan="20">
					<button type="button" onclick="btn4('SJChuga');">성적등록</button>
					<button type="button" onclick="btn4('SJ');">목록</button>
				</td>
			</tr>
		</table>
	</form>
<script>
	function btn4(value1){
		if(value1 == 'SJChuga'){
			location.href="${path}/student_servlet/SJChuga.do";
		}else if(value1 == "SJ"){
			location.href="${path}/student_servlet/SJ.do";
		}
	}
	function go(value1, value2){
		if(value1 == 'SJ_search'){
			SJSearchForm.method="post";
			SJSearchForm.action="${path}/student_servlet/SJ.do";
			SJSearchForm.submit();
		}else if(value1 == 'SJ_list'){
			location.herf="${path}/student_servlet/SJ.do?pageSize="+value2+"&search_data=${search_data}&search_option=${search_option}";
		}
	}
</script>
</body>
</html>