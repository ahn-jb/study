<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/inc_header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${path }</title>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body>
	<table border="1" align="center">
      <tr>
         <td align="center" style="padding:20px 20px;">
            <jsp:include page="../include/inc_menu.jsp"></jsp:include>
         </td>
      </tr>
     <tr>
			<td align="center" style="padding:50px 50px; border-bottom: 2px solid #444444;">
				<c:choose>
					<c:when test="${menu_gubun == 'index'}">
						<jsp:include page="../main/main_sub.jsp" /> 
					</c:when>
					<c:when test="${menu_gubun == 'member_index'}">
						<jsp:include page="../member/index.jsp" />
					</c:when>
					<c:when test="${menu_gubun == 'member_chuga2'}">
						<jsp:include page="../member/index.jsp" />
					</c:when>
					<c:when test="${menu_gubun == 'member_login2'}">
						<jsp:include page="../member/index.jsp" />
					</c:when>
					<c:when test="${menu_gubun == 'member_view2'}">
						<jsp:include page="../member/index.jsp" />
					</c:when>
<%-- 					<c:when test="${menu_gubun == 'memo_write'}"> --%>
<%-- 						<jsp:include page="../memo/write.jsp" /> --%>
<%-- 					</c:when> --%>
<%-- 					<c:when test="${menu_gubun == 'guestbook_list'}"> --%>
<%-- 						<jsp:include page="../guestbook/list.jsp" /> --%>
<%-- 					</c:when> --%>
<%-- 					<c:when test="${menu_gubun == 'guestbook_write'}"> --%>
<%-- 						<jsp:include page="../guestbook/write.jsp" /> --%>
<%-- 					</c:when> --%>
<%-- 					<c:when test="${menu_gubun == 'guestbook_sujeong'}"> --%>
<%-- 						<jsp:include page="../guestbook/sujeong.jsp" /> --%>
<%-- 					</c:when> --%>
<%-- 					<c:when test="${menu_gubun == 'guestbook_sakje'}"> --%>
<%-- 						<jsp:include page="../guestbook/sakje.jsp" /> --%>
<%-- 					</c:when> --%>
<%-- 					<c:when test="${menu_gubun == 'survey_index'}"> --%>
<%-- 						<jsp:include page="../survey/index.jsp" /> --%>
<%-- 					</c:when> --%>
<%-- 					<c:when test="${menu_gubun == 'munje_index'}"> --%>
<%-- 						<jsp:include page="../munje/index.jsp" /> --%>
<%-- 					</c:when> --%>
<%-- 					<c:when test="${menu_gubun == 'board_index'}"> --%>
<%-- 						<jsp:include page="../board/index.jsp" /> --%>
<%-- 					</c:when> --%>
<%-- 					<c:when test="${menu_gubun == 'product_index'}"> --%>
<%-- 						<jsp:include page="../shop/product/index.jsp" /> --%>
<%-- 					</c:when> --%>
<%-- 					<c:when test="${menu_gubun == 'mall_index'}"> --%>
<%-- 						<jsp:include page="../shop/mall/index.jsp" /> --%>
<%-- 					</c:when> --%>
<%-- 					<c:when test="${menu_gubun == 'chart_index'}"> --%>
<%-- 						<jsp:include page="../chart/index.jsp" /> --%>
<%-- 					</c:when> --%>
<%-- 					<c:when test="${menu_gubun == 'email_index'}"> --%>
<%-- 						<jsp:include page="../email/index.jsp" /> --%>
<%-- 					</c:when> --%>
<%-- 					<c:when test="${menu_gubun == 'calculator_index'}"> --%>
<%-- 						<jsp:include page="../calculator/calculator.jsp" /> --%>
<%-- 					</c:when> --%>
					
<%-- 					<c:when test="${menu_gubun == 'test_list'}"> --%>
<%-- 						<jsp:include page="../survey_test/list.jsp" /> --%>
<%-- 					</c:when> --%>
<%-- 					<c:when test="${menu_gubun == 'munje_list_2'}"> --%>
<%-- 						<jsp:include page="../survey_test/list_2.jsp" /> --%>
<%-- 					</c:when> --%>
<%-- 					<c:when test="${menu_gubun == 'test_chuga'}"> --%>
<%-- 						<jsp:include page="../survey_test/chuga.jsp" /> --%>
<%-- 					</c:when> --%>
<%-- 					<c:when test="${menu_gubun == 'test_modify'}"> --%>
<%-- 						<jsp:include page="../survey_test/modify.jsp" /> --%>
<%-- 					</c:when> --%>
<%-- 					<c:when test="${menu_gubun == 'test_send'}"> --%>
<%-- 						<jsp:include page="../survey_test/send2.jsp" /> --%>
<%-- 					</c:when> --%>
<%-- 					<c:when test="${menu_gubun == 'test_view'}"> --%>
<%-- 						<jsp:include page="../survey_test/view.jsp" /> --%>
<%-- 					</c:when> --%>
<%-- 					<c:when test="${menu_gubun == 'board2_list'}"> --%>
<%-- 						<jsp:include page="../board_nomal/list.jsp" /> --%>
<%-- 					</c:when> --%>
<%-- 					<c:when test="${menu_gubun == 'board2_write'}"> --%>
<%-- 						<jsp:include page="../board_nomal/write.jsp" /> --%>
<%-- 					</c:when> --%>
<%-- 					<c:when test="${menu_gubun == 'board2_view'}"> --%>
<%-- 						<jsp:include page="../board_nomal/view.jsp" /> --%>
<%-- 					</c:when> --%>
<%-- 					<c:when test="${menu_gubun == 'board2_sujeong'}"> --%>
<%-- 						<jsp:include page="../board_nomal/sujeong.jsp" /> --%>
<%-- 					</c:when> --%>
<%-- 					<c:when test="${menu_gubun == 'board2_sakje'}"> --%>
<%-- 						<jsp:include page="../board_nomal/sakje.jsp" /> --%>
<%-- 					</c:when> --%>
				
				</c:choose>
			</td>
		</tr>
      <tr>
         <td align="center" style="padding: 20px 20px;" > 
            <jsp:include page="../include/inc_bottom.jsp"></jsp:include>
         </td>
      </tr>
   </table>
</body>
</html>