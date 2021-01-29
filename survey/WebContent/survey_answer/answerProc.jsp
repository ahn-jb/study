<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<%@ page import="answer.AnswerDAO"%>
<%@ page import="answer.AnswerDTO"%>
<%-- <jsp:useBean id="dto" class="answer.AnswerDTO" scope="page"></jsp:useBean> --%>
<%-- <jsp:setProperty property="*" name="dto"/> --%>

<%
	int counter = Integer.parseInt(request.getParameter("counter"));

	AnswerDTO dto = new AnswerDTO();
	
	for(int i=0; i<counter; i++){
			
		int survey_no = Integer.parseInt(request.getParameter("survey_no_"+i ));
		int survey_answer =  Integer.parseInt(request.getParameter("survey_answer_"+i ));
		 
		 AnswerDAO dao = new AnswerDAO();
			int result = dao.setInsert(survey_no,survey_answer);
			 
			if(result>0){
				out.println("<script>");
				out.println("alert('정상 처리 되었습니다.');");
				out.println("location.href='answer_list.jsp';");
				out.println("</script>");
				
			}else{
				out.println("<script>");
				out.println("alert('처리중 오류가 발생했습니다.');");
				out.println("location.href='answer.jsp';");
				out.println("</script>");
			}
	}
	
%>