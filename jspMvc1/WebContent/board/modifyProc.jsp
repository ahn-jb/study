<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <% request.setCharacterEncoding("UTF-8"); %>
  
 <%@ page import="board.BoardDAO" %>  
  <%@ page import="board.BoardDTO" %>   
 


<%
	BoardDTO dto = new BoardDTO();
	dto.setNo(Integer.parseInt(request.getParameter("no")));
	dto.setEmail(request.getParameter("email"));
	dto.setSubject(request.getParameter("subject"));
	dto.setContent(request.getParameter("content"));
	BoardDAO dao = new BoardDAO();
	int result = dao.setUpdate(dto); 
	
	if(result>0){
		out.println("<script>");
		out.println("alert('정상 처리 되었습니다.');");
		out.println("location.href='view.jsp?no="+request.getParameter("no")+"';");
		out.println("</script>");
		
	}else{
		out.println("<script>");
		out.println("alert('처리중 오류가 발생했습니다.');");
		out.println("location.href='list.jsp';");
		out.println("</script>");
	}
%>
