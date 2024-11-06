var XHR=null;

function getXHR(){
	if(window.activeXObject){
		return new ActiveXObject("Msxml2.XMLHTTP");
	} else if(window.XMLHttpRequest){
		return new XMLHttpRequest();
	} else {
		return null;
	}
}

function sendRequest(url, params, callback, method){
	XHR=getXHR();
	
	var newMethod=method?method:'GET';
	if(newMethod!='GET' && newMethod !='POST'){
		newMethod='GET';
	}
	
	var newParams = (params==null||params=='')?null:params;
	if(newMethod=='GET' && newParams!=null){
		url=url+'?'+newParams;
	}
	
	XHR.onreadystatechange=callback;
	XHR.open(method,url,true);
	XHR.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	XHR.send(newParams);
}