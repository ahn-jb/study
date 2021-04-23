<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/inc_header.jsp" %>    
<div style="display:none;">
menu_gubun : ${menu_gubun}<br>
naljaMap : ${naljaMap}<br>
ip : ${ip}<br>
Proc : <span id="span_proc">${span_proc}</span><br>
pageNumber : <span id="span_pageNumber">${span_pageNumber}</span><br>
pageSize : <span id="span_pageSize">${span_pageSize}</span><br>
no : <span id="span_no">${no}</span><br>
search_option : <span id="span_search_option">${search_option}</span><br>
search_data : <span id="span_search_data">${search_data}</span><br>
</div>
<div id="result" style="border: ; height: 600px; "></div>



<script>
$(document).ready(function(){
	<c:if test="${menu_gubun == 'mall_index'}">
	 	suntaek_proc('mall_list','1','');

	</c:if>
	});
function GoPage(value1,value2){
	var param
	var url = "${path}/mall_servlet/"+value1+".do";
	
	if(value1 == 'mall_list'){
		result.style.height = "900px";
		param ={
				"pageNumber" : $("#span_pageNumber").text(),
				"pageSize" : $("#span_pageSize").text(),
				"search_option" : $("#span_search_option").text(),
				"search_data" : $("#span_search_data").text()
		}
	}else if(value1 =="mall_view"){
		result.style.height = "500px";
		param ={
			"no" : $("#span_no").text()
		}
	}else if(value1== "mall_cart"){
		param={
			"no" : $("#span_no").text(),
			"amount" : $("#purchase_count").val()
		}
	}else if(value1 == "cart_list2"){
		result.style.height = "1100px";
		param={
			"pageNumber" : $("#span_pageNumber").text(),
			"pageSize" : $("#span_pageSize").text(),
		}
	}else if(value1 == "cart_sakje"){
		param={
			"cartDel": $("#span_cartDel").text(),
			"checked": $("#span_checkAll").text(),
			"index"  : $("#span_index").text()
		}
	}else if(value1 == "jumun"){
		param = {
			"no" : $("#span_no").text(),
			"total_price" : $("#total_price").val()
		}
	}
	$.ajax({
		type :"post",
		data : param,
		url  : url,
		success: function(data){
			if(value1 =='chugaProc' ){
				suntaek_proc('mall_list','1','');
			}else if(value1 == 'mall_list'){
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
	}else if(value1 =='mall_list'){
		$("#span_no").text("");	
	}else if(value1 =='mall_list_all'){
		$("#span_search_option").text('')
		$("#span_search_data").text('')	
		suntaek_proc('mall_list','1','');
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