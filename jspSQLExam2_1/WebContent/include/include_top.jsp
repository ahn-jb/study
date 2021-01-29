<%@page import="model.member.MemberDTO"%>
<%@page import="model.member.MemberDAO"%>
<%@page import="java.net.Inet4Address"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	 MemberDAO	dao3 = new MemberDAO();
	 MemberDTO dto3 =dao3.getSelectOneId(cookId);
	 
	 String rank ="";
		if(dto3.getGrade()==1){rank="General manager";}else if(dto3.getGrade()==2){rank="Product manager";}else if(dto3.getGrade()==3){rank="Delivery manager";}
%>
<table border="0" align="center" width="600">
	<tr>
		<th height="30"><a href="../member/homepage.jsp">HOME</a></th>
		<% if(dto3.getGrade() ==1 || dto3.getGrade() ==2 || dto3.getGrade() ==3){ %>
		<th><a href="#" onclick="member('<%=dto3.getNo()%>');">관리하기</a></th>
		<%} %>
		
		<%if(dto3.getId() != null){ %>
		<th><a href="../member/mypage.jsp">마이페이지</a></th>
		<%}
		%>
		<th><a href="../board/list.jsp">게시판</a></th>
		
		<% if(dto3.getId() != null){ %>
		<th><a href="../member/logout.jsp">로그아웃(<%=dto3.getName() %>)</a></th>
		<%}else{ %>
		<th><a href="../member/login.jsp">로그인</a></th>
		<%} %>
		<th>ip:<%=Inet4Address.getLocalHost().getHostAddress() %></th>
	</tr>
</table>
<script>
	function member(value1){
		location.href="../member/member.jsp?no="+value1;	
	} 
</script>