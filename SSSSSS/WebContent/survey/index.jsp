<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/inc_header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 	<div style="display:none;"> -->
	<input type="text" name="a" style ="display: ;"><br>
	list_gubun : <span id="span_list_gubun">${list_gubun}</span><br>
	pageNumber : <span id="span_pageNumber">${pageNumber}</span><br>
	no : <span id="span_no">${no}</span><br>
	search_option : <span id="span_search_option">${search_option}</span><br>
	search_data : <span id="span_search_data">${search_data}</span><br>
	search_date_check : <span id="span_search_date_check">${search_date_check}</span><br>
	search_date_s : <span id ="span_search_date_s">${search_date_s}</span><br>
	search_date_e : <span id="span_search_date_e">${search_date_e}</span><br>
<!-- 	</div> -->
	<div id ="result" ></div><br><br>
	
	<c:if test="${menu_gubun == 'survey_index'}">
		<script>
			$(document).ready(function(){
				list();
			});
		</script>
	</c:if>
<script type="text/javascript">
 function chuga(){
	 var param = {}
	 $.ajax({
		 type:"post",
		 data:"param",
		 url:"${path}/survey_servlet/chuga.do",
		 success: function(data){
			 $("#result").html(data);
		 }
	 });
 }
 function chugaProc(){
	 if(confirm('등록하시겠습니까?')){
		 $.ajax({
			 type: "post",
			 data: $('form').serialize(),
			 url: "${path}/survey_servlet/chugaProc.do",
			 success: function(){
				 suntaek_page("1");
				 list();
			 }
		 });
	 }
 }
 function suntaek_page(value1){
	 $("#span_pageNumber").text(value1);
	 list();
 }
 function list(){
	 var param = {
		"list_gubun" : $("#span_list_gubun").text(),
		"pageNumber" : $("#span_pageNumber").text(),
		"search_option" : $("#span_search_option").text(),
		"search_data" : $("#span_search_data").text(),
		"search_date_s" : $("#span_search_date_s").text(),
		"search_date_e" : $("#span_search_date_e").text(),
		"search_date_check" : $("#span_search_date_check").text()
	 }
	 $.ajax({
		 type:"post",
		 data:param,
		 url: "${path}/survey_servlet/list.do",
		 success: function(result){
			 $("#result").html(result);
			 if($("#span_search_date_check").text()=="O"){
				 $("input[id=search_date_check]:checkbox").prop("checked",true);
			 }else{
				 $("input[id=search_date_check]:checkbox").prop("checked",false);
			 }
				 
		 }
	 });
 }
 function suntaek_list(value1){
		$("#span_list_gubun").text(value1);
		$("#span_pageNumber").text(1);
		list();
	}
</script>
</body>
</html>