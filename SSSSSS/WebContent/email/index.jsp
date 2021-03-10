<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/inc_header.jsp" %>
<!DOCTYPE html>

<div id="result" style="borderL 1px solid red; position:relative;" ></div>



<script>
	$(document).ready(function(){
		<c:if test="${menu_gubun == 'email_index'}">
			GoPage('chuga');
		</c:if>
	});
	
	function GoPage(value1){
		var url = "${path}/email_servlet/"+value1+".do";
		
		if(value1 == "chuga"){
			var param = {}
		}else if(value1 =="chugaProc"){
			var param ={
					"fromName" : $("#fromName").val(),
					"fromEmail" : $("#fromEmail").val(),
					"subject" : $("#subject").val(),
					"content" : $("#content").val(),
					"birth_chk" : $("#birth_chk").text()
			}
		}else if(value1 == "memberChugaProc"){
			var param={
				"memberName" : $("#memberName").val(),
				"memberEmail" : $("#memberEmail").val(),
				"memberbirthday" : $("#memberbirthday").val(),
				
			}
		}
		
		$.ajax({
			type: "post",
			data: param,
			url: url,
			success: function(data){
				
				$("#result").html(data);

			}
		});
	}
</script>