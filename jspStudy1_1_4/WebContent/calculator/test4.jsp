<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	......!!!
<script>
$(document).keydown(function(event) {
  if (event.keyCode == '37') {
    alert('좌측 화살키를 누르셨습니다.');
  }
  else if (event.keyCode == '39') {
    alert('우측 화살키를 누르셨습니다.');
  }
});
$(document).keydown(function(event) {
  console.log(event.keyCode);
});
</script>
</body>
</html>