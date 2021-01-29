<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>


<br>
잘못된 접근방식 또는 서버에 문제가 발생하였습니다.
<br><br>
문제가 계속 되면 고객센터에 문의해주시기 바랍니다.

<%
      System.out.println("예외 클래스 : " +  exception.getClass().getName());
      System.out.println("예외 내용 : " + exception.getMessage());
%>




