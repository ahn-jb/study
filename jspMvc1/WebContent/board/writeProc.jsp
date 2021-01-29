<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>

<%@ page import="board.BoardDAO"%>
<%@ page import="board.BoardDTO"%>

<jsp:useBean id="dto" class="board.BoardDTO" scope="page"></jsp:useBean>
<jsp:setProperty name="dto" property="*" />

<%
	BoardDAO dao = new BoardDAO();

	int no = Integer.parseInt(request.getParameter("no"));
	int num;
	int refNo;
	int stepNo;
	int levelNo;
	int hit;
	if(no>0){//답변글
		num=dao.getMaxNum()+1;
		BoardDTO dto2 = dao.getSelectOne(no);
		dao.setUpdateReLevel(dto2);
		refNo = dto2.getRefNo();
		stepNo = dto2.getStepNo() +1;
		levelNo= dto2.getLevelNo() +1;
		hit=0;
	}else{//새글
		num=dao.getMaxNum()+1;
		refNo=dao.getMaxRefNo()+1;
		stepNo = 1;
		levelNo = 1;
	 	hit = 0;
	}
%>

<jsp:setProperty name="dto" property="num" value="<%=num%>" />
<jsp:setProperty name="dto" property="refNo" value="<%=refNo%>" />
<jsp:setProperty name="dto" property="stepNo" value="<%=stepNo%>" />
<jsp:setProperty name="dto" property="levelNo" value="<%=levelNo%>" />
<jsp:setProperty name="dto" property="hit" value="<%=hit%>" />


<%
	int result = dao.setInsert(dto);

	if (result > 0) {
		out.println("<script>");
		out.println("alert('정상 처리 되었습니다.');");
		out.println("location.href='list.jsp';");
		out.println("</script>");

	} else {
		out.println("<script>");
		out.println("alert('처리중 오류가 발생했습니다.');");
		out.println("location.href='write.jsp';");
		out.println("</script>");
	}
%>