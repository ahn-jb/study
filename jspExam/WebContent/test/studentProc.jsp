<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>

<%@ page import="student.StudentDAO"%>


<jsp:useBean id="dto" class="student.StudentDTO" scope="page"></jsp:useBean>
<jsp:setProperty name="dto" property="*" />


<%
	StudentDAO dao = new StudentDAO();
	int result = dao.setInsert(dto);


if (result > 0) {
	out.println("<script>");
	out.println("alert('정상 처리 되었습니다.');");
	out.println("location.href='list.jsp';");
	out.println("</script>");

} else {
	out.println("<script>");
	out.println("alert('처리중 오류가 발생했습니다.');");
	out.println("location.href='student.jsp';");
	out.println("</script>");
}

%>