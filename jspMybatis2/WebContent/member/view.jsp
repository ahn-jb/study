<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/inc_header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세보기</title>
</head>
<body>	

<h2>회원 상세정보</h2>
	<form name="viewForm">
		<table border="1">
			<tr>
				<td>등급:</td>
				<td><input type="text" name="grade" value="${dto.getGrade()}" readonly></td>
			</tr>
			<tr>
				<td>아이디:</td>
				<td><input type="text" name="id" value="${dto.getId()}" readonly></td>
			</tr>
			<tr>
				<td>비밀번호:</td>
				<td><input type="password" name="pw"></td>
			</tr>
			<tr>
				<td>이름:</td>
				<td><input type="text" name="name" value="${dto.getName()}" readonly></td>
			</tr>
			<tr>
				<td>성별:</td>
				<td>
					<input type="text" name="gender" value="${dto.getGender()}" readonly>
				</td>
			</tr>
			<tr>
				<td>생년:</td>
				<td><input type="text" name="bornYear" value="${dto.getBornYear()}" readonly></td>
			</tr>
			<tr>
				<td>우편번호</td>
				<td><input type="text" name="postNum" value="${dto.getPostNum()}" readonly></td>
			</tr>
			<tr>
				<td>도로명주소</td>
				<td><input type="text" name="street_addr" value="${dto.getStreet_addr()}" readonly></td>
			</tr>
			<tr>
				<td>지번주소</td>
				<td><input type="text" name="parcel_addr" value="${dto.getParcel_addr()}" readonly></td>
			</tr>
			<tr>
				<td>상세주소</td>
				<td><input type="text" name="detail_addr" value="${dto.getDetail_addr()}" readonly></td>
			</tr>
	</table>
		<br>
			<button type="button" onclick="sujeong('${dto.getNo()}');">수정하기</button>
			<button type="button" onclick="remove('${dto.getNo()}');">삭제하기</button>
			<button type="button" id="button" onclick="sunteak_proc('list','1','');" style="display:none;">목록</button>
	</form>
<script type="text/javascript">
$(document).ready(function(){
	var menu_gubun = $('#menu_gubun').text();
	if(menu_gubun == 'member_index'){
		$('#button').css("display","");
	}
});
function sujeong(value1){
	if(document.viewForm.pw.value == ""){
		alert('비밀번호를 입력해주세요.')
		
	}else if(confirm('수정 페이지로 가시겠습니까?')){
		sunteak_proc('modify','',value1);
	}
}

function remove(value1){
	if(document.viewForm.pw.value == ""){
		alert('비밀번호를 입력해주세요.')
		
	}else if(confirm('삭제페이지로 가시겠습니까?')){
		sunteak_proc('delete','',value1);
	}
}
</script>
</body>
</html>