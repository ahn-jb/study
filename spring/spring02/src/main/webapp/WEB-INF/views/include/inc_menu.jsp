<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%--   
<%@include file="../include/inc_header.jsp"%>
--%>  

<a href="${path }">home</a>
|
<a href="${path }/test01.do">test01</a>
|
<a href="${path }/test02.do">test02</a>
|
<a href="${path }/test03.do">test03</a>
|
<a href="${path }/test04.do">test04</a>
|
<a href="${path }/test05.do">test05</a>
|
<a href="${path }/test06.do">test06</a>
|
<a href="${path }/test07.do">test07(ModelAndView)</a>
|
<a href="${path }/test08.do">test08(ajax)</a>
|
<a href="${path }/test09.do">test09(ajax) (return 객체)</a>
<br>
|
<a href="${path }/memberList.do">회원관리</a>
|
<a href="${path }/upload/uploadForm">파일업로드(1)</a>
|
<a href="${path }/uploadDrag/uploadForm">파일업로드(2)</a>
|
<a href="${path }/productList">상품관리(ing)</a>
|
<a href="${path }/boardList">게시판(ing)</a>


<br><br>
<c:choose>
	<c:when test="${sessionScope.id == null}"> <!--  sessionScope : 세션 영역에 저장된 변수를 뜻한다. -->
		<a href="${path }/memberLogin">로그인</a>
	</c:when>
	<c:otherwise><!-- else 와 같음. 그 이외에는.. -->
		${sessionScope.name} (${sessionScope.id}) 님이 로그인중입니다.
		<a href="${path}/memberLogout">로그아웃</a>
	</c:otherwise>
</c:choose>
	
	
	
<%--
//페이지 블록의 갯수 계산(총 100페이지라면 10개 블록)
public void setTotBlock() {
	totBlock = (int)Math.ceil(totPage / BLOCK_SCALE);
}


	<div style="text-align:right;">
	<c:choose>
		<c:when test="${sessionScope.userid == null}"> <!--  sessionScope : 세션 영역에 저장된 변수를 뜻한다. -->
			<a href="${path}/member/login">로그인</a>
			<a href="${path}/admin/admin">관리자 로그인</a>
		</c:when>
		<c:otherwise><!-- else 와 같음. 그 이외에는.. -->
			${sessionScope.name} (${sessionScope.userid}) 님이 로그인중입니다.<br>
			<a href="${path}/member/logout">로그아웃</a>
		</c:otherwise>
	</c:choose>
	</div>
--%>
	
<hr>
