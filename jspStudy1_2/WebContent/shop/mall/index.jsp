<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/inc_header.jsp" %>    

menu_gubun : ${menu_gubun}<br>
naljaMap : ${naljaMap}<br>
ip : ${ip}<br>
Proc : <span id="span_proc">${span_proc}</span><br>
pageNumber : <span id="span_pageNumber">${span_pageNumber}</span><br>
pageSize : <span id="span_pageSize">${span_pageSize}</span><br>
no : <span id="span_no">${no}</span><br>
search_option : <span id="span_search_option">${search_option}</span><br>
search_data : <span id="span_search_data">${search_data}</span><br>

<div id="result" style="border: 1px solid red; height: 600px; "></div>



<script>
$(document).ready(function(){
	<c:if test="${menu_gubun == 'mall_index'}">
	 	GoPage('list','');

	</c:if>
	});
function GoPage(value1,value2){
	var parm = {};
	var process_data;
	var content_type;
	var url = "${path}/mall_servlet/"+value1+".do";
	
	if(value1 == 'list'){
		result.style.height = "750px";
		param ={
				"pageNumber" : $("#span_pageNumber").text(),
				"pageSize" : $("#span_pageSize").text(),
				"search_option" : $("#span_search_option").text(),
				"search_data" : $("#span_search_data").text()
		}
	}
	$.ajax({
		type :"post",
		data : param,
		processData: process_data,
		contentType: content_type,
		url  : url,
		success: function(data){
			if(value1 =='chugaProc' ){
				suntaek_proc('list','1','');
			}else if(value1 == 'sujungProc'){
				$("#result").html(data);
			}else{
				$("#result").html(data);
			}
		}
	});
}
</script>