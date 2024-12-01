let inputLeft = document.getElementById("input-left");
let inputRight = document.getElementById("input-right");
let range = document.querySelector(".slider > .range");
let priceFrom = document.querySelector(".price-from");
let priceTo = document.querySelector(".price-to");
var selectedMinPrice = document.getElementById('selectedMinPrice');
var selectedMaxPrice = document.getElementById('selectedMaxPrice');
var parameters = document.getElementById('parameters');

function setLeftValue() {
	let _this = inputLeft,
		min = parseInt(_this.min),
		max = parseInt(_this.max);

	_this.value = Math.min(
		parseInt(_this.value),
		parseInt(inputRight.value) - 50
	);

	priceFrom.textContent = `${_this.value * 1} 원`;
	selectedMinPrice.innerText = _this.value.replaceAll('0000','')+`만원`;
	let percent = ((_this.value - min) / (max - min)) * 3000;

	range.style.left = percent / 30 + "%";
}

setLeftValue();

function setRightValue() {
	let _this = inputRight,
		min = parseInt(_this.min),
		max = parseInt(_this.max);

	_this.value = Math.max(parseInt(_this.value), parseInt(inputLeft.value) + 50);

	priceTo.textContent = `${_this.value * 1} 원`;
	
	selectedMaxPrice.innerText=_this.value.replaceAll('0000','')+`만원`;
	let percent = ((_this.value - min) / (max - min)) * 100;

	range.style.right = 100 - percent + "%";
}

setRightValue();

inputLeft.addEventListener("input", setLeftValue);
inputRight.addEventListener("input", setRightValue);

inputLeft.addEventListener("mouseover", (e) => {
	inputLeft.classList.add("hover");
});
inputLeft.addEventListener("mouseout", (e) => {
	inputLeft.classList.remove("hover");
});
inputLeft.addEventListener("mousedown", (e) => {
	inputLeft.classList.add("active");
});
inputLeft.addEventListener("mouseup", (e) => {
	inputLeft.classList.remove("active");
});
inputLeft.addEventListener("touchstart", (e) => {
	inputLeft.classList.add("active");
});
inputLeft.addEventListener("touchend", (e) => {
	inputLeft.classList.remove("active");
});

inputRight.addEventListener("mouseover", (e) => {
	inputRight.classList.add("hover");
});
inputRight.addEventListener("mouseout", (e) => {
	inputRight.classList.remove("hover");
});
inputRight.addEventListener("mousedown", (e) => {
	inputRight.classList.add("active");
});
inputRight.addEventListener("mouseup", (e) => {
	inputRight.classList.remove("active");
});
inputRight.addEventListener("touchstart", (e) => {
	inputRight.classList.add("active");
});
inputRight.addEventListener("touchend", (e) => {
	inputRight.classList.remove("active");
});

function selectThisRange(minPrice, maxPrice) {
	if(maxPrice==null){
		inputLeft.value=0;
		inputRight.value=minPrice;
	} else {
		inputLeft.value=minPrice;
		inputRight.value=maxPrice;
	}
	
	setLeftValue();
	setRightValue();
}

window.addEventListener('load', function(){
	var thisPrice = parameters.value.split('selectedPrice=')[1].split(',');

	if(thisPrice.length>1) {
		inputLeft.value=thisPrice[0];
		inputRight.value=thisPrice[1];
	} else {
		inputLeft.value='30000';
		inputRight.value='100000';
	}
	
	setLeftValue();
	setRightValue();
})