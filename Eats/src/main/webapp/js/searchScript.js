
var modal = document.getElementById("modal");
var exitbtn = document.getElementById("exitbtn");
var pickArea = document.getElementById('pick_area');
var areaText = document.getElementById('areaText');

function openAreaSelectBox() {
	modal.style.display = 'flex';
	var main = document.getElementById("main");
	var header = document.getElementById('userHeader');
	var h = main.scrollHeight + header.scrollHeight;
	modal.style.height = h + 'px';

	var area = modal.firstElementChild;

	var middle = ((window.innerWidth - area.scrollWidth) / 2) / window.innerWidth * 100;
	area.style.left = middle + '%';
}

exitbtn.addEventListener('click', function() {
	modal.style.display = 'none';
});


function selectCity(cityIdx, t) {
	areaText.innerText = t.innerText;
	var params = 'cityIdx=' + cityIdx;
	sendRequest('selectUnit', params, showUnit, 'GET');
}

function showUnit() {
	if (XHR.readyState == 4) {
		if (XHR.status == 200) {
			var data = XHR.responseText;
			var jd = JSON.parse(data);

			var unitbox = document.getElementById('unitbox');
			unitbox.innerHTML = '';

			var svalue = document.createElement('div');
			svalue.setAttribute('class', 'area_small_value');

			jd.list.forEach(function(unit) {
				var value_text = document.createElement('div');
				value_text.setAttribute('class', 'area_small_value_text');
				value_text.setAttribute('onclick', 'selectThisArea(this)');
				value_text.innerHTML = unit;

				svalue.appendChild(value_text);
			});

			unitbox.appendChild(svalue);
		}
	}
}

function selectThisArea(t){
    	var city = areaText.innerText.substring(0,2);
		var newparam = city+' '+t.innerText;
		//pickArea.innerText=city+' '+t.innerText;
		areaText.value=newparam;
		
    	var param = 'selectCity='+city+'&selectUnit='+t.innerText;
    	sendRequest('setArea', param , showSelectArea, 'GET');
    }
    
    function showSelectArea(){
    	if(XHR.readyState==4){
    		if(XHR.status==200){
    			location.href='searchStore?areaWord='+areaText.value;
    		}
    	}
    }

var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
var options = { //지도를 생성할 때 필요한 기본 옵션
	center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
	level: 3
	//지도의 레벨(확대, 축소 정도)
};

var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴




function panTo() {
	// 이동할 위도 경도 위치를 생성합니다 
	var moveLatLon = new kakao.maps.LatLng(33.450580, 126.574942);

	// 지도 중심을 부드럽게 이동시킵니다
	// 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
	map.panTo(moveLatLon);
}

function zoomIn() {
	// 현재 지도의 레벨을 얻어옵니다
	var level = map.getLevel();

	// 지도를 1레벨 내립니다 (지도가 확대됩니다)
	map.setLevel(level - 1);

	// 지도 레벨을 표시합니다
	displayLevel();
}

function zoomOut() {
	// 현재 지도의 레벨을 얻어옵니다
	var level = map.getLevel();

	// 지도를 1레벨 올립니다 (지도가 축소됩니다)
	map.setLevel(level + 1);

	// 지도 레벨을 표시합니다
	displayLevel();
}

function displayLevel() {
	var levelEl = document.getElementById('maplevel');
	levelEl.innerHTML = '현재 지도 레벨은 ' + map.getLevel() + ' 레벨 입니다.';
}

function getInfo() {
	// 지도의 현재 중심좌표를 얻어옵니다 
	var center = map.getCenter();

	// 지도의 현재 레벨을 얻어옵니다
	var level = map.getLevel();

	// 지도타입을 얻어옵니다
	var mapTypeId = map.getMapTypeId();

	// 지도의 현재 영역을 얻어옵니다 
	var bounds = map.getBounds();

	// 영역의 남서쪽 좌표를 얻어옵니다 
	var swLatLng = bounds.getSouthWest();

	// 영역의 북동쪽 좌표를 얻어옵니다 
	var neLatLng = bounds.getNorthEast();

	// 영역정보를 문자열로 얻어옵니다. ((남,서), (북,동)) 형식입니다
	var boundsStr = bounds.toString();
}


function relayout() {

	// 지도를 표시하는 div 크기를 변경한 이후 지도가 정상적으로 표출되지 않을 수도 있습니다
	// 크기를 변경한 이후에는 반드시  map.relayout 함수를 호출해야 합니다 
	// window의 resize 이벤트에 의한 크기변경은 map.relayout 함수가 자동으로 호출됩니다
	map.relayout();
}

function addThisTagToFilter(t, idx, valueName) {
	if (t.firstElementChild.style.color != 'black') {
		t.style.backgroundColor = 'white';
		t.style.borderColor = '#DFDFDF';
		t.firstElementChild.style.color = 'black';
	} else if (t.firstElementChild.style.color == 'black') {
		t.style.backgroundColor = '#ffb53c';
		t.style.borderColor = '#ffb53c';
		t.firstElementChild.style.color = 'white';

		var param = 'cate_key_idx=' + idx + '&cate_value_name=' + valueName;
		document.getElementById(idx).value = param;
	}
}

