<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/inc_header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<form name="joinForm" >
		<h2>회원가입</h2>
			<table border="1" align="center" width="550">
				<tr>
					<td width="100" >아이디</td>
					<td>
<!-- 					 onkeypress="nonHangulSpecialKey()" -->
						<input type="text" id="id" name="id" value="" > 
						<button type="button" onclick="id_check();">아이디확인</button>
<!-- 						<button type="button" onclick="id_check_win_open();">아이디확인(새창)</button> -->
						<br>
						<span id="label_id" ></span>
						<input type="hidden" id="result" name="result" value="">
					</td>
				</tr>
				<tr>
					<td >비밀번호</td>
					<td><input type="password" name="pw"></td>
				</tr>
				<tr>
					<td >비밀번호 확인</td>
					<td><input type="password" name="pwcheck"></td>
				</tr>
				<tr>
					<td >이름</td>
					<td><input type="text" name="name"></td>
				</tr>
				<tr>
					<td >성별</td>
					<td>
						<input type="radio" name="gender" value="M">남자
						<input type="radio" name="gender" value="F">여자
					</td>
				</tr>
				<tr>
					<td >생년</td>
					<td><input type="text" name="bornYear"></td>
				</tr>
				<tr>
					<td>주소:</td>
					<td>
						<input type="text" id="sample4_postcode" name="postNum" placeholder="우편번호">
						<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
						<input type="text" id="sample4_roadAddress" name="street_addr" placeholder="도로명주소">
						<input type="text" id="sample4_jibunAddress" name="parcel_addr" placeholder="지번주소">
						<span id="guide" style="color:#999;display:none"></span><br>
						<input type="text" id="sample4_detailAddress" name="detail_addr" placeholder="상세주소">
						<input type="text" id="sample4_extraAddress" name="reference" placeholder="참고항목">
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center"><br>
						<button type="button" onclick="save();" >가입하기</button>
					</td>
				</tr>
			</table>
		</form>
<script type="text/javascript">
	function id_check_win_open(){
		window.open("${path}/member_servlet/id_check_win_open.do","아이디확인","width=640, height=480, toolbar=no, menubar=no, scrollbars=no, resizable=yes");
		
	}
	function id_check(){
		var id = $("#id").val();
		if(id == ''){
			$("#label_id").html('아이디를 입력하세요.');
			$("#label_id").css('color','blue');
			$("#label_id").css('font-size','8px');
			return;
		}
		var param ="id="+id;
		
		$.ajax({
			type:"post",
			data: param,
			url: "${path}/member_servlet/id_check.do",
			success: function(result){
				if(result>0){
					$("#id").val('');
					$("#label_id").html('사용할 수 없는 아이디입니다.');
					$("#label_id").css('color','red');
					$("#label_id").css('font-size','8px');
					$("#result").val('')
				}else{
					$("#label_id").html('사용할 수 있는 아이디입니다');
					$("#label_id").css('color','blue');
					$("#label_id").css('font-size','8px');
					$("#result").val('1')
				}
			}
		});
	}
	
	function check_key() {// 입력 제한
		 var char_ASCII = event.keyCode;
		  //숫자
		 if (char_ASCII >= 48 && char_ASCII <= 57 )
		   return 1;
		 //영어
		 else if ((char_ASCII>=65 && char_ASCII<=90) || (char_ASCII>=97 && char_ASCII<=122))
		    return 2;
		 //한글
		 else if ((char_ASCII >= 12592) || (char_ASCII <= 12687))
		    return 3;
		 //특수기호
		 else if ((char_ASCII>=33 && char_ASCII<=47) || (char_ASCII>=58 && char_ASCII<=64) 
		   || (char_ASCII>=91 && char_ASCII<=96) || (char_ASCII>=123 && char_ASCII<=126))
		    return 4;
		 else 
		    return 0;
		}
	function nonHangulSpecialKey() {
		 if(check_key() != 1 && check_key() != 2) {
		  event.returnValue = false;   
		  alert("숫자나 영문자만 입력하세요!");
		  return;
		 }
		}
	function save(){
		if(document.joinForm.id.value.trim() ==""){
			alert('아이디를 입력해 주세요.');
			document.joinForm.id.focus();
			return false;
		}else if(document.joinForm.pw.value.trim() ==""){
			alert('비밀번호를 입력하세요.')
			document.joinForm.pw.focus();
			return false;
		}else if(document.joinForm.pw.value != document.joinForm.pwcheck.value){
			alert('비밀번호가 다릅니다.')
			document.joinForm.pwcheck.focus();
			return false;
		}else if(document.joinForm.name.value.trim() ==""){
			alert('이름을 입력하세요.')
			document.joinForm.name.focus();
			return false;
		}else if(document.joinForm.gender.value.trim() ==""){
			alert('성별을 선택하세요.')
			document.joinForm.gender.focus();
			return false;
		}else if(document.joinForm.bornYear.value.trim() ==""){
			alert('생년을 입력하세요.')
			document.joinForm.bornYear.focus();
			return false;
		}else if(document.joinForm.postNum.value.trim() ==""){
			alert('우편번호을 입력하세요.')
			document.joinForm.postNum.focus();
			return false;
		}else if(document.joinForm.street_addr.value.trim() ==""){
			alert('도로명주소를 입력하세요.')
			document.joinForm.street_addr.focus();
			return false;
		}else if(document.joinForm.parcel_addr.value.trim() ==""){
			alert('지번주소를 입력하세요.')
			document.joinForm.parcel_addr.focus();
			return false;
		}else if(document.joinForm.result.value.trim() == "" ){
			alert('아이디를 확인해주세요.')
			document.joinForm.id.focus();
			return false;
		}else if(confirm('가입하시겠습니까?')){
			joinForm.method="post";
			joinForm.action="${path}/member_servlet/chugaProc.do";
			joinForm.submit();
		}
	}
	$(document).ready(function(){
		  //한글입력 안되게 처리
		  $("input[name=id]").keyup(function(event){ 
		   if (!(event.keyCode >=37 && event.keyCode<=40)) {
		    var inputVal = $(this).val();
		    $(this).val(inputVal.replace(/[^a-z0-9]/gi,''));
		   }
		  });
		});
</script>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
</script>		
</body>
</html>