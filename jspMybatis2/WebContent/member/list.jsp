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
		<table border="0" width="90%" >
			<tr>
				<td colspan="20">
					<h2>회원관리</h2>
				</td>
			</tr>
			<tr>
				<td>
					<select name="search_option" id="search_option">
						<c:choose>
							<c:when test="${search_option=='id_name_gender'}">
								<option value="id">아이디</option>
								<option value="name">이름</option>
								<option value="gender">성별</option>
								<option value="id_name_gender" selected>아이디+이름+성별</option>
							</c:when>
							<c:when test="${search_option=='id'}">
								<option value="id" selected>아이디</option>
								<option value="name">이름</option>
								<option value="gender">성별</option>
								<option value="id_name_gender" >아이디+이름+성별</option>
							</c:when>
							<c:when test="${search_option=='name'}">
								<option value="id" >아이디</option>
								<option value="name" selected>이름</option>
								<option value="gender">성별</option>
								<option value="id_name_gender" >아이디+이름+성별</option>
							</c:when>
							<c:when test="${search_option=='gender'}">
								<option value="id">아이디</option>
								<option value="name">이름</option>
								<option value="gender" selected>성별</option>
								<option value="id_name_gender" >아이디+이름+성별</option>
							</c:when>
							<c:otherwise>
								<option value="">선택</option>	
								<option value="id">아이디</option>
								<option value="name">이름</option>
								<option value="gender">성별</option>
								<option value="id_name_gender">아이디+이름+성별</option>
							</c:otherwise>	
						</c:choose>
					</select>
					<input type="text" name="search_data" id="search_data" style="width:400px" value="${search_data}">
					<button type="button" onclick="sunteak_proc('list','1','');">검색</button>
				</td>
			</tr>
			<tr>
				<td colspan="20">
					${totalRecord}명이 검색 되었습니다.
				</td>
			</tr>
			<tr>
				<td>
					<table border="1" width="100%">
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
								<td><a href="#" onclick="sunteak_proc('view','','${dto.getNo()}');">${dto.getId()}</a></td>
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
								<td colspan="20">
									등록된 회원이 없습니다.
								</td>
							</tr>
						</c:if>
						<tr>
							<td colspan="20" align="center"> 
							<c:if test="${totalRecord > 0 }">
								<button type="button" onclick="sunteak_proc('resetList','1');" style="float:left;">전체목록</button>
								<button type="button" onclick="sunteak_proc('chuga','1','');" style="float:left;">회원등록</button>	
								
								<a href="#" onclick="sunteak_proc('list','1','');">[첫페이지]</a>&nbsp;&nbsp;
								<c:if test="${startPage > blockSize }">
									<a href="#" onclick="sunteak_proc('list','${startPage -blockSize}','');">[이전 10개]</a>
								</c:if>
								<c:if test="${startPage <=blockSize }"> [이전10개] </c:if>&nbsp;&nbsp;
								<c:forEach var="i" begin="${startPage}" end="${lastPage}" step="1">
								<c:if test="${i == pageNumber}"> [${i}]</c:if>
								<c:if test="${i != pageNumber}">
									<a href="#" onclick="sunteak_proc('list','${i}','')">${i}</a>
								</c:if>
								</c:forEach>&nbsp;&nbsp;
								<c:if test="${lastPage < totalPage }">
									<a href="#" onclick="sunteak_proc('list','${startPage + blockSize}','');">[다음 10개]</a>
								</c:if>
								<c:if test="${lastPage >= totalPage }"> [다음10개] </c:if>&nbsp;&nbsp;
								<a href="#" onclick="sunteak_proc('list','${totalPage}','');">[끝페이지]</a>
								</c:if>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</form>

</body>
</html>
<%
// String pageNumber_ ="12a45";
// char imsi;
// for(int i=0; i<pageNumber_.length(); i++) {
// 	 imsi = pageNumber_.charAt(i);
// 	 out.println(imsi +"<br>");
// 	 if(imsi >= '0' && imsi <= '9'){
// 		 out.println(imsi +": 숫자 입니다. <br>");
// 	 }else if(imsi >= 'A' && imsi <= 'Z'){
// 		 out.println(imsi +": 대문자 입니다. <br>");
// 	 }else if(imsi >= 'a' && imsi <= 'z'){
// 		 out.println(imsi +": 소문자 입니다. <br>");
// 	 }
// 	if(Character.isDigit(imsi)==true){//문자가 숫자일 경우
// 		out.println(imsi + " :숫자입니다.<br>");
// 	}else{//문자가 숫자가 아닐경우
// 		out.println(imsi + " :문자입니다.<br>");
// 	}
	
	
// }
// <script>alert('aa');</script>
%>