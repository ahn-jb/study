<%@page import="model.member.MemberDTO"%>
<%@ page import="model.member.MemberDAO" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
 <%
	 MemberDAO	dao4 = new MemberDAO();
	 MemberDTO dto4 =dao4.getSelectOneNo(cookNo); //오류 아님
	 
// 	System.out.println(cookId);
// 	System.out.println(dto.getId());
	 
 	if(dto4.getNo() == 0 ){
 		session.invalidate();
 		
		out.println("<script>");
		out.println("location.href='../member/login.jsp';");
		out.println("</script>");
		
	}else if( Integer.parseInt(session.getAttribute("cookNo").toString()) != 0){
	
	
 %>
 <table border="1" width="450" align="center">
	<tr>
		<td colspan="6" height="50" align="right" >
			<%=dto4.getId() %>[ <%=rank %> ]님 환영합니다
	    	<button type="button" onclick="location.href='logout.jsp';">로그아웃</button>
		</td>
	</tr>
	<tr>
		<%if(dto4.getGrade() == 1){ %>
		<td><a href="#" onclick="memberMG('<%=dto4.getNo()%>')">회원관리</a></td>
		<%} %>
		<%if(dto4.getGrade()== 1 || dto4.getGrade()== 2){ %>
		<td><a href="#" onclick="pro('<%=dto4.getNo()%>')">상품관리</a></td>
		<%} %>
		<%if(dto4.getGrade()== 1 || dto4.getGrade()== 3){ %>
		<td><a href="#">배송관리</a></td>
		<%} %>
		<td><a href="#" onclick="memberAsk('<%=dto4.getNo()%>')">문의관리</a></td>
		<td><a href="#">주문페이지</a></td>
		
		
	</tr>
</table>
<hr>
<%} %>	
<script>
	function memberAsk(value1){
		location.href="../member/member_ask.jsp?no="+value1;
	}
	function memberMG(value1){
		location.href="../member/member_management.jsp?no="+value1;
	}
	function pro(value1){
		location.href="../product/productMenu.jsp?no="+value1;
	}
</script>