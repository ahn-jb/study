<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/include_import.jsp" %>
<%@ include file="../include/include_check/include_check.jsp" %>
<%@ include file="../include/include_check/include_session.jsp" %>
<%@ include file="../include/include_check/include_session_check.jsp" %>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="dto" class="model.product.ProductDTO"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>

<%
	int no = cookNo;

	ProductDAO dao = new ProductDAO();
	int result = dao.Gumae(dto);
	
	if(result >0){
		out.println("<script>");
		out.println("alert('상품구매 완료.');");
		out.println("location.href='../member/homepage.jsp';");
		out.println("</script>");

		}else {
		out.println("<script>");
		out.println("alert('처리중 오류가 발생했습니다.');");
		out.println("location.href='../member/homepage.jsp';");
		out.println("</script>");
	}
%>

