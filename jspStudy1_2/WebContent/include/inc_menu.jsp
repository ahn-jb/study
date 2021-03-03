<%@page import="model.dao.member.MemberDAO"%>
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
			<td colspan="15" align="right" style="padding:5px 20px 10px;">
			<c:if test="${sessionScope.cookNo == null || sessionScope.cookNo == 0}">
				<a href="${path}/member_servlet/login.do">로그인</a>&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="${path}/member_servlet/chuga.do">회원가입</a>
			</c:if>
			
			<c:if test="${sessionScope.cookNo != null && sessionScope.cookNo != 0}">
				<a style="font-size:1.1em; font-weight:bold; ">${sessionScope.cookName}님 환영합니다.</a> &nbsp;&nbsp;
				<a href="#" >[내정보]</a>&nbsp;&nbsp;
				<a href="${path}/member_servlet/logout.do" >[로그아웃]</a>
			</c:if>
			</td> 
		</tr>
		<tr>
			<td style="padding:0px 20px;" id="home">
				<a href="${path}">HOME</a>
			</td>
			<c:if test="${sessionScope.cookNo != null && sessionScope.cookNo != 0}">
			<td style="padding:0px 20px;" id="member">
				<a href="${path}/member_servlet/list.do" >회원관리</a>
			</td>
			</c:if>
			<td style="padding:0px 20px;" id="memo">
				<a href="${path}/memo_servlet/write.do">메모장</a>
			</td>
			<td style="padding:0px 20px;" id="guestbook">
				<a href="${path}/guestbook_servlet/list.do">방명록</a>
			</td>
			<td style="padding:0px 20px;" id="surveyAjax">
				<a href="${path}/survey_servlet/index.do">설문조사(ajax)</a>
			</td>
			<td style="padding:0px 20px;" id="survey">
				<a href="${path}/test_servlet/list.do">설문조사</a>
			</td>
			<td style="padding:0px 20px;" id="boardAjax">
				<a href="${path}/board_servlet/index.do">게시판(ajax)</a>
			</td>
			<td style="padding:0px 20px;" id="board">
				<a href="${path}/board2_servlet/list.do">게시판</a>
			</td>
			<td style="padding:0px 20px;" id="productAjax">
				<a href="${path}/product_servlet/index.do">쇼핑몰(ajax)</a>
			</td>
			<td style="padding:0px 20px;" id="mallAjax">
				<a href="${path}/mall_servlet/index.do">Mall(ajax)</a>
			</td>
			<td style="padding:0px 20px;" id="calculator">
				<a href="${path}/calculator_servlet/index.do">계산기</a>
			</td>
			<td style="padding:0px 20px;">
				<a href="#">관리자</a>
			</td>
			
		</tr>	
	</table>
	<c:set var="menu_str01" value="${fn:indexOf(menu_gubun,'_')}"/>
	<c:set var="menu_str02" value="${fn:substring(menu_gubun,0,menu_str01)}"/>
		<c:choose>
			<c:when test="${menu_str02 == 'index' }">
				<script>$("#home").css("background-color","silver");</script>
			</c:when>
			<c:when test="${menu_str02 == 'member' }">
				<script>$("#member").css("background-color","silver");</script>
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
			<c:when test="${menu_str02 == 'board' }">
				<script>$("#boardAjax").css("background-color","silver");</script>
			</c:when>
			<c:when test="${menu_str02 == 'board2' }">
				<script>$("#board").css("background-color","silver");</script>
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
	</c:choose>
				${menu_gubun}/
				${menu_str01}/
				${menu_str02 } 
</body>
</html>

<%-- ${fn:length(aaa)}<br> --%>
<%-- ${fn:substring(aaa,0,3)}<br> --%>
<%-- ${fn:substring(aaa,9,13)}<br> --%>
<%-- ${fn:indexOf(aaa,"-")}<br>  --%>