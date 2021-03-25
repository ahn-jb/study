var path=$("#span_path").text();

$(document).ready(function(){
	var menu_gubun = $('#menu_gubun').text();
	if(menu_gubun == 'member_chuga2'){
		sunteak_proc('chuga','','');
	}else if(menu_gubun == 'member_login2'){
		sunteak_proc('login','','');
	}else{	
		sunteak_proc('list','1','');
	}
});


function sunteak_proc(value1,value2,value3){
//	alert("qqqqq");
	$("#span_proc").text(value1);
	if(value1 == 'list'){
		$("#span_search_option").text($("#search_option").val());
		$("#span_search_data").text($("#search_data").val());
	}else if(value1 == 'resetList'){
		$("#span_pageNumber").text("1");
		$("#span_search_option").text("");
		$("#span_search_data").text("");
		GoPage('list');
		return;
	}
	
	if(value2 != "0"){
		$("#span_pageNumber").text(value2);
	}
	if(value3 != "0"){
		$("#span_no").text(value3);
	}
	GoPage(value1);
}

function GoPage(value1){
//	alert('wwww');
	var param = {};
	var url = "${path}/member_servlet/" + value1 + ".do";
//	var url = path+"/member_servlet/" + value1 + ".do";
	
	if(value1 == "list"){
		param={
			"pageNumber" : $("#span_pageNumber").text(),
			"search_option" : $("#span_search_option").text(),
			"search_data" : $("#span_search_data").text()
			}
		}else if(value1 =="view" ){
			param={
				"no" : $("#span_no").text(),
				"search_option" : $("#span_search_option").text(),
				"search_data" : $("#span_search_data").text()
			}
		}else if(value1 == 'modify' || value1 == 'delete' || value1 =='deleteProc'){
			param={
				"no" : $("#span_no").text()
			}
		}else if(value1 == 'chugaProc' || value1 == 'modifyProc'){
//			alert("asd");
			param = {
				"no" : $("#span_no").text(),
				"id" : $("#id").val(),
				"pw" : $("#pw").val(),
				"pwcheck" : $("#pwcheck").val(),
				"name" : $("#name").val(),
				"grade" : $("#grade").val(),
				"gender" : $("#gender").val(),
				"bornYear" : $("#bornYear").val(),
				"postNum" : $("#sample4_postcode").val(),
				"street_addr" : $("#sample4_roadAddress").val(),
				"parcel_addr" : $("#sample4_jibunAddress").val(),
				"detail_addr" : $("#sample4_detailAddress").val(),
				"reference" : $("#sample4_extraAddress").val(),
			}
		}else if(value1 == 'chuga' ){
			
		}
		
	$.ajax({
		type : "post",
		data : param,
		url  : url,
		success: function(data){
			if(value1 == "list"){
				$("#result").html(data);
			}else if(value1 == 'modifyProc'){
//				alert('aaaaaaa');
				sunteak_proc('list','1','');
//				$("#result").html(data);
			}else{
				$("#result").html(data);
			}
		}
	});
				
	
}