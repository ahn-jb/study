<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<style type="text/css">
div {
  font-size: 2rem;
  text-align: center;
  color: white;
  background: black;
  border-radius: 1rem;
  padding: 2rem;
  transition: all 0.5s ease;
}

.pressed {
  background: tomato;
/*   transform: scale(1.2); */
}
</style>
<title>Insert title here</title>
</head>
<body>

<div id="*">1</div>
<div id="-">2</div>
<div id="+">3</div>	

<script>
window.addEventListener("keydown", e => {
   const key = document.getElementById(e.key);
   if (key) key.classList.add('pressed');
});
window.addEventListener("keyup", e => {
   const key = document.getElementById(e.key);
   if (key) key.classList.remove('pressed');
});
</script>
</body>
</html>