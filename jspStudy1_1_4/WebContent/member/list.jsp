<%@page import="com.sun.jdi.Location"%>
<%@page import="member.model.dto.MemberDTO"%>
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
					<td><a href="#" onclick="GoPage('member_view','','${dto.getNo()}');">${dto.getId()}</a></td>
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
				<c:if test="${totalRecord > 0 }">
				<tr>
					<td colspan="12" align="center"> 
						<a href="#" onclick="GoPage('member_list','1','');">[첫페이지]</a>&nbsp;&nbsp;
						<c:if test="${startPage > blockSize }">
							<a href="#" onclick="GoPage('member_list','${startPage -blockSize}','');">[이전 10개]</a>
						</c:if>
						<c:if test="${startPage <=blockSize }"> [이전10개] </c:if>&nbsp;&nbsp;
						<c:forEach var="i" begin="${startPage}" end="${lastPage}" step="1">
						<c:if test="${i == pageNumber}"> [${i}]</c:if>
						<c:if test="${i != pageNumber}">
							<a href="#" onclick="GoPage('member_list','${i}','')">${i}</a>
						</c:if>
						</c:forEach>&nbsp;&nbsp;
						<c:if test="${lastPage < totalPage }">
							<a href="#" onclick="GoPage('member_list','${startPage + blockSize}','');">[다음 10개]</a>
						</c:if>
						<c:if test="${lastPage >= totalPage }"> [다음10개] </c:if>&nbsp;&nbsp;
						<a href="#" onclick="GoPage('member_list','${totalPage}','');">[끝페이지]</a>
					</td>
				</tr>
				</c:if>
		</table>

	</form>
<script>
	function GoPage(value1,value2,value3){
		if(value1 =="member_list"){
			location.href="${path}/member_servlet/list.do?pageNumber="+value2;
		}else if(value1 =='member_chuga'){
			location.href = '${path}/member_servlet/chuga.do';
		}else if(value1 =='member_view'){
			location.href = '${path}/member_servlet/view.do?pageNumber='+value2+'&no='+value3;
		}
}	
</script>
</body>
</html>
<%
String pageNumber_ ="12a45";
char imsi;
for(int i=0; i<pageNumber_.length(); i++) {
	 imsi = pageNumber_.charAt(i);
// 	 out.println(imsi +"<br>");
// 	 if(imsi >= '0' && imsi <= '9'){
// 		 out.println(imsi +": 숫자 입니다. <br>");
// 	 }else if(imsi >= 'A' && imsi <= 'Z'){
// 		 out.println(imsi +": 대문자 입니다. <br>");
// 	 }else if(imsi >= 'a' && imsi <= 'z'){
// 		 out.println(imsi +": 소문자 입니다. <br>");
// 	 }
	if(Character.isDigit(imsi)==true){//문자가 숫자일 경우
		out.println(imsi + " :숫자입니다.<br>");
	}else{//문자가 숫자가 아닐경우
		out.println(imsi + " :문자입니다.<br>");
	}
	
	
}
// <script>alert('aa');</script>
%>