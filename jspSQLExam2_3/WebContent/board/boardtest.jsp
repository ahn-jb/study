<%@page import="java.net.Inet4Address"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.board.BoardDTO" %>   
<%@ page import="model.board.BoardDAO" %>   
<%-- <%@ include file="../include/include_check/include_check.jsp" %> --%>
<%-- <%@ include file="../include/include_check/include_session.jsp" %> --%>

<jsp:useBean id="dto" class="model.board.BoardDTO" scope="page"></jsp:useBean>
<jsp:setProperty name="dto" property="*" />

<%
// 	dto = new BoardDTO();	
	BoardDAO dao = new BoardDAO();
	
// 	int no = Integer.parseInt(request.getParameter("no"));
// 	int num;
// 	int refNo;
// 	int stepNo;
// 	int levelNo;
// 	int hit;
// 	if( no>0 ){//답변글
// 		num=dao.getMaxNum()+1;
// 		BoardDTO dto2 = dao.getSelectOne(no);
// 		dao.setUpdateReLevel(dto2);
// 		refNo = dto2.getRefNo();
// 		stepNo = dto2.getStepNo() +1;
// 		levelNo= dto2.getLevelNo() +1;
// 		hit=0;
// 	}else{//새글
// 		num=dao.getMaxNum()+1;
// 		refNo=dao.getMaxRefNo()+1;
// 		stepNo = 1;
// 		levelNo = 1;
// 	 	hit = 0;
// 	}

	String no_ = request.getParameter("no");
 	int no;
 	String subject = "";
 	String content = "";
 	if(no_==null||no_.length()== 0){
 		no=0;
 	}else{
 		no = Integer.parseInt(no_);
 	}
 	if(no > 999){
 		out.println("종료");
 		return;
 	}
 	
 	int num =no +1;
 	int refNo = no+1;
 	int stepNo = 1;
 	int levelNo = 1;
 	int hit = 0;
// 	dto.setNum(num);
// 	dto.setRefNo(num);
// 	dto.setStepNo(1);
// 	dto.setLevelNo(1);
// 	dto.setHit(0);
 	
	dto.setService(1);
 	dto.setNum(no);
 	dto.setWriter(""+no);
 	dto.setSubject(""+no);
 	dto.setContent(""+no);
 	dto.setEmail(""+no);
 	dto.setPasswd(""+no);
 	
 	
 	System.out.println(no);

%>



<jsp:setProperty name="dto" property="num" value="<%=num%>" />
<jsp:setProperty name="dto" property="refNo" value="<%=refNo%>" />
<jsp:setProperty name="dto" property="stepNo" value="<%=stepNo%>" />
<jsp:setProperty name="dto" property="levelNo" value="<%=levelNo%>" />
<jsp:setProperty name="dto" property="hit" value="<%=hit%>" />


<%
	int result = dao.setInsert(dto);

// 	if (result > 0) {
// 		out.println("<script>");
// 		out.println("alert('정상 처리 되었습니다.');");
// 		out.println("location.href='list.jsp';");
// 		out.println("</script>");

// 	} else {
// 		out.println("<script>");
// 		out.println("alert('처리중 오류가 발생했습니다.');");
// 		out.println("location.href='write.jsp';");
// 		out.println("</script>");
// 	}
%>
<script>
	setTimeout(function(){
		location.href ='boardtest.jsp?no=<%=num%>';
	},100); //1000 - 1초
</script>