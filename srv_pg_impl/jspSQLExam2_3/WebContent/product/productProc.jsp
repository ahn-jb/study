<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/include_import.jsp" %>
<%request.setCharacterEncoding("UTF-8");%>

<jsp:useBean id="dto" class="model.product.ProductDTO"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>

<%
	int no = Integer.parseInt(request.getParameter("no"));
	System.out.println(no);

	ProductDAO dao = new ProductDAO();
	int result = dao.setInsert(dto);
	
	if(result >0){
		out.println("<script>");
		out.println("alert('상품추가 완료.');");
		out.println("location.href='../product/product.jsp?no="+no+"';");
		out.println("</script>");

		}else {
		out.println("<script>");
		out.println("alert('처리중 오류가 발생했습니다.');");
		out.println("location.href='../product/product.jsp?no="+no+"';");
		out.println("</script>");
	}
%>