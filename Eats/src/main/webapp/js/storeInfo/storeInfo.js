//문구 복사 함수
function copyText(){
	var textElement=document.getElementById('street_addr');
	
	var range=document.createRange();
	range.selectNodeContents(textElement);
	
	var selection=window.getSelection();
	selection.removeAllRanges();
	selection.addRange(range);
	
	try{
		document.execCommand('copy');
		alert('복사되었습니다.');
	}catch(err){
		console.error('복사 실패', err);
	}
	
	selection.removeAllRange();
}

$(document).ready(function(){
	/* 초기화 */ 
	$('.tab-contents .tab-panel').eq(0).show(); // 첫번째 탭 활성화
	tabInit();

	// 이미지 스와이프
    var swiperStore = new Swiper(".swp-store", {
      navigation: {
        nextEl: ".swiper-button-next",
        prevEl: ".swiper-button-prev",
      },
    });

	// 공지사항 스와이프
	var swiperNoti = new Swiper(".swp-noti", {
		spaceBetween: 20,
        pagination: {
          el: ".swiper-pagination",
        },
    });

	// 아코디언
	$('.acco-head .btn-acco').on('click', function(e){
		e.preventDefault();

		if ($(this).hasClass('on')) {
			$(this).removeClass('on');
			$(this).closest('.acco-wrap').find('.acco-body').stop().slideUp(150);
		} else {
			$(this).addClass('on');
			$(this).closest('.acco-wrap').find('.acco-body').stop().slideDown(150);
		}
	});

	// 메뉴 탭
	$('.tab-list li').on('click', function(e){
		e.preventDefault();
		var idx;

		if (!$(this).hasClass('on')){
			$('.tab-list li').removeClass('on');
			$(this).addClass('on');
			idx = $(this).index();
			$('.tab-contents .tab-panel').hide();
			$('.tab-contents .tab-panel').eq(idx).show();

			tabInit();	// 다른 탭 눌렀다가 돌아왔을 때 더보기가 이미 되어있는 상태를 원하면 삭제해도 됨.
		}
	})

	// 메뉴 더보기 클릭
	$('.btn-menu-more').on('click',function(){
		$(this).siblings('.menu-list').find('li').css('display','flex');
		$(this).hide();
	})

	// 탭 초기화 함수
	/* function tabInit() {
		$('.tab-contents .tab-panel .menu-list').each(function(){
			if ($(this).find('li').length > 5){
				$(this).siblings('.btn-menu-more').show();
	
				$(this).find('li:gt(4)').hide();
			}
		});
	} */
	function tabInit() {
	    $('.tab-contents .tab-panel .menu-list').each(function() {
	        console.log('Checking menu-list:', $(this));
	        if ($(this).find('li').length > 5) {
	            $(this).siblings('.btn-menu-more').show();
	            $(this).find('li:gt(4)').hide();
	        } else {
	        }
	    });
	}
})