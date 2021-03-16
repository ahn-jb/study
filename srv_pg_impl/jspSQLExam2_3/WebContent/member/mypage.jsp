<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/include_import.jsp" %>
<%@ include file="../include/include_check/include_check.jsp" %>
<%@ include file="../include/include_check/include_session.jsp" %>
<%@ include file="../include/include_check/include_session_check.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
</head>
<body>

<script>
	function profile(value1){
		location.href="mypage_profile.jsp?no="+value1;
		
	}
	function ask(value1){
		location.href="mypage_ask.jsp?no="+value1; //include_access 떄문에 no를 함께 넘겨줘야 한다.
	}
	function asklist(value1){
		location.href="mypage_asklist.jsp?no="+value1; //include_access 떄문에 no를 함께 넘겨줘야 한다.
	}
</script>

	<table border="1" width="100%">
		<tr>
			<td>
				<%@ include file="../include/include_top.jsp" %>
			</td>
		</tr>
		<tr>
			<td style="padding:50px 20px;  ">
<%
	MemberDAO_imsi dao2 = new MemberDAO_imsi();
	MemberDTO dto2 = dao2.getSelectOneId(cookId);
%>
				<table>
					<tr>
						<td>
							<a href="#" onclick="profile('<%=dto2.getNo()%>');">내정보</a>
						</td>
					</tr>
					<tr>
						<td>
							<a href="#">구매목록</a>
						</td>
					</tr>
					<tr>
						<td>
							<a href="#" onclick="ask('<%=dto2.getNo()%>');">문의하기</a>
						</td>
					</tr>
					<tr>
						<td>
							<a href="#" onclick="asklist('<%=dto2.getNo()%>');">문의목록</a>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td>
				<jsp:include page="../include/include_bottom.jsp" flush="false"></jsp:include>
			</td>
		</tr>
	</table>

</body>
</html>