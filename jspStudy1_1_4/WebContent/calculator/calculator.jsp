<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
.On {
	background-color: white;
}
</style>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body>
	<input type="text" id="aaa" style="width: 233px; height: 50px; text-align:right;">
<!--  	숫자: <span id="aaa"> </span><br> -->
<!--  	부호: <span id="aaaa"></span><br> -->
	<br><span id="aa" style ="display:none;"></span>
	<div id ="result" ></div>
	<table border="1" width="240" height="240" id="cal">
		<tr>
			<td class="button" align="center" id="" onclick="test('7');" width="25%">7</td>
			<td class="button" align="center" id="" onclick="test('8');" width="25%">8</td>
			<td class="button" align="center" id="" onclick="test('9');" width="25%">9</td>
			<td class="button" align="center" id="" onclick="test('+');" width="25%">+</td>			
		</tr>
		<tr>
			<td class="button" align="center" id="" onclick="test('4');">4</td>
			<td class="button" align="center" id="" onclick="test('5');">5</td>
			<td class="button" align="center" id="" onclick="test('6');">6</td>
			<td class="button" align="center" id="" onclick="test('-');">-</td>			
		</tr>
		<tr>
			<td class="button" align="center" id="" onclick="test('1');">1</td>
			<td class="button" align="center" id="" onclick="test('2');">2</td>
			<td class="button" align="center" id="" onclick="test('3');">3</td>
			<td class="button" align="center" id="" onclick="test('*');">*</td>			
		</tr>
		<tr>
			<td class="button" align="center" id="" onclick="test('C');">C</td>
			<td class="button" align="center" id="" onclick="test('0');">0</td>
			<td class="button" align="center" id="" onclick="test('=');">=</td>
			<td class="button" align="center" id="" onclick="test('/');">/</td>			
		</tr>
	</table>
<script>
	function test(value1){
		var a = 0;
		if($("#aa").text() == "="){
			if(value1 == '+' || value1 == '-'||value1 == '*'||value1 == '/'){
				var a =  $("#aaa").val()+value1;
				 $("#aaa").val(a)
				 $("#aa").text("")
			}else if(value1=='C'){
				 $("#aaa").val("")
				 $("#aa").text("")
			}else if(value1=='='){
				var c = eval($("#aaa").val());
				$("#aaa").val(c);
			}else{
				 $("#aaa").val(value1)
				 $("#aa").text("")
			}

		}else if(value1=='+'||value1=='-'||value1=='*'||value1=='/'){
			var b = $("#aaa").val();
			var last = b.charAt(b.length -1);
			if(last =="+" ||last =="-" ||last =="*" ||last =="/" ){
				var slice = b.slice(0,-1);
				$("#aaa").val(slice);
			}
			var c = $("#aaa").val()+value1;
			$("#aaa").val(c);
		}else if(value1=='C' ){	
			 $("#aaa").val("")
		}else if(value1=='='){
			var e = $("#aaa").val();
			var last = e.charAt(e.length -1);
			if(last =="+" ||last =="-" ||last =="*" ||last =="/" ){
				var slice = e.slice(0,-1);
				$("#aaa").val(slice);
			}
			var c = eval($("#aaa").val());
			$("#aaa").val(c);
			$("#aa").text(value1);
		}else{
			a = $("#aaa").val()+value1;
			$("#aaa").val(a);
		}
		
	}
	
	const cal = document.querySelector('#cal');
	
	function showColor(e) {
		  if (e.target.className === 'button') {
			  console.log(e.target);
			  e.target.classList.add('On');
		  }
		}
		function removeColor(e) {
			if (e.target.className === 'button On') {
				  console.log(e.target);
// 				  console.dir(e.target);
// 				  console.log(e.target.innerText);
				  e.target.classList.remove('On');
			  }
		}
		function mouseDownColor(e) {
			if (e.target.className === 'button On') {
				e.target.style.backgroundColor = "#FF69B4";		
			}
		}
		function mouseUpColor(e) {
			e.target.style.backgroundColor = '';
		}
		
		function keyDownColor(e) {
			if (e.target.className === 'button') {
				 console.log(e.target);
				 e.target.classList.add('On');
			}
		}
		function keyUpColor(e) {
			if (e.target.className === 'button On') {
				  console.log(e.target);
				  e.target.classList.remove('On');
			  }
		}
	cal.addEventListener("mouseover", showColor);
	cal.addEventListener("mouseout", removeColor);
	cal.addEventListener("mousedown", mouseDownColor);
	cal.addEventListener("mouseup", mouseUpColor);
	
	cal.addEventListener("keydown", keyDownColor);
	cal.addEventListener("keyup", keyUpColor);
$(document).keydown(function(event) {
	if(event.keyCode == '13') {
		test('=');
	}else if(event.keyCode == '96'){
		test('0');
	}else if(event.keyCode == '97'){
		test('1');
	}else if(event.keyCode == '98'){
		test('2');
	}else if(event.keyCode == '99'){
		test('3');
	}else if(event.keyCode == '100'){
		test('4');
	}else if(event.keyCode == '101'){
		test('5');
	}else if(event.keyCode == '102'){
		test('6');
	}else if(event.keyCode == '103'){
		test('7');
	}else if(event.keyCode == '104'){
		test('8');
	}else if(event.keyCode == '105'){
		test('9');
	}else if(event.keyCode == '110'){
		test('.');
	}else if(event.keyCode == '111'){
		test('/');
	}else if(event.keyCode == '106'){
		test('*');
	}else if(event.keyCode == '107'){
		test('+');
	}else if(event.keyCode == '109'){
		test('-');
	}else if(event.keyCode == '67'){
		test('C');
	}
});
</script>
</body>
</html>