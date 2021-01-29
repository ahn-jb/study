<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="test_loop.transactionTBLDAO" %>

<%
	transactionTBLDAO dao = new transactionTBLDAO();
	dao.insert();
// 	dao.insert2();
	
	
%>