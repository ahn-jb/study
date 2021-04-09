<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page errorPage="../main/exception.jsp" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="path" value ="${pageContext.request.contextPath}" />

<c:set var="url" value="${pageContext.request.requestURL}" />

<c:set var="uri" value="${pageContext.request.requestURI}" />

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="//unpkg.com/bootstrap@4/dist/css/bootstrap.min.css">
<script src='//unpkg.com/jquery@3/dist/jquery.min.js'></script>
<script src='//unpkg.com/popper.js@1/dist/umd/popper.min.js'></script>
<script src='//unpkg.com/bootstrap@4/dist/js/bootstrap.min.js'></script>

<%
// 	response.setHeader("Cache-Control", "no-store");
// 	response.setHeader("Pragma", "no-cache");
// 	response.setDateHeader("Expires",0);
%>
<!-- <script src="http://code.jquery.com/jquery-3.3.1.min.js"></script> -->

<!-- <link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />   -->
<!-- <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>   -->
<!-- <script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script> -->


