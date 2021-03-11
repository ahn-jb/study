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
	<form name="student_chugaForm">
		<table border="0" width="800">	
			<tr>
				<td colspan="3"><h2>학생등록</h2></td>
			</tr>
			<tr>
				<td>
					<table border="1" width="100%">
						<tr>
							<td width="150">학년</td>
							<td><input type="text" id="year" name="year" style="width:400px;"></td>
						</tr>
						<tr>
							<td>반</td>
							<td><input type="text" id="Student_class" name="Student_class" style="width:400px;"></td>
						</tr>
						<tr>
							<td>번호</td>
							<td><input type="text" id="num" name="num" style="width:400px;"></td>
						</tr>
						<tr>
							<td>이름</td>
							<td><input type="text" id="name" name="name" style="width:400px;"></td>
						</tr>
						<tr>
							<td>생년월일</td>
							<td><input type="text" id="born" name="born" style="width:400px;"></td>
						</tr>
						<tr>
							<td>학생 전화번호</td>
							<td><input type="text" id="s_phone" name="s_phone" style="width:400px;"></td>
						</tr>
						<tr>
							<td>부모님 전화번호</td>
							<td><input type="text" id="p_phone" name="p_phone" style="width:400px;"></td>
						</tr>
						<tr>
							<td>집 주소</td>
							<td width="500"><input type="text" id="adr" name="adr" style="width:400px;"></td>
						</tr>
					</table>
				</td>
			</tr>				
			<tr>
				<td colspan="2">
					<button type="button" onclick="btn('chuga')">등록하기</button>
					<button type="button" onclick="btn('Studentlist')">목록</button>
				</td>
			</tr>
		</table>
	</form>
<script>
	function btn(value1){
		if(value1 == 'chuga'){
			student_chugaForm.method="post";
			student_chugaForm.action="${path}/student_servlet/studentChugaProc.do";
			student_chugaForm.submit();
		}else if(value1 =='Studentlist'){
			location.href="${path}/student_servlet/student.do"
		}
	}
</script>
</body>
</html>