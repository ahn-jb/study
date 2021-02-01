<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/inc_header.jsp" %>

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
				<td><input type="text" name="grade" id="grade" value="${dto.getGrade()}" readonly></td>
			</tr>
			<tr>
				<td>아이디:</td>
				<td><input type="text" name="id"  id="id" value="${dto.getId()}" readonly></td>
			</tr>
			<tr>
				<td>비밀번호:</td>
				<td><input type="password" name="pw" id="pw"></td>
			</tr>
			<tr>
				<td>이름:</td>
				<td><input type="text" name="name" id="name" value="${dto.getName()}" readonly></td>
			</tr>
			<tr>
				<td>성별:</td>
				<td>
					<input type="text" name="gender" id="gender" value="${dto.getGender()}" readonly>
				</td>
			</tr>
			<tr>
				<td>생년:</td>
				<td><input type="text" name="bornYear" id="bornYear" value="${dto.getBornYear()}" readonly></td>
			</tr>
			<tr>
				<td>우편번호</td>
				<td><input type="text" name="postNum" id="postNum" value="${dto.getPostNum()}" readonly></td>
			</tr>
			<tr>
				<td>도로명주소</td>
				<td><input type="text" name="street_addr" id="street_addr" value="${dto.getStreet_addr()}" readonly></td>
			</tr>
			<tr>
				<td>지번주소</td>
				<td><input type="text" name="parcel_addr" id="parcel_addr" value="${dto.getParcel_addr()}" readonly></td>
			</tr>
			<tr>
				<td>상세주소</td>
				<td><input type="text" name="detail_addr" id="detail_addr" value="${dto.getDetail_addr()}" readonly></td>
			</tr>
	</table>
		<br>
			<button type="button" onclick="sujeong('${dto.getPw()}','${dto.getNo()}');">수정하기</button>
			<button type="button" onclick="remove('${dto.getPw()}','${dto.getNo()}');">삭제하기</button>
			<button type="button" onclick="history.back()">취소</button>
		<br><br>
			<input type="button" id="btnSave2" value="json">
	</form>
	<br><br><br>
	<span id="resultJson"></span><br><br>
	<table border="1">
			<tr>
				<td>등급:</td>
				<td><span  id="grade2" ></span></td>
			</tr>
			<tr>
				<td>아이디:</td>
				<td><span  id="id2" ></span></td>
			</tr>
			<tr>
				<td>비밀번호:</td>
				<td><span  id="pw2" ></span></td>
			</tr>
			<tr>
				<td>이름:</td>
				<td><span  id="name2" ></span></td>
			</tr>
			<tr>
				<td>성별:</td>
				<td>
					<span  id="gender2" ></span>
				</td>
			</tr>
			<tr>
				<td>생년:</td>
				<td><span  id="bornYear2" ></span></td>
			</tr>
			<tr>
				<td>우편번호</td>
				<td><span  id="postNum2" ></span></td>
			</tr>
			<tr>
				<td>도로명주소</td>
				<td><span  id="street_addr2" ></span></td>
			</tr>
			<tr>
				<td>지번주소</td>
				<td><span  id="parcel_addr2" ></span></td>
			</tr>
			<tr>
				<td>상세주소</td>
				<td><span  id="detail_addr2" ></span></td>
			</tr>
			<tr>
				<td>날짜</td>
				<td><span  id="regidate2" ></span></td>
			</tr>
	</table>
<script type="text/javascript">
function sujeong(value1,value2){
	if(document.viewForm.pw.value != value1){
		alert('비밀번호가 다릅니다.')
		location.href="${path}/member_servlet/view.do?no="+value2;
	}else if(confirm('수정 페이지로 가시겠습니까?')){
		location.href="${path}/member_servlet/modify.do?no="+value2;
	}
}

function remove(value1,value2){
	if(document.viewForm.pw.value != value1){
		alert('비밀번호가 다릅니다.')
		location.href="${path}/member_servlet/view.do?no="+value2;
	}else if(confirm('삭제페이지로 가시겠습니까?')){
		location.href="${path}/member_servlet/delete.do?no="+value2;
	}
}

$(document).ready(function(){
	$("#btnSave2").click(function(){
		checkProc();
	});
});
function checkProc(){
	var param = {
		"no" : "${dto.getNo()}",

	}
	$.ajax({
		type: "post",
		data: param,
		datatype: "JSON",
		url: "${path}/member/jsonTest.jsp",
		success: function(data){
			$("#resultJson").text(data);
			
			var json_sj = JSON.parse(data);
			$("#grade2").text(json_sj.grade);
			$("#id2").text(json_sj.id);
			$("#pw2").text(json_sj.pw);
			$("#name2").text(json_sj.name);
			$("#gender2").text(json_sj.gender);
			$("#bornYear2").text(json_sj.bornYear);
			$("#postNum2").text(json_sj.postNum);
			$("#street_addr2").text(json_sj.street_addr);
			$("#detail_addr2").text(json_sj.detail_addr);
			$("#parcel_addr2").text(json_sj.parcel_addr);
			$("#regidate2").text(json_sj.regidate);
		}
	});
}
</script>
</body>
</html>