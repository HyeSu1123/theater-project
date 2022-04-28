	function checkid(){
		var popupWidth = 300;
		var popupHeight = 150;

		var popupX = (window.screen.width / 2) - (popupWidth / 2);

		var popupY= (window.screen.height / 2) - (popupHeight / 2);
		
		var id = document.appForm.id.value;
		var url="./idCheck.do?id="+id;
		window.open(url,"아이디 중복체크",'height=' + popupHeight  + ', width=' + popupWidth  + ', left='+ popupX + ', top='+ popupY);
	}
	var space = /\s/g;
	const sendit = function(){
		const frm = document.appForm;
		const id = frm.id;
		const reg = /[^a-z0-9]/g;
		if(id.value == ""){
			id.focus();
			return alert("아이디를 입력해주세요");
		}else if(id.value.match(space)){
			return alert("공백없이 입력해주세요");
		}else if(reg.test(id.value)){
			return alert("아이디는 영문 소문자 숫자만 입력해주세요");
		}else if(id.value.length <= 5){
			return alert("최소 5자 이상 입력해주세요");
		}else if(id.value.length > 10){
			return alert("최대 10자 이내로 입력해주세요");
		}
	}
	