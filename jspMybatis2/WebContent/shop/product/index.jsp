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

<div id="result" style="border: 1px solid red; height: 500px; "></div>

<script>
$(document).ready(function(){
<c:if test="${menu_gubun == 'product_index'}">
	suntaek_proc('list','1','');

</c:if>
});
function GoPage(value1,value2){
	var parm = {};
	var process_data;
	var content_type;
	var url = "${path}/product_servlet/"+value1+".do";
	
	if(value1 == 'list'){
		param ={
				"pageNumber" : $("#span_pageNumber").text(),
				"pageSize" : $("#span_pageSize").text(),
				"search_option" : $("#span_search_option").text(),
				"search_data" : $("#span_search_data").text()
		}
	}else if(value1 =='chuga'){
		result.style.height = "400px";
		 param = {}
	}else if(value1 == "chugaProc" || value1== "sujungProc" ){
		process_data = false;
		content_type = false;
		
		param = new FormData();
		if(value1 == "sujungProc"){			
			param.append("no", $("#span_no").text());
		}
		param.append("name",$("#name").val());
		param.append("price",$("#price").val());
		param.append("description",$("#description").val());
/*		
		console.log($('input[name="file"]')[0].files[0]);
		console.log($('input[name="file"]')[1].files[0]);
		console.log($('input[name="file"]')[2].files[0]);
		return;
*/		
		var file_counter =parseInt($('input[name="file"]').length);
		for(i=0; i<file_counter; i++){
			param.append(i,$('input[name="file"]')[i].files[0]);
		}
	}else if(value1 =="view" || value1 == "sujung" ){
		result.style.height = "600px";
		param = {
			"no" : $("#span_no").text()
		}
	}else if(value1 == "sakje"){
		
	}
		$.ajax({
			type : "post",
			data : param,
			processData: process_data,
			contentType: content_type,
			url  : url,
			success: function(data){
				if(value1 =='chugaProc' ){
					suntaek_proc('list','1','');
				}else if(value1 == 'sujungProc'){
// 					GoPage('view',$("#span_no").text());
					$("#result").html(data);
				}else{
					$("#result").html(data);
				}
			}
		});
}

function suntaek_proc(value1,value2,value3){
	if(value1 == 'chuga'){
		$("#span_no").text("");	
	}else if(value1 =='sakje'){
		if(confirm('정말 삭제하시겠습니까?')){			
		}else{
			suntaek_proc('view','',value3);
		}
	}else if(value1 =='list'){
		$("#span_no").text("");	
	}else if(value1 == 'resetList'){
		$("#span_search_option").text("");
		$("#span_search_data").text("");
		suntaek_proc('list','1','');
	}
	
	if(value1 != ''){
		$("#span_proc").text(value1);
	}
	if(value2 != ''){
		$("#span_pageNumber").text(value2);		
	}
	if(value3 != ''){
		$("#span_no").text(value3);	
	}
	
	GoPage(value1,'');
}

</script>