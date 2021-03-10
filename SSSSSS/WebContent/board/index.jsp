<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/inc_header.jsp" %> 

menu_gubun : ${menu_gubun}<br>
naljaMap : ${naljaMap}<br>
ip : ${ip}<br>
tbl : <span id="span_tbl">${tbl}</span><br>
pageNumber : <span id="span_pageNumber">${span_pageNumber}</span><br>
pageSize : <span id="span_pageSize">${span_pageSize}</span><br>
no : <span id="span_no">${no}</span><br>
search_option : <span id="span_search_option">${search_option}</span><br>
search_data : <span id="span_search_data">${search_data}</span><br>

<div id="result" style="border: 1px solid red; height: 500px; "></div>
<script>
$(document).ready(function(){
<c:if test="${menu_gubun == 'board_index'}">
	GoPage('list','');
// 	GoPage('write','');
</c:if>
});


function GoPage(value1,value2){
	var url = "${path}/board_servlet/"+value1+".do";
	
	if(value1 == "write"){
		$("#span_no").text("");
		var param = {}
	}else if(value1 == "writeProc" || value1 == "sujeongProc" || value1 == "sakjeProc"){
		var param = {
				"tbl" : $("#span_tbl").text(),
				"no" : $("#span_no").text(),
				"writer" : $("#writer").val(),
				"email" : $("#email").val(),
				"passwd": $("#passwd").val(),
				"subject": $("#subject").val(),
				"content": $("#content").val(),
				"noticeGubun": $("#noticeGubun").val(),
				"secretGubun": $("#secretGubun").val()
			}	
	}else if(value1 =="list"){
		var param = {
			"tbl" : $("#span_tbl").text(),
			"pageNumber" : $("#span_pageNumber").text(),
			"pageSize" : $("#span_pageSize").text(),
			"search_option" : $("#span_search_option").text(),
			"search_data" : $("#span_search_data").text()
			
		}
	}else if(value1 == "view"){
			result.style.height = "800px";
		$("#span_no").text(value2);
		var param ={
			"no" : $("#span_no").text(),
			"tbl" : $("#span_tbl").text(),
			"pageNumber" : $("#span_pageNumber").text(),
			"search_option" : $("#span_search_option").text(),
			"search_data" : $("#span_search_data").text(),
			"view_passwd" : $("#view_passwd").val()
		}
	}else if(value1 == "reply" || value1 == "sujeong" || value1 == "sakje"){
		var param ={
				"no" : $("#span_no").text(),
				"tbl" : $("#span_tbl").text(),
				"pageNumber" : $("#span_pageNumber").text(),
				"search_option" : $("#span_search_option").text(),
				"search_data" : $("#span_search_data").text(),
				"writer" : $("#writer").val(),
				"email" : $("#email").val(),
				"passwd": $("#passwd").val(),
				"subject": $("#subject").val(),
				"content": $("#content").val(),
				"noticeGubun": $("#noticeGubun").val(),
				"secretGubun": $("#secretGubun").val()
		}
	}
		$.ajax({
			type : "post",
			data : param,
			url  : url,
			success: function(data){
				if(value1 =='writeProc' || value1 =='sakjeProc'){
					suntaek_page('1');
				}else if(value1 == 'sujeongProc'){
// 					GoPage('view',$("#span_no").text());
					$("#result").html(data);
				}else{
					$("#result").html(data);
				}
			}
		});
}

function suntaek_page(value1){
	$("#span_pageNumber").text(value1);
	$("#span_no").text("");
	GoPage('list','');
}

</script>