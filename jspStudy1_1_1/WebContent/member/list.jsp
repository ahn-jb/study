<%@page import="model.dto.member.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/inc_header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	
	<form>
		<h2>회원관리</h2>
		<table border="1" width="1500" >
			<tr>
				<td>No</td>
				<td>Id</td>
				<td>Pw</td>
				<td>Name</td>
				<td>Gender</td>
				<td>BornYear</td>
				<td>PostNum</td>
				<td>Street_addr</td>
				<td>Parcel_addr</td>
				<td>Detail_addr</td>
				<td>Grade</td>
				<td>Regidate</td>
			</tr>
	 		<c:if test="${list.size() > 0 }">
	 			<c:forEach var="dto" items="${list}">
				<tr>
					<td>${dto.getNo()}</td>
					<td><a href="#" onclick="goPage('member_view','','${dto.getNo()}');">${dto.getId()}</a></td>
					<td>${dto.getPw()}</td>
					<td>${dto.getName()}</td>
					<td>${dto.getGender()}</td>
					<td>${dto.getBornYear()}</td>
					<td>${dto.getPostNum()}</td>
					<td>${dto.getStreet_addr()}</td>
					<td>${dto.getParcel_addr()}</td>
					<td>${dto.getDetail_addr()}</td>
					<td>${dto.getGrade()}</td>
					<td>${dto.getRegidate()}</td>
				</tr>
				</c:forEach>
			</c:if>
			<c:if test="${list.size() == 0 }">
				<tr>
					<td >
						등록된 회원이 없습니다.
					</td>
				</tr>
			</c:if>
		</table>
		<br><button type="button" onclick="goPage('member_chuga');">회원가입</button>
	</form>
<script>
	function goPage(value1,value2,value3){
		if(value1 =="member_list"){
			location.href="${path}/member_servlet/list.do?pageNumber"+value2;
		}else if(value1 =='member_chuga'){
			location.href = '${path}/member_servlet/chuga.do';
		}else if(value1 =='member_view'){
			location.href = '${path}/member_servlet/view.do?pageNumber='+value2+'&no='+value3;
		}
}	
</script>
</body>
</html>