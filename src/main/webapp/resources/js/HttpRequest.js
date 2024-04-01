/*
Ajax
- Asynchronous JavaScript and XML
- 자바스크립트를 이용한 백그라운드 통신기술
(비동기 통신)
- 웹 페이지 전체를 다시 로딩하지 않고도, 웹 페이지의 일부분만을 갱신할 수 있다
- 이때 서버와는 다음과 같은 다양한 형태의 데이터를 주고받을 수 있다.

- JSON
- XML
- HTML
- 텍스트파일
등등


Ajax의 가장 핵심적인 구성요소는 바로 XMLHttpRequest 객체이다.
Ajax에서 XMLHttpRequest객체는 웹 브라우저와 서버가 데이터를 교환할 때 사용
웹 브라우저가 백그라운드에서 계속해서 서버와 통신할 수 있는 것은 XMLHttpRequest객체 때문이다.
*/

var xhr = null;

function createRequest(){
	/*
	* JavaScript를 이용하여 서버로 정보를 보내는 HTTP request를 만들기 위해서는 이런 기능을
	* 제공하는 객체가 필요하다.
	* XMLHTTPRequest 객체가 이를 지원한다.
	* 
	*/
	
	if(xhr != null){
		return;
	}
	
	//window.ActiveXobject
	//ActiveXobject를 지원하는 브라우저면 오브젝트를 리턴하고
	//그렇지 않으면 null을 return한다.
	
	if(window.ActiveXObject){
		xhr = new ActiveXObject("Microsoft.XMLHTTP"); //IE환경
	}else{
		xhr = new XMLHttpRequest(); //나머지 브라우저에서 객체 생성
	}
	
}

//url:목적지
//param : 파라미터
//callback : 처리후 돌아올 곳
//method : 전송방식(GET,POST)
function sendRequest(url, param, callBack, method){
	createRequest();
	
	//전송타입을 구분
	var httpMethod = (method != 'POST' && method !='post') ? 'GET' : 'POST';
	
	//파라미터 구분
	var httpParam = (param == null || param =='') ? null : param;
	
	//접근 url
	var httpURL = url;
	
	//요청 방식이 GET이고, 전달할 파라미터가 있다면
	//url경로 새로 제작하기
	if(httpMethod == 'GET' && httpParam != null){
		httpURL = httpURL+"?"+httpParam;
	}
	//xhr.open(요청방식,목적지,비동기여부(true면 비동기));
	xhr.open(httpMethod,httpURL,true);
	
	//만약 "POST" type을 보내려 한다면, 요청(request)에 MIME type을 설정해야 한다.
	//예를 들자면 send()를 호출하기 전에 아래와 같은 형태로 send()로 보낼 쿼리를 이용해야 한다.
	//application/x-www-form-urlencoded는 html의 form의 기본 Content-Type이다.
	//key=value&key=value의 형태로 전달된다.
	
	xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	
	//작업이 완료된 후 호출될 콜백메서드를 지정
	xhr.onreadystatechange=callBack;
	
	//xhr.setRequestHeader();
	
	//send() : 데이터 교환을 요청하는 함수
	xhr.send(httpMethod == 'POST'?httpParam:null);
	
	
	
}
