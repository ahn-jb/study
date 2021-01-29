<%@page import="resume.ResumeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
 <%@page import ="java.util.*" %>
 <%@page import ="java.io.*" %>
 <%@page import="com.oreilly.servlet.*"%>
 <%@page import="com.oreilly.servlet.multipart.*"%>
<%request.setCharacterEncoding("UTF-8");%>
<%@ page import="resume.ResumeImpl" %>


<%
	ResumeDTO dto = new ResumeDTO();

	String upload_path = application.getRealPath("/upload/img/");
	int size = 10 * 1024 * 1024; //10MB
	
	String name = "";
	String filename = "";
	String email ="";
	String phone = "";
	String adress = "";
// 	int toeic= 0;            
// 	int toefl= 0;            
// 	String japan = "";         
// 	String china = "";                         
// 	String gigan1 = "";       
// 	String school1 = "";      
// 	String jeongong1 = "";                         
// 	String gigan2 = "";       
// 	String school2 = "";      
// 	String jeongong2 = "";                       
// 	String gigan3 = "";       
// 	String school3 = "";      
// 	String jeongong3= "";                           
// 	String gigan4 = "";       
// 	String school4 = "";      
// 	String jeongong4 = "";    
	int filesize = 0;
	
	try{
		MultipartRequest multi = new
		MultipartRequest(request,upload_path,size,"utf-8",new DefaultFileRenamePolicy());
		
		name = multi.getParameter("name");
		email = multi.getParameter("email");
		phone = multi.getParameter("phone");
		adress = multi.getParameter("adress");
// 		toeic = Integer.parseInt(multi.getParameter("toeic"));            
// 		toefl = Integer.parseInt(multi.getParameter("toefl"));          
// 		japan = multi.getParameter("japan");   
// 		china = multi.getParameter("china");                  
// 		gigan1 = multi.getParameter("gigan1");       
// 		school1 = multi.getParameter("school1");      
// 		jeongong1 = multi.getParameter(" jeongong1");                  
// 		gigan2 = multi.getParameter("gigan2");       
// 		school2 =multi.getParameter("school2");      
// 		jeongong2=multi.getParameter("jeongong2");         
// 		gigan3 	=multi.getParameter("gigan3");	  
// 		school3 =multi.getParameter("school3");    
// 		jeongong3=multi.getParameter("jeongong3");         
// 		gigan4 	=multi.getParameter("gigan4");	  
// 		school4 =multi.getParameter("school4");
// 		jeongong4=multi.getParameter("jengong4");
		
		Enumeration files = multi.getFileNames();
		
		while(files.hasMoreElements()){
			String file1 = (String)files.nextElement();
			filename = multi.getFilesystemName(file1);
			File f1 = multi.getFile(file1);
			filesize = (int)f1.length();
		}
		
	}catch(Exception e){
		e.printStackTrace();
	}
	dto.setPic(filename);
	dto.setName(name);
	dto.setEmail(email);
	dto.setPhone(phone);
	dto.setAdress(adress);
// 	dto.setToefl(toefl);
// 	dto.setToeic(toeic);
// 	dto.setJapan(japan);
// 	dto.setChina(china);
// 	dto.setGigan1(gigan1);
// 	dto.setSchool1(school1);
// 	dto.setJeongong1(jeongong1);
// 	dto.setGigan2(gigan2);
// 	dto.setSchool2(school2);
// 	dto.setJeongong2(jeongong2);
// 	dto.setGigan3(gigan3);
// 	dto.setSchool3(school3);
// 	dto.setJeongong3(jeongong3);
// 	dto.setGigan4(gigan4);
// 	dto.setSchool4(school4);
// 	dto.setJeongong4(jeongong4);
	
	ResumeImpl dao = new ResumeImpl();
	int result = dao.setInsert(dto);
	
	if (result > 0) {
		out.println("<script>");
		out.println("alert('입력 성공.');");
		out.println("location.href='list.jsp';");
		out.println("</script>");

	} else {
		out.println("<script>");
		out.println("alert('오류 발생.');");
		out.println("location.href='write.jsp';");
		out.println("</script>");
	}
%>