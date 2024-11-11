var XHR=null;

function getXHR(){
   if(window.ActiveXObject){
      return new ActiveXObject('Msxml2.XMLHTTP');
   }else if(window.XMLHttpRequest){
      return new XMLHttpRequest();
   }else{
      return null;
   }
}

function sendRequest(url, params, callback, method){
   XHR=getXHR();

   //유효성 검사
   var newMethod=method?method:'GET';
   
   if(newMethod != 'GET' && newMethod!='POST'){
      newMethod='GET';
   }
   
   var newParams=(params==null || params=='')?null:params; 
   
   if(newMethod=='GET' && newParams!=null){
      url=url+'?'+newParams;
   }
   XHR.onreadystatechange=callback;
   
   XHR.open(newMethod, url, true);
   XHR.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
   XHR.send(newMethod=='POST'?newParams:null);
}