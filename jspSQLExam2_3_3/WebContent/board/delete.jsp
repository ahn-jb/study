<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>

<%@ include file="../include/include_import.jsp" %>
<%@ include file="../include/include_check/include_check.jsp" %>
<%@ include file="../include/include_check/include_session.jsp" %>
<%@ include file="../include/include_check/include_session_check.jsp" %>

<%
	int no = Integer.parseInt(request.getParameter("no"));

	BoardDAO dao = new BoardDAO();  
	BoardDTO dto = dao.getSelectOne(no);


	MemberDAO dao_member = new MemberDAO();
 	MemberDTO dto_member = dao_member.getSelectOneNo(cookNo);
 	
 	if(dto_member.getGrade() ==1 || dto.getWriter().equals(dto_member.getId())){
 		
 		int result = dao.Delete(no);
 		
 		 if(result>0){
 			out.println("<script>");
 			out.println("alert('정상 처리 되었습니다.');");
 			out.println("location.href='list.jsp';");
 			out.println("</script>");
 			
 		}else{
 			out.println("<script>");
 			out.println("alert('처리중 오류가 발생했습니다.');");
 			out.println("location.href='list.jsp';");
 			out.println("</script>");
 		}
 		
 	}else if(!dto.getWriter().equals(dto_member.getId())){
 		out.println("<script>");
		out.println("alert('작성자가 아닙니다.');");
		out.println("location.href='../board/list.jsp';");
		out.println("</script>");
 	}
 	
 	
 	
%>
