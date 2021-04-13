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
	<table border="0" align="center">
		<tr>
			<td colspan="15" align="right" style="padding:5px 20px 10px;"  >
			<c:if test="${sessionScope.cookNo == null || sessionScope.cookNo == 0}">
				<a href="${path}/member/login2.do" id="memberLogin" style="text-decoration: none">로그인</a>&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="${path}/member/chuga2.do" id="memberChuga" style="text-decoration: none">회원가입</a>
			</c:if>
			
			<c:if test="${sessionScope.cookNo != null && sessionScope.cookNo != 0}">
				<c:set var="cookNo" value="${sessionScope.cookNo}"></c:set>
				<a style="font-size:1.1em; font-weight:bold; ">${sessionScope.cookName}님 환영합니다.</a> &nbsp;&nbsp;
				<a href="${path}/member/view2.do?no=${cookNo}" id="memberView" style="text-decoration: none">[내정보]</a>&nbsp;&nbsp;
				<a href="${path}/member/logout.do" style="text-decoration: none">[로그아웃]</a>
			</c:if>
			</td> 
		</tr>
		<tr>
			<td style="padding:0px 20px;" id="home">
				<a href="${path}" style="text-decoration: none">HOME</a>
			</td>
<%-- 			<c:if test="${sessionScope.cookNo != null && sessionScope.cookNo != 0}"> --%>
			<td style="padding:0px 20px;" id="member">
				<a href="${path}/member/index.do" style="text-decoration: none">회원관리</a>
			</td>
<%-- 			</c:if> --%>
			<td style="padding:0px 20px;" id="memo">
				<a href="${path}/memo/write.do" style="text-decoration: none">메모장</a>
			</td>
			<td style="padding:0px 20px;" id="guestbook">
				<a href="${path}/guestbook/list.do" style="text-decoration: none">방명록</a>
			</td>
			<td style="padding:0px 20px;" id="surveyAjax">
				<a href="${path}/survey/index.do" style="text-decoration: none">설문조사(ajax)</a>
			</td>
			<td style="padding:0px 20px;" id="survey">
				<a href="${path}/test/list.do" style="text-decoration: none">설문조사</a>
			</td>
			<td style="padding:0px 20px;" id="munje">
				<a href="${path}/munje/index.do" style="text-decoration: none">문제은행</a>
			</td>
			<td style="padding:0px 20px;" id="boardAjax">
				<a href="${path}/board/index.do" style="text-decoration: none">게시판(ajax)</a>
			</td>
			<td style="padding:0px 20px;" id="board">
				<a href="${path}/board2/list.do" style="text-decoration: none">자유게시판</a>
			</td>
			<td style="padding:0px 20px;" id="java">
				<a href="${path}/board2/list.do?tbl=javaboard" style="text-decoration: none">자바게시판</a>
			</td>
			<td style="padding:0px 20px;" id="productAjax">
				<a href="${path}/product/index.do" style="text-decoration: none">쇼핑몰[관리자](ajax)</a>
			</td>
			<td style="padding:0px 20px;" id="mallAjax">
				<a href="${path}/mall/index.do" style="text-decoration: none">쇼핑몰(ajax)</a>
			</td>
			<td style="padding:0px 20px;" id="chart">
				<a href="${path}/chart/index.do" style="text-decoration: none">Chart</a>
			</td>
			<td style="padding:0px 20px;" id="smtpEmail">
				<a href="${path}/email/index.do" style="text-decoration: none">Email</a>
			</td>
			<td style="padding:0px 20px;" id="calculator">
				<a href="${path}/calculator/index.do" style="text-decoration: none">계산기</a>
			</td>
			
		</tr>	
	</table>
	<c:set var="menu_str01" value="${fn:indexOf(menu_gubun,'_')}"/>
	<c:set var="menu_str02" value="${fn:substring(menu_gubun,0,menu_str01)}"/>
	<c:set var="menu_str03" value="${fn:substring(menu_gubun,menu_str01,100)}"/>
		<c:choose>
			<c:when test="${menu_str02 == 'index' }">
				<script>$("#home").css("background-color","silver");</script>
			</c:when>
			<c:when test="${menu_str02 == 'member' }">
				<c:if test="${menu_str03 == '_index' }">
					<script>$("#member").css("background-color","silver");</script>
				</c:if>
				<c:if test="${menu_str03 == '_login2' }">
					<script>$("#memberLogin").css("background-color","silver");</script>
				</c:if>
				<c:if test="${menu_str03 == '_chuga2' }">
					<script>$("#memberChuga").css("background-color","silver");</script>
				</c:if>
				<c:if test="${menu_str03 == '_view2' }">
					<script>$("#memberView").css("background-color","silver");</script>
				</c:if>
			</c:when>
			<c:when test="${menu_str02 == 'memo' }">
				<script>$("#memo").css("background-color","silver");</script>
			</c:when>
			<c:when test="${menu_str02 == 'guestbook' }">
				<script>$("#guestbook").css("background-color","silver");</script>
			</c:when>
			<c:when test="${menu_str02 == 'survey' }">
				<script>$("#surveyAjax").css("background-color","silver");</script>
			</c:when>
			<c:when test="${menu_str02 == 'test' }">
				<script>$("#survey").css("background-color","silver");</script>
			</c:when>
			<c:when test="${menu_str02 == 'munje' }">
				<script>$("#munje").css("background-color","silver");</script>
			</c:when>
			<c:when test="${menu_str02 == 'board' }">
				<script>$("#boardAjax").css("background-color","silver");</script>
			</c:when>
			<c:when test="${menu_str02 == 'board2' }">
				<c:if test="${tbl == 'freeboard' }">
					<script>$("#board").css("background-color","silver");</script>
				</c:if>
				<c:if test="${tbl == 'javaboard' }">
					<script>$("#java").css("background-color","silver");</script>
				</c:if>
			</c:when>
			<c:when test="${menu_str02 == 'calculator' }">
				<script>$("#calculator").css("background-color","silver");</script>
			</c:when>
			<c:when test="${menu_str02 == 'product' }">
				<script>$("#productAjax").css("background-color","silver");</script>
			</c:when>
			<c:when test="${menu_str02 == 'mall' }">
				<script>$("#mallAjax").css("background-color","silver");</script>
			</c:when>
			<c:when test="${menu_str02 == 'chart' }">
				<script>$("#chart").css("background-color","silver");</script>
			</c:when>
			<c:when test="${menu_str02 == 'email' }">
				<script>$("#smtpEmail").css("background-color","silver");</script>
			</c:when>
	</c:choose>
<%-- 				${menu_gubun}/ --%>
<%-- 				${menu_str01}/ --%>
<%-- 				${menu_str02 }/ --%>
<%-- 				${tbl}/ --%>
<%-- 				${menu_str03 } --%>
</body>
</html>

