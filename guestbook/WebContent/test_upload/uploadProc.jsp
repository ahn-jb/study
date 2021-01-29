<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import ="java.util.*" %>
 <%@page import ="java.io.*" %>
 <%@page import="com.oreilly.servlet.*"%>
 <%@page import="com.oreilly.servlet.multipart.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String upload_path = "C:/upload";
		int size = 10 * 1024 * 1024; //10MB
		
		String name = "";
		String subject = "";
		String filename = "";
		String filename2 = "";
		int filesize = 0;
		int filesize2 = 0;
		
		try{
			MultipartRequest multi = new
			MultipartRequest(request,upload_path,size,"utf-8",new DefaultFileRenamePolicy());
			name = multi.getParameter("name");
			subject = multi.getParameter("subject");
			
			Enumeration files = multi.getFileNames();
			String file1 = (String)files.nextElement();
			String file2 = (String)files.nextElement();
			
			filename = multi.getFilesystemName(file1);
			File f1 = multi.getFile(file1);
			filesize = (int)f1.length();
			filename2= multi.getFilesystemName(file2);
			File f2 = multi.getFile(file2);
			filesize2 = (int)f2.length();
		}catch(Exception e){
			e.printStackTrace();
		}
	%>
	이름 : <%=name %><br>
	제목 : <%=subject %><br>
	파일1 이름 : <%=filename %><br>
	파일1 크기 : <%=filesize %><br>
	파일2 이름 : <%=filename2 %><br>
	파일2 크기 : <%=filesize2 %><br>
</body>
</html>