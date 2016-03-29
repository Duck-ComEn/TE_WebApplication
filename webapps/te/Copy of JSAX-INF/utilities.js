function Trim(s) {
	return s.replace(/[ \t]+$/, "").replace(/^[ \t]+/, "");
}

function checkNumeric(param){
	asctxt = param.toString().charCodeAt(0);
	if((asctxt >= 65 && asctxt <= 90) || (asctxt >= 97 && asctxt <= 122)){
		message="Character";
	}else if(asctxt >= 48 && asctxt <= 57){
		message="Integer";
	}else{
		message="Unknow";
	}
	return message;
}