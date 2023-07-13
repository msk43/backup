function inputCheck() {
	var frm = document.getElementById('regFrm');
	var pwd = frm.elements['pwd'].value;
	var repwd = frm.elements['repwd'].value;
	var tel2 = frm.elements['tel2'].value;
	var tel3 = frm.elements['tel3'].value;
	var email = frm.elements['email'].value;
	var zipcode = frm.elements['zipcode'].value;
	var code = frm.elements['code'].value;

	if (pwd === "") {
		alert("패스워드를 입력하세요.");
		frm.elements['pwd'].focus();
		return;
	}
	if (repwd === "") {
		alert("패스워드 확인을 입력하세요.");
		frm.elements['repwd'].focus();
		return;
	}
	if (pwd !== repwd) {
		alert("패스워드와 패스워드 확인이 일치하지 않습니다.");
		frm.elements['pwd'].value = "";
		frm.elements['repwd'].value = "";
		frm.elements['pwd'].focus();
		return;
	}
	if (tel2 === "" || tel3 === "") {
		alert("전화번호를 입력해 주세요.");
		frm.elements['tel2'].focus();
		return;
	}
	if (email === "") {
		alert("이메일을 입력해 주세요.");
		frm.elements['email'].focus();
		return;
	}
	if (zipcode === "") {
		alert("주소를 검색해 주세요.");
		return;
	}
	if (code === "") {
		alert("사원번호를 입력해 주세요.");
		frm.elements['code'].focus();
		return;
	}

	var str = email;
	var atPos = str.indexOf('@');
	var atLastPos = str.lastIndexOf('@');
	var dotPos = str.indexOf('.');
	var spacePos = str.indexOf(' ');
	var commaPos = str.indexOf(',');
	var eMailSize = str.length;

	if (
		atPos > 1 &&
		atPos === atLastPos &&
		dotPos > 3 &&
		spacePos === -1 &&
		commaPos === -1 &&
		atPos + 1 < dotPos &&
		dotPos + 1 < eMailSize
	) {
		document.getElementById('regFrm').submit();
	} else {
		alert('E-mail주소 형식이 잘못되었습니다.\n\r다시 입력해 주세요!');
		frm.elements['email'].focus();
		return;
	}
}

function win_close() {
	self.close();
}
