<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>

<script src="http://code.jquery.com/jquery-3.3.1.min.js">
</script>
<script type="text/javascript">
	function test01(){
		$('#d1').show();
		$('#d2').hide();
		$('#d3').hide();
	}
	function test02(){
		$('#d1').hide();
		$('#d2').show();
		$('#d3').hide();
	}
	function test03(){
		$('#d1').hide();
		$('#d2').hide();
		$('#d3').show();
	}
</script>

</head>
<body>

<form>
<h2>회원관리(멤버쉽)</h2>
	<table >
		<tr>
			<td width="200px">
				<input type="text" name="email" placeholder="이메일주소 입력" style="height:40px; width:500px ">
			</td>
		</tr>
	</table>
	&nbsp;&nbsp;반드시 올바른 이메일 사용
	<table>
		<tr>
			<td>
				<input type="password" name="pw" placeholder="비밀번호 (8자리 이상)" style="height:40px; width:500px ">
			</td>
		</tr>
		<tr>
			<td>
				<input type="password" name="pwc" placeholder="비밀번호 확인" style="height:40px; width:500px ">
			</td>
		</tr>
		<tr>
			<td>
				<input type="text" name="name" placeholder="의견 작성시 사용하는 이름을 적어주세요" style="height:40px; width:500px ">
			</td>
		</tr>
	</table>
	<br>
	<table>
		<tr>
			<td>
				<select name="FOI" style="height:40px; width:200px;">
					<option value="">의견 관심분야 선택 ▼
					<option value="게임">게임
					<option value="sns">SNS
					<option value="동영상">동영상
					<option value="검색">검색
				</select>
			</td>
		</tr>
		<tr>
			<td>
				<input type="text" name="name" placeholder="휴대폰 전화번호 입력('-'제외)" style="height:40px; width:395px ">
				<button type="button"  style="height:46px; width:100px ">인증번호 수신</button>
			</td>
		</tr>
		<tr>
			<td>
				<input type="text" name="name" placeholder="인증번호 입력" style="height:40px; width:500px ">
			</td>
		</tr>
	</table>
	&nbsp;&nbsp;인증번호가 전송을 확인해 주시기 바랍니다.
	<table>
		<tr>
			<td> 
				<button type="button" id="btn01" onclick="test01();" style="height:46px; width:160px;">서비스 이용약관</button>
				<button type="button" id="btn02" onclick="test02();" style="height:46px; width:160px;">개인정보 취급방침</button>
				<button type="button" id="btn03" onclick="test03();" style="height:46px; width:160px;">개인정보 제공동의</button>
			</td>
		</tr>
		<tr>
			<td>
				<div id="d1" ><textarea  id ="t1" style="width :500px; height:100px; ">서비스 이용약관</textarea> </div>
				<div id="d2" style="display: none;"><textarea  id ="t2" style="width :500px; height:100px; ">개인정보 취급방침</textarea> </div>
				<div id="d3" style="display: none;"><textarea  id ="t3" style="width :500px; height:100px; ">개인정보 제공동의</textarea> </div>
			</td>
		</tr>
		<tr>
			<td>
				<input type="checkbox">서비스 이용약관, 개인정보 취급방침, 개인정보 제공 동의
			</td>
		</tr>
	</table>&nbsp;&nbsp;
	<button type="button"  style="height:50px; width:200px" onclick="save();">회원가입</button>&nbsp;&nbsp;&nbsp;&nbsp;
	<button type="button"  style="height:50px; width:200px">취소</button>
</form>
<script>
	function save(){
		alert('회원가입이 완료되었습니다.');
		location.href="login.jsp";
	}
</script>
</body>
</html>