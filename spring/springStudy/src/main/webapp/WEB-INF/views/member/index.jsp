<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/inc_header.jsp" %>


<%-- naljaMap : ${naljaMap}<br> --%>
<%-- ip : ${ip}<br> --%>
menu_gubun: <span id="menu_gubun" style="display:;">${menu_gubun}</span><br>
span_proc: <span id="span_proc" style="display:;">${span_proc}</span><br>
<span id="span_pageNumber" style="display:;">${span_pageNumber}</span><br>
<span id="span_pageSize" style="display:;">${span_pageSize}</span><br>
path: <span id ="span_path" style="display:;">${path}</span><br>
<span id="span_no" style="display:;">${no}</span><br>
<span id="span_search_option" style="display:;">${search_option}</span><br>
<span id="span_search_data" style="display:;">${search_data}</span><br>
arg01 : <span id="span_arg01">${arh01}</span><br>
<div id="result" style=" height: 500px; "></div>

<script src='<c:url value="/resources/js/_member.js"/>'></script>