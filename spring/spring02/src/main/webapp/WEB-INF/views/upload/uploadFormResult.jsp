<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/inc_header.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="-1"/><!-- 0 -->
<meta http-equiv="Pragma" content="no-cache"/>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%-- <jsp:include page="../include/inc_menu.jsp" /> --%>
<%-- <%@include file="../include/inc_menu.jsp"%> --%>

${path }<br>
파일이 업로드 되었습니다.<br>
originalFileName : ${map.originalFileName}<br>
newFileName : ${map.newFileName}<br>
newFileSize : ${map.newFileSize}<br>
newFileType : ${map.newFileType}<br>
mimeType : ${map.mimeType}<br>
failCounter : ${map.failCounter}<br>

<%--
파일 이름에 한글이 잇을 경우 못 불러오는 경우가 있음..
<img src = "/spring01/attach/test_img/${map.newFileName}"><hr>
<img src = "<spring:url value = '/attach/test_img/${map.newFileName}'/>" /><hr>
--%>

<img src="" id="imsi">

<script>
	function toggle_img() {
		var imgName = "/spring01/attach/test_img/${map.newFileName}";
		//alert(imgName);
		document.getElementById("imsi").src = imgName;
	}
	
	//toggle_img();
</script>


<c:choose>
	<c:when test="${map.mimeType == 'image/jpeg' || dto.mimeType == 'image/png' || dto.mimeType == 'image/gif'}">
		<img src="${path }/attach/test_img/${map.newFileName}" width="100px" height="100px">
	</c:when>
	<c:otherwise>
		이미지아님!!!
	</c:otherwise>
</c:choose>	
			
			
			
			
			
</body>
</html>

<%--
servlet-context.xml 에서 다음 내용 등록하고,
	<resources mapping="/attach/**" location="file:///Users/macbook01/Desktop/hj/attach/" />
	
출력페이지에서 	
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%> 
<img src="/spring01/attach/test_img/${map.newFileName}"><hr>
<img src = "<spring:url value = '/attach/test_img/${map.newFileName}'/>" />

해보면 잘 나옴..
--%>


