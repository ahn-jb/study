<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>

<%@ page import="sj.SjDAO"%>


<jsp:useBean id="dto" class="sj.SjDTO" scope="page"></jsp:useBean>
<jsp:setProperty name="dto" property="*" />

<%
	
	String[] jungdab ={"1","2","3","4","3"};
	int jumsu=0;
	
	String mun_ox_1 ="";
	String mun_ox_2 ="";
	String mun_ox_3 =""; 
	String mun_ox_4 =""; 
	String mun_ox_5 =""; 
	
	if(dto.getMun_1()==Integer.parseInt(jungdab[0])){
		jumsu += 20;
		mun_ox_1="O";
	}else{mun_ox_1="X";}
	
	if(dto.getMun_2()==Integer.parseInt(jungdab[1])){
		jumsu += 20;
		mun_ox_2="O";
	}else{mun_ox_2="X";}
		
	if(dto.getMun_3()==Integer.parseInt(jungdab[2])){
		jumsu += 20;
		mun_ox_3="O";
	}else{mun_ox_3="X";}
		
	if(dto.getMun_4()==Integer.parseInt(jungdab[3])){
		jumsu += 20;
		mun_ox_4="O";
	}else {mun_ox_4="X";}
		
	if(dto.getMun_5()==Integer.parseInt(jungdab[4])){
		jumsu += 20;
		mun_ox_5="O";
	}else{mun_ox_5="X";}
		
	dto.setJumsu(jumsu);
	dto.setMun_ox_1(mun_ox_1);
	dto.setMun_ox_2(mun_ox_2);
	dto.setMun_ox_3(mun_ox_3);
	dto.setMun_ox_4(mun_ox_4);
	dto.setMun_ox_5(mun_ox_5);
	
	SjDAO dao = new SjDAO();
	int result = dao.setInsert(dto);
	

	if(result > 0){
		out.println("<script>");
		out.println("alert('정상 처리 되었습니다.');");
		out.println("location.href='sjlist.jsp';");
		out.println("</script>");

	}else{
		out.println("<script>");
		out.println("alert('처리중 오류가 발생했습니다.');");
		out.println("location.href='sj.jsp';");
		out.println("</script>");
	}
%>