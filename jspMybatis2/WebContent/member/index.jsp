<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/inc_header.jsp" %>
menu_gubun : <span id="menu_gubun">${menu_gubun}</span><br>
naljaMap : ${naljaMap}<br>
ip : ${ip}<br>
Proc : <span id="span_proc">${span_proc}</span><br>
pageNumber : <span id="span_pageNumber">${span_pageNumber}</span><br>
pageSize : <span id="span_pageSize">${span_pageSize}</span><br>
path : <span id ="span_path">${path}</span><br>
no : <span id="span_no">${no}</span><br>
search_option : <span id="span_search_option">${search_option}</span><br>
search_data : <span id="span_search_data">${search_data}</span><br>
<input type="text" name="a" style="display:;"><br>

<div id="result" style="border: 1px solid red; height: 500px; "></div>


<script type="text/javascript" src="${path}/member/_member.js">

</script>
