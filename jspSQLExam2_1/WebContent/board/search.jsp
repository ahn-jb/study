<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>

<%@ include file="../include/include_import.jsp" %>
<%@ include file="../include/include_check/include_check.jsp" %>
<%@ include file="../include/include_check/include_session.jsp" %>


<%
	String search = request.getParameter("search");
	String bunryu = request.getParameter("bunryu");
	
	BoardDAO dao_1 = new BoardDAO();
	
	String pageSize_ =request.getParameter("pageSize");
	int pageSize = 20;//한 페이지에 출력할 레코드 수
	if(pageSize_ != null){
		pageSize = Integer.parseInt(pageSize_);
	}
	
	
	
	String pageNum = request.getParameter("pageNum");
	if(pageNum == null){//클릭한게 없으면 1번 페이지
		pageNum ="1";
	}
	
	int currentPage = Integer.parseInt(pageNum); //현재페이지-연산을 하기 위한 pageNum 형변환	
	
	int startRow =(currentPage -1)*pageSize +1; //해당 페이지에서 시작할 레코드 
	int endRow = currentPage * pageSize; // 해당 페이지 마지막 레코드
	
	int count = 0;
	count = dao_1.getCount();
	
	ArrayList<BoardDTO> list = null;
	if(count > 0 ){
		if(!bunryu.equals("total")){
			list = dao_1.search(search,bunryu,startRow,endRow);
			count =dao_1.getCount(search, bunryu);
		}else{
			list = dao_1.search(search,startRow,endRow);
			count =dao_1.getCount(search);
		}
	}
	

	
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
</head>
<body>
	<table border="1" width="100%">
		<tr>
			<td>
				<%@ include file="../include/include_top.jsp" %>
			</td>
		</tr>
		<tr>
			<td>
				<div style="border:1px solid black; height:"300px; width="750";></div>
				<form name="list">
					<h2>게시판</h2>
					(총 레코드 수:<%=count %>)
					<table border="1" width="1800px" align="left">
					<tr>
						<td colspan ="8" align="right" >PageSize-
							<select name="pageSize" style="width:60px" onchange="location.href=this.value"> 							
								<option value="">[<%=pageSize %>]</option>
								<option value="search.jsp?pageSize=20&pageNum=<%=pageNum%>&search=<%=search%>&bunryu=<%=bunryu%>">20</option>
								<option value="search.jsp?pageSize=30&pageNum=<%=pageNum%>&search=<%=search%>&bunryu=<%=bunryu%>">30</option>
								<option value="search.jsp?pageSize=50&pageNum=<%=pageNum%>&search=<%=search%>&bunryu=<%=bunryu%>">50</option>
							</select>
						</td>
					</tr>
						<tr align ="center">
							<td>글번호</td>
							<td>제목</td>
							<td>작성자</td>
							<td>등록일</td>
							<td>조회수</td>
							<td>RefNo</td>
							<td>stepNo</td>
							<td>levelNo</td>
						</tr>
						
						<%	if(count> 0){
								int number = count - (currentPage-1)*pageSize;
							
								for(int i=0; i<list.size(); i++){ 
									BoardDTO dto = list.get(i);
							
									if(dto.getService() >0){
								
										String Re="";
										if(dto.getStepNo() >= 2){
											for(int k=2; k<=dto.getStepNo(); k++){
												Re += "&nbsp;&nbsp;&nbsp;";
											}
											Re= Re+"┗ Re :";
										}
						%>
						<tr>
							<td><%=dto.getNum() %></td>
							<td width="650"><input type="hidden"><%=Re %>
							<a href="#" onclick="view('<%=dto.getNo()%>');" ><%=dto.getSubject() %></a>
							</td>
							<td align="center"><%=dto.getWriter() %></td>
							<td align="center"><%=dto.getRegiDate() %></td>
							<td align="center"><%=dto.getHit() %></td>
							<td><%=dto.getRefNo() %></td>
							<td><%=dto.getStepNo() %></td>
							<td><%=dto.getLevelNo() %></td>
						</tr>
						<%}}}else{%>
						<tr height="300" align="center">
							<td colspan="8" align="center">게시글이 존재하지 않음.</td>
						</tr>
						<%} %>
				
						<tr>
							<td colspan="8" align="leff">
								<button type = "button" onclick="location.href='list.jsp';">전체글</button>&nbsp;&nbsp;
								<button type = "button" onclick="location.href='write.jsp';">글쓰기</button>&nbsp;&nbsp;&nbsp;
								
								<select name="bunryu">
									<option value="total">제목+내용</option>
									<option value="subject">제목</option>
									<option value="content">내용</option>
									<option value="writer">작성자</option>
								</select>
								<input type="text" name="search" style="width:400px" value="">
								<button type="button" onclick="go();">검색</button>&nbsp;&nbsp;&nbsp; 
								
								<%	
								if(count >0){ 
								int pageCount = count / pageSize + (count%pageSize == 0 ? 0:1);//총 페이지의 수
								int pageBlock = 10; //한 페이지에 보여줄 페이지 블록(링크) 수
								int startPage = ((currentPage -1)/pageBlock)*pageBlock +1; //한 페이지에 보여줄 시작 번호
								int endPage = startPage + pageBlock -1; //한 페이지에 보여줄 끝 번호
								
								if(endPage > pageCount){//마지막 페이지가 총 페이지 수 보다 크면 endpage 를 pageCount로 할당
									endPage = pageCount;
								}
								
								if(startPage > pageBlock){//페이지 블록수보다 startPage가 클경우 이전 링크 생성
								%>		
									- <a href="search.jsp?pageNum=<%=startPage-10%>&search=<%=search%>&bunryu=<%=bunryu%>">[이전]</a>
								<%		
								}else{
								%>
									-
								<% 	
								}
								for(int i=startPage; i<= endPage; i++){//페이지 블록 번호
									if(i == currentPage){//현재 페이지는 링크를 설정 X
									
									%>			
										[<%=i%>]
									<%		
									}else{
									%>			
										<a href="search.jsp?pageNum=<%=i%>&search=<%=search%>&bunryu=<%=bunryu%>">[<%=i %>]</a>
									<%
									}
								}
								if(endPage < pageCount){
								%>		
									<a href="search.jsp?pageNum=<%=startPage+10%>&search=<%=search%>&bunryu=<%=bunryu%>">[다음]</a> -
								<%	
								}else{
								%>
									-
								<%
								}
									
								}
								%>
							</td>
						</tr>
					</table>
				</form>
			</td>
		</tr>
		<tr>
			<td colspan="1"><%@ include file="../include/include_bottom.jsp" %></td>
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