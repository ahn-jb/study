<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>계산1231기 만들기</title>
<style>
input
{
    width: 60px;
    height: 20px;
}
</style>
<script>
var flag = false;
function calculate() 
{
    exp.value = eval(exp.value);
}
function del()
{
    exp.value = "0";
    flag = false;
}
 
function val(num)
{
    if(!flag)
    {
        exp.value = "";
        exp.value = exp.value + num;
 
        flag = true;
    }
    else
    {
        exp.value = exp.value + num;
    } 
}
function back()
{
    //var exp = document.getElementById("exp");
 
    exp.value = exp.value.substring(0, exp.value.length-1);
 
}
function enter(e)
{
    if(e.keyCode == 13)
    {
        calculate();
    }
    else if ((48 <= e.keyCode && e.keyCode <= 57))
    {
        num = e.keyCode - 48;
        val(num);
        //exp.value = e.keyCode - 48;
 
    }
    else if ( e.keyCode == 187 || e.keyCode == 189 ||
       e.keyCode == 191 || e.keyCode == 56 )
    {
        switch (e.keyCode)
        {
            case 187:val('+');break;
            case 189:val('-');break;
            case 56:val('*');break;
            case 191:val('/');break;
        }
    }
    else if ( e.keyCode == 8 )
    {
        back();
    }
    else if ( e.keyCode == 116 || e.keyCode == 16 )
        return;
    else if ( e.keyCode == 17)
        exp.value = "";
    else
    {
        alert('숫자 또는 연산자를 입력하세요!');
    }
}
</script>
</head>
<body onkeydown="enter(event)">
<h3>계산기 만들기</h3>
<h5>crtl를 누르면 초기화, 연산자 외 버튼을 누를시 경고창, 키보드로 입력가능, Backspace가능.<h5>
<hr>
<input type="text" value="0" id="exp" style="width:350px"><br>
&emsp;<input type="button" value="BACK" onclick="back()">&emsp;
<input type="button" value="CE" onclick="del()">&emsp;
<input type="button" value="C" onclick="del()">&emsp;
<input type="button" value="=" onclick="calculate()"><br>
&emsp;<input type="button" value="7" onclick="val('7')">&emsp;
<input type="button" value="8" onclick="val('8')">&emsp;
<input type="button" value="9" onclick="val('9')">&emsp;
<input type="button" value="/" onclick="val('/')"><br>
&emsp;<input type="button" value="4" onclick="val('4')">&emsp;
<input type="button" value="5" onclick="val('5')">&emsp;
<input type="button" value="6" onclick="val('6')">&emsp;
<input type="button" value="*" onclick="val('*')"><br>
&emsp;<input type="button" value="1" onclick="val('1')">&emsp;
<input type="button" value="2" onclick="val('2')">&emsp;
<input type="button" value="3" onclick="val('3')">&emsp;
<input type="button" value="-" onclick="val('-')"><br>
&emsp;<input type="button" value="0" onclick="val('0')">&emsp;
<input type="button" value="+" onclick="val('+')">&emsp;
<input type="button" value="NONE">&emsp;
<input type="button" value="NONE">
</body>
</html>