<%@page import="java.net.Inet4Address"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="src.board.model.dto.BoardDTO" %>   
<%@ page import="src.board.model.dao.BoardDAO" %>   
<%-- <%@ include file="../include/include_check/include_check.jsp" %> --%>
<%-- <%@ include file="../include/include_check/include_session.jsp" %> --%>

<%
	String referer = request.getHeader("REFERER");
	String ip = Inet4Address.getLocalHost().getHostAddress();
%>

클라이언트ip: <%=request.getRemoteAddr() %><br>
요청URI: <%=request.getRequestURI() %><br>
컨텍스트경로: <%=request.getContextPath() %><br>
서버이름: <%=request.getServerName() %><br>
서버포트: <%=request.getServerPort() %><br>

requested URL : <%=request.getRequestURL() %><br>
requested Info: <%=request.getRequestURI() %><br>

<% 	
	BoardDAO dao1 = new BoardDAO();
	ArrayList<BoardDTO> list = dao1.getSelectAll(); 
	
	
	
%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
</head>
<body>
	<table border="1">
<!-- 		<tr> -->
<!-- 			<td> -->
<%-- 				<%@ include file="../include/include_top.jsp" %> --%>
<!-- 			</td> -->
<!-- 		</tr> -->
		<tr>
			<td>	
				<h2>게시판</h2>
				<div style="border:1px solid black; height:"300px; width="750";></div>
				<form name="list">
					<table border="1" width="1800px" align="left">
						<tr align ="center">
							<td>순번</td>
							<td>제목</td>
							<td>작성자</td>
							<td>등록일</td>
							<td>조회수</td>
							<td>RefNo</td>
							<td>stepNo</td>
							<td>levelNo</td>
						</tr>
						
						<% for(int i=0; i<list.size(); i++){ 
							BoardDTO dto1 = list.get(i);
							
							if(dto1.getService()!=0){
							String Re="";
							if(dto1.getStepNo() >= 2){for(int k=2; k<=dto1.getStepNo(); k++){
								Re += "&nbsp;&nbsp;&nbsp;";
							}
							Re= Re+"┗ Re :";}
						%>	
						<tr>
							<td><%=dto1.getNum() %></td>
							<td width="650"><input type="hidden"><%=Re %>
							<a href="#" onclick="view('<%=dto1.getNo()%>');" ><%=dto1.getSubject() %></a>
							</td>
							<td align="center"><%=dto1.getWriter() %></td>
							<td align="center"><%=dto1.getRegiDate() %></td>
							<td align="center"><%=dto1.getHit() %></td>
							<td><%=dto1.getRefNo() %></td>
							<td><%=dto1.getStepNo() %></td>
							<td><%=dto1.getLevelNo() %></td>
						</tr>
						<%}}
							if(list.size()==0){
						%>
						
						<tr height="300" align="center">
							<td colspan="8" align="center">게시글이 존재하지 않음.</td>	
						</tr>
						<%} %>
						<tr>
							<td colspan="8" align="leff">
								<button type = "button" onclick="location.href='list.jsp';">전체글</button>&nbsp;&nbsp;
								<button type = "button" onclick="location.href='write.jsp';">글쓰기</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								
								<select name="bunryu">
									<option value="subject">제목+내용</option>
									<option value="writer">작성자</option>
									<option value="regidate">등록일</option>
								</select>
								<input type="text" name="search" style="width:500px" value="">
								<button type="button" onclick="go();">검색</button>
							</td>
						</tr>
					</table>
				</form>
			</td>
		</tr>
	</table>
</body>
</html>

<script>
	function view(value1){
		location.href='view.jsp?no='+value1;
	}
	
	function go(){
		
		location.href='search.jsp?search='+document.list.search.value +'&bunryu='+document.list.bunryu.value;
	}
</script>