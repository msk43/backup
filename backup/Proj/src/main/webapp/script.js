function inputCheck() {
	if (document.regFrm.id.value == "") {
		alert("아이디를 입력해 주세요.");
		document.regFrm.id.focus();
		return;
	}
	if (document.regFrm.pwd.value == "") {
		alert("비밀번호를 입력해 주세요.");
		document.regFrm.pwd.focus();
		return;
	}
	if (document.regFrm.repwd.value == "") {
		alert("비밀번호를 확인해 주세요");
		document.regFrm.repwd.focus();
		return;
	}
	if (document.regFrm.pwd.value != document.regFrm.repwd.value) {
		alert("비밀번호가 일치하지 않습니다.");
		document.regFrm.repwd.value = "";
		document.regFrm.repwd.focus();
		return;
	}
	if (document.regFrm.name.value == "") {
		alert("이름을 입력해 주세요.");
		document.regFrm.name.focus();
		return;
	}
	if (document.regFrm.rrn1.value == "" || document.regFrm.rrn1.value.length != 6
		|| document.regFrm.rrn2.value == "" || document.regFrm.rrn2.value.length != 7) {
		alert("주민등록번호를 입력해 주세요.");
		document.regFrm.rrn.focus();
		return;
	}
	if (document.regFrm.tel2.value == "" || document.regFrm.tel3.value == "") {
		alert("전화번호를 입력해 주세요.");
		document.regFrm.tel.focus();
		return;
	}
	if (document.regFrm.email.value == "") {
		alert("이메일을 입력해 주세요.");
		document.regFrm.email.focus();
		return;
	}
	if (document.regFrm.zipcode.value == "") {
		alert("주소를 검색해 주세요.");
		return;
	}
	if (document.regFrm.code.value == "") {
		alert("사원번호를 입력해 주세요.");
		document.regFrm.code.focus();
		return;
	}
	var str = document.regFrm.email.value;
	var atPos = str.indexOf('@');
	var atLastPos = str.lastIndexOf('@');
	var dotPos = str.indexOf('.');
	var spacePos = str.indexOf(' ');
	var commaPos = str.indexOf(',');
	var eMailSize = str.length;
	if (atPos > 1 && atPos == atLastPos &&
		dotPos > 3 && spacePos == -1 && commaPos == -1
		&& atPos + 1 < dotPos && dotPos + 1 < eMailSize);
	else {
		alert('E-mail주소 형식이 잘못되었습니다.\n\r다시 입력해 주세요!');
		document.regFrm.email.focus();
		return;
	}

	document.regFrm.submit();
}

function win_close() {
	self.close();
}