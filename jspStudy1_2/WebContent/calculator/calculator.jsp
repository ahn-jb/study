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
.pressed{
	background-color: #FF69B4;
}
</style>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body>
	<input type="text" id="aaa" style="width: 233px; height: 50px; text-align:right;" placeholder="' . '을 두번씩 쓰면 오류발생." readonly>
<!--  	숫자: <span id="aaa"> </span><br> -->
<!--  	부호: <span id="aaaa"></span><br> -->
	<br><span id="aa" style ="display:none;"></span>
	<div id ="result" ></div>
	<table border="1" width="240" height="240" id="cal">
		<tr>
			<td class="button" align="center" id="7" onclick="test('7');" width="25%">7</td>
			<td class="button" align="center" id="8" onclick="test('8');" width="25%">8</td>
			<td class="button" align="center" id="9" onclick="test('9');" width="25%">9</td>
			<td class="button" align="center" id="+" onclick="test('+');" width="25%">+</td>			
		</tr>
		<tr>
			<td class="button" align="center" id="4" onclick="test('4');">4</td>
			<td class="button" align="center" id="5" onclick="test('5');">5</td>
			<td class="button" align="center" id="6" onclick="test('6');">6</td>
			<td class="button" align="center" id="-" onclick="test('-');">-</td>			
		</tr>
		<tr>
			<td class="button" align="center" id="1" onclick="test('1');">1</td>
			<td class="button" align="center" id="2" onclick="test('2');">2</td>
			<td class="button" align="center" id="3" onclick="test('3');">3</td>
			<td class="button" align="center" id="*" onclick="test('*');">*</td>			
		</tr>
		<tr>
			<td class="button" align="center" id="c" onclick="test('C');">C</td>
			<td class="button" align="center" id="0" onclick="test('0');">0</td>
			<td class="button" align="center" id="%" onclick="test('%');">%</td>
			<td class="button" align="center" id="/" onclick="test('/');">/</td>			
		</tr>
		<tr>
			<td class="button" align="center" id="Backspace" onclick="test('CE');">←</td>
			<td class="button" align="center" id="." onclick="test('.');">.</td>
			<td class="button" align="center" id="Enter" onclick="test('=');" colspan="2">=</td>
		</tr>
	</table>
<script>
	function test(value1){
		var a = 0;
		if($("#aa").text() == "="){
			if(value1 == '+' || value1 == '-'||value1 == '*'||value1 == '/'||value1 == '%' ||value1 =='.'){
				var a =  $("#aaa").val()+value1;
				 $("#aaa").val(a)
				 $("#aa").text("")
			}else if(value1=='C'){
				 $("#aaa").val("")
				 $("#aa").text("")
			}else if(value1=='='){
				var c = eval($("#aaa").val());
				$("#aaa").val(c);
			}else if(value1=="CE"){
				var b = $("#aaa").val();
				var slice = b.slice(0,-1);
				$("#aaa").val(slice);
			}else{
				 $("#aaa").val(value1)
				 $("#aa").text("")
			}

		}else if(value1=='+'||value1=='-'||value1=='*'||value1=='/'||value1 == '%' ||value1 =='.'){
			var b = $("#aaa").val();
			var last = b.charAt(b.length -1);
			if(last =="+" ||last =="-" ||last =="*" ||last =="/" ||last =="%"||last =="." ){
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
			if(last =="+" ||last =="-" ||last =="*" ||last =="/" ||last =="%"||last =="."){
				var slice = e.slice(0,-1);
				$("#aaa").val(slice);
			}
			var c = eval($("#aaa").val());
			$("#aaa").val(c);
			$("#aa").text(value1);
		}else if(value1=="CE"){
			var b = $("#aaa").val();
			var slice = b.slice(0,-1);
			$("#aaa").val(slice);
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

	cal.addEventListener("mouseover", showColor);
	cal.addEventListener("mouseout", removeColor);
	cal.addEventListener("mousedown", mouseDownColor);
	cal.addEventListener("mouseup", mouseUpColor);
	
	window.onkeydown = (e) => console.log(e)
	
window.addEventListener("keydown", e => {
   const key = document.getElementById(e.key);
   if (key) key.classList.add('pressed');
});
window.addEventListener("keyup", e => {
   const key = document.getElementById(e.key);
   if (key) key.classList.remove('pressed');
});
	
$(document).keydown(function(event) {
	if(event.keyCode == '13' ) {
		test('=');
	}else if(event.keyCode == '53' && event.shiftKey){
		test('%');
	}else if(event.keyCode == '96' || event.keyCode == '48'){
		test('0');
	}else if(event.keyCode == '97' || event.keyCode == '49'){
		test('1');
	}else if(event.keyCode == '98' || event.keyCode == '50'){
		test('2');
	}else if(event.keyCode == '99' || event.keyCode == '51'){
		test('3');
	}else if(event.keyCode == '100' || event.keyCode == '52'){
		test('4');
	}else if(event.keyCode == '101' || event.keyCode == '53'){
		test('5');
	}else if(event.keyCode == '102' || event.keyCode == '54'){
		test('6');
	}else if(event.keyCode == '103' || event.keyCode == '55'){
		test('7');
	}else if(event.keyCode == '104' || event.keyCode == '56'){
		test('8');
	}else if(event.keyCode == '105' || event.keyCode == '57'){
		test('9');
	}else if(event.keyCode == '110' || event.keyCode == '190'){
		test('.');
	}else if(event.keyCode == '111' || event.keyCode == '191'){
		test('/');
	}else if(event.keyCode == '106' || event.keyCode == '190'){
		test('*');
	}else if(event.keyCode == '107' || event.keyCode == '187'){
		test('+');
	}else if(event.keyCode == '109' || event.keyCode == '189'){
		test('-');
	}else if(event.keyCode == '67'){
		test('C');
	}else if(event.keyCode == '37'){
		test('%');
	}else if(event.keyCode == '8'){
		test('CE');
	}
});
</script>
</body>
</html>