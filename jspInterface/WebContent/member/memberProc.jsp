<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>

<%@ page import="member.MemberDAO"%>

<jsp:useBean id="dto" class="member.MemberDTO" scope="page"></jsp:useBean>
<jsp:setProperty name="dto" property="*"/>

<% 
	String[] gender_check ={"1","2","3","4"};//성별식별 배열
	String sid = request.getParameter("sid");//주민번호 받기
	int age_ = Integer.parseInt(sid.substring(0,2));//나이계산용 
	int age=0;
	
	String gender_ = sid.substring(6,7);
	
	String gender = "";
	//성별식별
	if(gender_check[0].equals(gender_)||gender_check[2].equals(gender_)){
		gender = "M";
	}else if(gender_check[1].equals(gender_)|| gender_check[3].equals(gender_)){
		gender="F";
	}
	dto.setGender(gender);//성별입력
	
	//나이계산
	if(age_<=20 & (gender_check[2].equals(gender_) ||gender_check[3].equals(gender_)  )){
		age= 21-age_;
	}else{
		 age = 121-age_;
	}
	dto.setAge(age); //나이입력
	
	
	MemberDAO dao = new MemberDAO();
	int result = dao.setInsert(dto);
	
	
	
	
	if (result > 0) {
		out.println("<script>");
		out.println("alert('정상 처리 되었습니다.');");
		out.println("location.href='list.jsp';");
		out.println("</script>");

	} else {
		out.println("<script>");
		out.println("alert('처리중 오류가 발생했습니다.');");
		out.println("location.href='member.jsp';");
		out.println("</script>");
	}
%>