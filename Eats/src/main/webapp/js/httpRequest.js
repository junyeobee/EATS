/*XHR 전역 변수 선언*/
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

//요청 담당 함수
function sendRequest(url, params, callback, method){
   XHR=getXHR();
   alert('sendRequest 호출')
   //유효성 검사
   var newMethod=method?method:'GET';   /*method 값을 넣지 않은 경우 get으로 초기화*/
   
   if(newMethod != 'GET' && newMethod!='POST'){   /*method 방식에 오타가 있을 경우 대비*/
      newMethod='GET';
   }
   
   var newParams=(params==null || params=='')?null:params;   /*params가 없으면 null로 초기화, 있으면 params값 그대로 사용*/
   
   //get방식이고, 파라미터가 널이 아니면 url을 통해 파라미터를 전달할 수 있도록 새로운 url 생성
   if(newMethod=='GET' && newParams!=null){
      url=url+'?'+newParams;
   }
   XHR.onreadystatechange=callback;
   
   XHR.open(newMethod, url, true);
   XHR.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
   XHR.send(newMethod=='POST'?newParams:null);
}