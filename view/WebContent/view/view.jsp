<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Rogin</title>
</head>
<body>

	<form name="view">
		<table>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="aptId" value="XII/101/101"></td>
			</tr>
		</table>
		<button type="button" onclick="go();">접속하기</button>
	</form>
	
</body>
</html>

<script >
 function go(){
	 document.view.method="post";
	 document.view.action="viewProc.jsp";
	 document.view.submit();
	 }
</script>