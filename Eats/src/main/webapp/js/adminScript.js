window.addEventListener('load', function() {
	var pathname = window.location.pathname;
	var realpath = pathname.split('?')[0];
	
	var texts = document.getElementsByClassName('navi_small_cate_text');
	for(var i=0; i<texts.length; i++) {
		if(texts[i].getAttribute("href")==realpath){
			texts[i].style.fontWeight='600';
			texts[i].style.color='#F3553C';
			texts[i].parentElement.parentElement.style.height = 'auto';

			var bigTag = texts[i].parentElement.parentElement.previousElementSibling;
			bigTag.style.backgroundColor = 'rgba(255,181,60,0.72)';
			bigTag.firstElementChild.style.fontWeight = '600';
			bigTag.firstElementChild.style.color = 'rgb(243,85,60)';
			
		}
	}
})

function selectThisMenu(t) {
        var small_cate_list = document.getElementsByClassName('navi_small_cate_box');
        var cate_box = document.getElementsByClassName('navi_cate_box');
        var small_cate = t.nextElementSibling;

        if (small_cate.style.height != 'auto') {
            for (var i = 0; i < small_cate_list.length; i++) {
                cate_box[i].firstElementChild.style.fontWeight = '400';
                cate_box[i].firstElementChild.style.color = '#461002';
                cate_box[i].style.backgroundColor = 'transparent';

                small_cate_list[i].style.height = 0;
            }

            t.firstElementChild.style.fontWeight = '600';
            t.firstElementChild.style.color = '#F3553C';
            t.style.backgroundColor = 'rgba(255,181,60,0.72)';

            small_cate.style.height = 'auto';
        } else {
            t.firstElementChild.style.fontWeight = '400';
            t.firstElementChild.style.color = '#461002';
            t.style.backgroundColor = 'transparent';

            small_cate.style.height = 0;
        }
    }

    function selectThisCate(t) {
        var small_text_list = document.getElementsByClassName('navi_small_cate_text');

        if (t.firstElementChild.style.fontWeight != '600') {
            for (var i = 0; i < small_text_list.length; i++) {
                small_text_list[i].style.fontWeight = '400';
                small_text_list[i].style.color = '#461002';
            }
            t.firstElementChild.style.fontWeight = '600';
            t.firstElementChild.style.color = '#F3553C';
        } else {
            t.firstElementChild.style.fontWeight = '400';
            t.firstElementChild.style.color = '#461002';
        }
    }