<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%	
	int cookNo = 0;


	if(Integer.parseInt(session.getAttribute("cookNo").toString()) == 0){
		// 		out.println("로그인안함" +"<hr>");
// 		out.println("<script>");
// 		out.println("alert('로그인 해주세요.');");
// 		out.println("location.href='../member/login.jsp';");
// 		out.println("</script>");
	}else{
		cookNo = Integer.parseInt(session.getAttribute("cookNo").toString());
		
	}
%>

