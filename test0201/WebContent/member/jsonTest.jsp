<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>  
<%@page import="org.json.simple.JSONObject" %>
<%@page import="java.io.PrintWriter" %>  
<%	
	String no_ = request.getParameter("no");
	int no = Integer.parseInt(no_);
	MemberDAO dao = new MemberDAO();
	MemberDTO dto = dao.getSelectOneNo(no);
	
	String date = dto.getRegidate().toString();

    JSONObject jsonobj = new JSONObject();
    jsonobj.put("grade", dto.getGrade());
    jsonobj.put("id", dto.getId());
	jsonobj.put("pw", dto.getPw());
	jsonobj.put("name", dto.getName());
	jsonobj.put("gender", dto.getGender());
	jsonobj.put("bornYear", dto.getBornYear());
	jsonobj.put("postNum", dto.getPostNum());
	jsonobj.put("street_addr", dto.getStreet_addr());
	jsonobj.put("parcel_addr", dto.getParcel_addr());
	jsonobj.put("detail_addr", dto.getDetail_addr());
	jsonobj.put("regidate", date);
	String json_sj = jsonobj.toJSONString();
	out.println(json_sj);
	
%>