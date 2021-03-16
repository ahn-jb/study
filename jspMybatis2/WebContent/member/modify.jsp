<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/inc_header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<form name="updateForm">
		<h2>회원 상세정보</h2>
		<table>
			<tr>
				<td>등급:</td>
				<td>
					<c:if test ="${dto.getGrade()==1}">
					<input type="text" id ="grade" name="grade" value="${dto.getGrade()}" >
					</c:if>
					<c:if test ="${dto.getGrade()!=1}">
					<input type="text" id ="grade" name="grade" value="${dto.getGrade()}" readonly>
					</c:if>
				</td>
			</tr>
			<tr>
				<td>아이디:</td>
				<td><input type="text" id="id" name="id" value="${dto.getId()}" readonly></td>
			</tr>
			<tr>
				<td>비밀번호:</td>
				<td><input type="password" id="pw" name="pw"></td>
			</tr>
			<tr>
				<td>비밀번호 확인:</td>
				<td><input type="password" id="pwcheck" name="pwcheck"></td>
			</tr>
			<tr>
				<td>이름:</td>
				<td><input type="text" id="name" name="name" value="${dto.getName()}"></td>
			</tr>
			<tr>
				<td>성별:</td>
				<td>
					<input type="text" id="gender" name="gender" value="${dto.getGender()}" readonly>
				</td>
			</tr>
			<tr>
				<td>생년:</td>
				<td><input type="text" id="bornYear" name="bornYear" value="${dto.getBornYear()}" readonly></td>
			</tr>
			<tr>
				<td>주소:</td>
				<td>
					<input type="text" id="sample4_postcode"  name="postNum" placeholder="우편번호" value="${dto.getPostNum()}">
					<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
					<input type="text" id="sample4_roadAddress" name="street_addr" placeholder="도로명주소" value="${dto.getStreet_addr()}">
					<input type="text" id="sample4_jibunAddress" name="parcel_addr" placeholder="지번주소" value="${dto.getParcel_addr()}">
					<span id="guide" style="color:#999;display:none"></span><br>
					<input type="text" id="sample4_detailAddress" name="detail_addr" placeholder="상세주소" value="${dto.getDetail_addr()}">
					<input type="text" id="sample4_extraAddress" name="reference" placeholder="참고항목" value="${dto.getReference()}">
				</td>
			</tr>
		</table>
		<br>
		<button type="button" onclick="sujeong();">수정하기</button>
		<button type="button" onclick="sunteak_proc('resetList','1','');">취소</button>
		<input type="hidden" name="no" value="${dto.getNo()}" readonly>
	</form>
<script>
	function sujeong(){
		 if(document.updateForm.pw.value.trim() ==""){
			alert('비밀번호를 입력하세요.')
			document.updateForm.pw.fucus();
			return false;
		}else if(document.updateForm.pw.value != document.updateForm.pwcheck.value){
			alert('비밀번호가 다릅니다.')
			document.updateForm.pwcheck.fucus();
			return false;
		}else if(confirm('이 정보로 수정 하시겠습니까?')){
			sunteak_proc('modifyProc','1','');
		}
	}
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