<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/inc_header.jsp" %>


<%-- naljaMap : ${naljaMap}<br> --%>
<%-- ip : ${ip}<br> --%>
<span id="menu_gubun" style="display:">${menu_gubun}</span><br>
<span id="span_proc" style="display:none;">${span_proc}</span><br>
<span id="span_pageNumber" style="display:none;">${span_pageNumber}</span><br>
<span id="span_pageSize" style="display:none;">${span_pageSize}</span><br>
<span id ="span_path" style="display:none;">${path}</span><br>
<span id="span_no" style="display:none;">${no}</span><br>
<span id="span_search_option" style="display:none;">${search_option}</span><br>
<span id="span_search_data" style="display:none;">${search_data}</span><br>
path : <span id="span_path">${path }</span><br>
arg01 : <span id="span_arg01">${arh01}</span><br>
<div id="result" style=" height: 500px; "></div>

<script src='<c:url value="/resources/js/_member.js"/>'></script>