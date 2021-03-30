<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/inc_header.jsp" %>


menu_gubun : ${menu_gubun}<br>
naljaMap : ${naljaMap}<br>
Proc : <span id="span_proc">${span_proc}</span><br>
pageNumber : <span id="span_pageNumber">${pageNumber}</span><br>
no : <span id="span_no">${no}</span><br>
search_option : <span id="span_search_option">${search_option}</span><br>
search_data : <span id="span_search_data">${search_data}</span><br>
<div id="result" style="border: 1px solid red; height: 500px; "></div>

<script>
$(document).ready(function(){
// 	alert("ready");
	suntaek_proc('list','1','');

});


function GoPage(value1){
	var param = {};
	var url = "${path}/munje_servlet/" + value1 + ".do";
	
	if(value1 == 'sihum_chugaProc' || value1 == 'munje_sujeongProc' || value1 == 'munje_chugaProc' || value1 == 'sihum_sujeongProc'){
		param={
				"no" : $("#span_no").text(),
				"testName" : $('#testName').val(),
				"testNo" : $('#testNo').val(),
				"testType" : $('#testType').val(),
				"question" : $('#question').val(),
				"testNumber" : $('#testNumber').val(),
				"ans1" : $('#ans1').val(),
				"ans2" : $('#ans2').val(),
				"ans3" : $('#ans3').val(),
				"ans4" : $('#ans4').val(),
				"syear" : $('#syear').val(),
				"smonth" : $('#smonth').val(),
				"sday" : $('#sday').val(),
				"lyear" : $('#lyear').val(),
				"lmonth" : $('#lmonth').val(),
				"lday" : $('#lday').val(),
				"status" : $('#status').val()
		}
	}else if(value1 == 'list'){
		param = {
			"pageNumber" : $("#span_pageNumber").text(),
			"search_option" : $("#span_search_option").text(),
			"search_data" : $("#span_search_data").text()
		}
	}else if(value1 == 'sihum_sujeong' || value1 =='sihum_sakje' || value1 == 'sihum_view' 
			|| value1 == 'munje_view' || value1 == 'munje_sujeong' || value1 =='munje_sakje' || value1 == 'munje_chuga' || value1 == 'answer_chuga'){	
		param={
				"testNo" : $('#testNo').val(),
				"testName" : $('#testName').val(),
				"testType" : $('#testType').val(),
				"no" : $("#span_no").text()
		}
	}else if(value1 =='jeongdabProc' || value1 == 'jd_sujeongProc' ||  value1 =="test_result"){
		param = {
				"no" : $("#span_no").text(),
				"proc_check" : $('#proc_check').text(),
				"answer_total" : $("#span_answer_total").text()
		}
	}else if(value1 == 'test' || value1 == 'jeongdab' || value1 == 'jd_sujeong' || value1 == 'jd_sakje'){
		param={
				"proc_check" : $('#proc_check').text(),
				"testNo" : $('#testNo').val(),
				"testName" : $('#testName').val(),
				"testType" : $('#testType').val(),
				"no" : $("#span_no").text()
		}
	}
	
	$.ajax({
		type : "post",
		data : param,
		url  : url,
		success: function(data){
			if(value1 == "list"){
				$("#result").html(data);
			}else if(value1 == 'modifyProc' || value1 =='sendProc' || value1 =='sakje'){
				suntaek_proc('list','1','');
			}else if(value1 =="test_result"){
				$("#result").html(data);
			}else{
				$("#result").html(data);
			}
		}
	});
	
}
 
function suntaek_proc(value1,value2,value3){
// 		alert(value1 +": "+ value3);
	$("#span_no").text("");
	
	if(value1 == "resetList"){
		$("#span_search_option").text("");
		$("#span_search_data").text("");
		suntaek_proc('list','1','');
	}

	$("#span_proc").text(value1);
	if(value2 != "0"){
		$("#span_pageNumber").text(value2);
	}
	if(value3 != "0"){
		$("#span_no").text(value3);
	}
	GoPage(value1);
}
</script>