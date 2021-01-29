<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품등록</title>
</head>
<body>
	<h2>상품등록</h2>
	<form name="productForm">
		<table border="1">
			<tr>
				<td>상품카테고리</td>
				<td>
					<input type="radio" name="cate" value="가구">가구
					<input type="radio" name="cate" value="의류">의류
					<input type="radio" name="cate" value="컴퓨터">컴퓨터
					<input type="radio" name="cate" value="가전">가전
				</td> 
			</tr>
			<tr>
				<td>상품명</td>
				<td><input type="text" name="pname"></td>
			</tr>
			<tr>
				<td>가격</td>
				<td><input type="text" name="price" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"> 
					<button type="button" onclick="save();">등록하기</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>

<script>
function save(){
	if(document.productForm.cate.value.trim()==""){
		alert('가테고리를 선택해 주세요.');
		document.productForm.cate.focus();
		return false;
	}else if(document.productForm.pname.value.trim()==""){
		alert('상품명을 입력해 주세요.');
		document.productForm.pname.focus();
		return false;
	}else if(document.productForm.price.value.trim()==""){
		alert('가격을 입력해 주세요.');
		document.productForm.price.focus();
		return false;
	}else if(confirm('등록 하시겠습니까?')){
		document.productForm.method='post';
		document.productForm.action='productProc.jsp';
		document.productForm.submit();
	}
}	
</script>