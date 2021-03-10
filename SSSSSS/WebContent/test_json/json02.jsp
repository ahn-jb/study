<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>  
<%@page import="org.json.simple.JSONObject" %>
<%@page import="java.io.PrintWriter" %>  
<%
	String name = request.getParameter("name");
	String kor_ = request.getParameter("kor");
	String eng_ = request.getParameter("eng");
	String mat_ = request.getParameter("mat");
	String sci_ = request.getParameter("sci");
	String his_ = request.getParameter("his");
	int kor=0;
	if(! kor_.equals("")){
		kor = Integer.parseInt(kor_);		
	}
	int eng =0;
	if(! eng_.equals("")){
		eng = Integer.parseInt(eng_);		
	}
	int mat =0;
	if(! mat_.equals("")){
		mat = Integer.parseInt(mat_);		
	}
	int sci =0;
	if(! sci_.equals("")){
		sci = Integer.parseInt(sci_);		
	}
	int his =0;
	if(! his_.equals("")){
		his = Integer.parseInt(his_);		
	}
	
	int total = kor+eng+mat+sci+his;
	Double avg = total/5.0;
	
	JSONObject jsonobj = new JSONObject();
	jsonobj.put("name", name);
	jsonobj.put("kor", kor);
	jsonobj.put("eng", eng);
	jsonobj.put("mat", mat);
	jsonobj.put("sci", sci);
	jsonobj.put("his", his);
	jsonobj.put("tot", total);
	jsonobj.put("avg", avg);
	String json_sj = jsonobj.toJSONString();
	out.println(json_sj);
	
	
// 	PrintWriter pw = response.getWriter();
// 	pw.print("p:"+json_sj);
// 	out.println("이름: "+name);
// 	out.println("국어: "+kor);
// 	out.println("영어: "+eng);
// 	out.println("수학: "+mat);
// 	out.println("과학: "+sci);
// 	out.println("역사: "+his);
// 	out.println("총점: "+total);
// 	out.println("평균: "+avg);
%>		



	