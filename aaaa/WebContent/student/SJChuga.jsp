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
	<form name="SJChugaProcForm">
		<table width="90%" align="center">
			<tr>
				<td colspan="20" align="center">
					<h2>성적등록</h2>
				</td>
			</tr>
			<tr>
				<td>
					<table border="1" width="60%" align="center">
						<tr>
							<td>학생번호</td>
							<td>
								<select id="student_year" name="student_year" onchange="student_search('year')">
										<option value="">선택</option>
									<c:forEach var="student_year"  items="${student_search_year}">
										<option value="${student_year}">${student_year}학년</option>
									</c:forEach>
								</select>
								<select id="student_class" name="student_class" onchange="student_search('class')">
										<option value="">선택</option>
									<c:forEach var="student_class" items="${student_search_class}">
										<option value="${student_class}">${student_class}반</option>
									</c:forEach>
								</select>
								<select id="student_no" name="student_no">
									<c:forEach var="dto2" items="${student_list}">
										<option value="${dto2.no}">${dto2.num}번-${dto2.name}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<td>시험번호</td>
							<td>
								<select id="test_no" name="test_no">
									<c:forEach var="dto3" items="${test_list}">
										<option value="${dto3.test_no}">${dto3.test_name}(${dto3.test_no})</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<td>국어</td>
							<td><input type="text" id="kor" name="kor"></td>
						</tr>
						<tr>
							<td>영어</td>
							<td><input type="text" id="eng" name="eng"></td>
						</tr>
						<tr>
							<td>수학</td>
							<td><input type="text" id="mat" name="mat"></td>
						</tr>
						<tr>
							<td>과학</td>
							<td><input type="text" id="sci" name="sci"></td>
						</tr>
						<tr>
							<td>사회</td>
							<td><input type="text" id="his" name="his"></td>
						</tr>
						<tr>
							<td colspan="20">
								<button type="button" onclick="btn5('SJChugaProc');">등록하기</button>
								<button type="button" onclick="btn5('SJList');">목록</button>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</form>
<script>

	$(document).ready(function(){
		const yearSelectTag = document.querySelector('#student_year');
		const year = '${student_year}';
		if (year) {
			for (let i = 0; i < yearSelectTag.length; i++) {
				if (yearSelectTag[i].value === year) {
					yearSelectTag[i].selected = true;
				}
			}
		}
		
		const classSelectTag = document.querySelector('#student_class');
		const cc = '${student_class}';
		if (cc) {
			for (let i = 0; i < classSelectTag.length; i++) {
				if (classSelectTag[i].value === cc) {
					classSelectTag[i].selected = true;
				}
			}
		}
	
	});
	
	function btn5(value1){

		if(value1 == 'SJChugaProc'){
			SJChugaProcForm.method="post";
			SJChugaProcForm.action="${path}/student_servlet/SJChugaProc.do";
			SJChugaProcForm.submit();
		}else if(value1 == 'SJList'){
			location.href="${path}/student_servlet/SJ.do";
		}
	}
	
	function student_search(value1){
		if(value1 == 'year'){					
			location.href="${path}/student_servlet/SJChuga.do?student_year="+$('#student_year').val();

		}else if(value1 == 'class'){
			location.href="${path}/student_servlet/SJChuga.do?student_class="+$('#student_class').val()+"&student_year="+$('#student_year').val();
		}
		
		
	}

</script>
</body>
</html>