<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/inc_header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1" width="1000">
		<tr>
			<td colspan="2" >
				<h2>상품등록</h2>
			</td>
		</tr>
		<tr>
			<td>상품명</td>
			<td><input type="text" id="name"></td>
		</tr>
		<tr>
			<td>가격</td>
			<td><input type="text" id="price"></td>
		</tr>
		<tr>
			<td>상품설명</td>
			<td><textarea name="content" id ="description" style="width:98%; height:100px;" ></textarea></td>
		</tr>
		<tr>
			<td>상품이미지</td>
			<td>
				<input type="file" name="file" id="product_img">
				<input type="file" name="file" id="product_img">
				<input type="file" name="file" id="product_img">				
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center" height="50px;">
				<button type="button" id="btnChugaProc">등록하기</button>
				<button type="button" id="btnlist">취소</button>
			</td>
		</tr>
	</table>
<script>
$(document).ready(function(){
	$("#name").focus();
	
	$("#btnChugaProc").click(function(){
		if(confirm('등록하시겠습니까?')){
			suntaek_proc('chugaProc','1','');
		}
	});
	$("#btnlist").click(function(){
		suntaek_proc('list','1','');
	});
});
</script>
</body>
</html>