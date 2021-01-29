<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat" %>
<jsp:useBean id="dto" class="member.MemberDTO" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>

<%
	String cookId = "";
	MemberDAO dao = new MemberDAO();
	int result = dao.Login(dto);
	
	if (result > 0) {
		String id = request.getParameter("id");
		MemberDTO dto2 = dao.getSelectOne(id);
		session.setAttribute("cookId", dto2.getId());
		session.setMaxInactiveInterval(60);//초단위
		
		Date nowTime = new Date();
		SimpleDateFormat sf = new SimpleDateFormat("yyyy년 MM월 dd일 a hh:mm:ss");
		Calendar mon = Calendar.getInstance();
		mon.add(Calendar.MONTH , -6);
		double now = nowTime.getTime();
		double changeDate = dto2.getChangeDate().getTime();
		double date = now- mon.getTime().getTime();
		double term = now - changeDate;
// 		System.out.println(now);
// 		System.out.println(changeDate);
// 		System.out.println(term);
// 		System.out.println(date);
		if(	term >= date){
			out.println("<script>");
			out.println("alert('비밀번호를 변경해주세요.');");
			out.println("location.href='./change.jsp';");
			out.println("</script>");
		}
		
		out.println("<script>");
		out.println("alert('로그인 성공.');");
		out.println("location.href='./main.jsp';");
		out.println("</script>");

	}else {
		out.println("<script>");
		out.println("alert('존재하지 않는 아이디이거나 비밀번호가 잘못 되었습니다.');");
		out.println("location.href='./login.jsp';");
		out.println("</script>");
	}
%>
