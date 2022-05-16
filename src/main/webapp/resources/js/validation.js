	function checkid(){
		var popupWidth = 300;
		var popupHeight = 150;
		var popupX = (window.screen.width / 2) - (popupWidth / 2);
		var popupY= (window.screen.height / 2) - (popupHeight / 2);
		
		var id = document.appForm.id.value;
		var url="./idCheck.do?id="+id;
		window.open(url,"아이디 중복체크",'height=' + popupHeight  + ', width=' + popupWidth  + ', left='+ popupX + ', top='+ popupY);
		
	}
	
	const sendit = function(){
		var space = /\s/g;
		const frm = document.appForm;
		const id = frm.id;
		const reg = /[^a-z0-9]/g;
		
		if(id.value == ""){
			id.focus();
			alert("아이디를 입력해주세요");
			return false;
		}else if(id.value.match(space)){
			id.focus();
			alert("공백없이 입력해주세요");
			return false;
		}else if(reg.test(id.value)){
			id.focus();
			alert("아이디는 영문 소문자 숫자만 입력해주세요");
			return false;
		}else if(id.value.length < 5){
			id.focus();
			alert("최소 5자 이상 입력해주세요");
			return false;
		}else if(id.value.length > 10){
			id.focus();
			alert("최대 10자 이내로 입력해주세요");
			return false;
		}
		
		const pw = frm.password;
		const reg2 = /[^a-zA-Z0-9]/g;
		const upper = /[A-Z]/g, lower = /[a-z]/g, digit = /[0-9]/g;
		if(pw.value == ""){
			pw.focus();
			alert("비밀번호를 입력해주세요");
			return false;
		}else if(pw.value.match(space)){
			pw.focus();
			alert("공백없이 입력해주세요");
			return false;
		}else if(reg2.test(pw.value)){
			pw.focus();
			alert("비밀번호는 영문 대/소문자, 숫자만 입력해주세요");
			return false;
		}else if(pw.value.length <= 5){
			pw.focus();
			alert("비밀번호는 최소 5자 이상 입력해주세요");
			return false;
		}else if(pw.value.length > 10){
			pw.focus();
			alert("비밀번호는 최대 10자 이내 입력해주세요");
			return false;
		}else if(!upper.test(pw.value) || !lower.test(pw.value) || !digit.test(pw.value)){
			pw.focus();
			alert("비밀번호는 영문 대/소문자, 숫자를 모두 포함해야합니다.");
			return false;
		}
		
		const pw_ck = frm.password2;
		if(pw_ck.value == ""){
			pw_ck.focus();
			alert("비밀번호를 입력해주세요");
			return false;
		}else if(pw_ck.value != pw.value){
			pw_ck.focus();
			alert("비밀번호가 일치하지 않습니다.");
			return false;
		}
		const name = frm.name;
		if(name.value == ""){
			name.focus();
			alert("이름을 입력해주세요");
			return false;
		}
		const bir = frm.birth_date;
		const reg3 = /^\d{4}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[01])$/;
		if(bir.value == ""){
			bir.focus();
			alert("생일을 입력해주세요");
			return false;
		}else if(!reg3.test(bir.value)){
			bir.focus();
			alert("날짜 형식을 맞춰주세요(ex:2000-01-01)");
			return false;
		}
		const email = frm.email;
		const reg4 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		if(email.value == ""){
			email.focus();
			alert("이메일을 입력해주세요");
			return false;
		}else if(!reg4.test(email.value)){
			email.focus();
			alert("이메일 형식을 맞춰주세요(ex:abc@naver.com)");
			return false;
		}
		const phone = frm.phone;
		const reg5 = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
		if(phone.value == ""){
			phone.focus();
			alert("번호를 입력해주세요");
			return false;
		}else if(!reg5.test(phone.value)){
			phone.focus();
			alert("번호 형식을 맞춰주세요(ex:010-0000-0000)");
			return false;
		}
		const agree = frm.agree;
		if(!agree.checked){
			alert("약관 동의를 체크해주세요");
			agree.focus();
			return false;
		}
		
		document.appForm.submit();
	}