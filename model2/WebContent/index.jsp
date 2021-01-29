<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	
	<%String path = request.getContextPath(); out.println(path+"/memo/index.jsp"); %>
<script type="text/javascript">
	location.href=<%=path%>+'/memo/index.jsp';
</script>
	
</body>
</html>