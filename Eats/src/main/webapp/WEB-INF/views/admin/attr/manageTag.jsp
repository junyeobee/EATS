<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- noto sans kr font-->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="./css/manager/tagCss.css">
<link rel="stylesheet" href="./css/manager/headerCss.css">
<link rel="stylesheet" href="./css/manager/navigationCss.css">

<script type="text/javascript" src="js/ajaxJs.js"></script>

<style>
a, button, input, select, h1, h2, h3, h4, h5, * {
	box-sizing: border-box;
	margin: 0;
	padding: 0;
	border: none;
	text-decoration: none;
	background: none;
	-webkit-font-smoothing: antialiased;
}

menu, ol, ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
}
</style>

<script>
	function hoverThisTag(t) {
		if(t.lastElementChild!=t.firstElementChild){
			var addIcon = t.lastElementChild;
			addIcon.style.display = 'inline';
		}
	}
	
	function outThisTag(t) {
		if(t.lastElementChild!=t.firstElementChild){
			var addIcon=t.lastElementChild;
			addIcon.style.display='none';
		}
	}

	function addNewCategory(t) {
		var cate_title = document.getElementById('cate_title_text');
		var cate_tag = document.getElementById('cate_tag_text');

		var my_contents = document.getElementById('my_contents');
		var new_cate_tag = document.getElementById('new_category_box');

		var nowCateTitle = document.getElementsByClassName('category_title_text');
		var isExist='';
		for(var i=0; i<nowCateTitle.length-1; i++) {
			if(cate_title.value==nowCateTitle[i].innerText){
				isExist='on';
			}
		}
		if (cate_title.value != '' && cate_tag.value!='' && new_cate_tag==null) {
			if(isExist=='on'){
				cate_title.value='';
				cate_tag.value='';
				alert('이미 존재하는 카테고리입니다.');
			} else {
			var category_box = document.createElement('div');
			category_box.className = 'new_category_box';
			category_box.id = 'new_category_box';
	
			createCategoryBox(category_box, cate_title.value,0);
			createTagGroup(category_box, cate_tag.value,0);
				
			cate_title.value='';
			cate_tag.value='';
			
			my_contents.insertBefore(category_box, t.parentElement);
		}}
	}

	function createCategoryBox(category_box, title,keyidx) {
		var category_title_box = document.createElement('div');
		category_title_box.className = 'category_title_box';
	
		if(keyidx==0){
			var category_title = document.createElement('div');
			category_title.className='category_title';
			
			var category_title_text = document.createElement('input');
			category_title_text.className = 'category_title_text';
			category_title_text.value = title;
			
			var catebtn = document.createElement('input');
			catebtn.type = 'radio';
			catebtn.name='sort';
			catebtn.className = 'cate_radio';
			catebtn.id = 'cate_radio1';
			catebtn.value='main';
			/* catebtn.setAttribute('onclick', 'addCateLabelText(this)'); */
			
			var cate_label = document.createElement('label');
			cate_label.setAttribute('for','cate_radio1');
			cate_label.innerText='태그';
			
			
			var catebtn2 = document.createElement('input');
			catebtn2.type = 'radio';
			catebtn2.name='sort';
			catebtn2.className = 'cate_radio';
			catebtn2.id = 'cate_radio2';
			catebtn2.value='sub';
			/* catebtn2.setAttribute('onclick', 'addCateLabelText(this)'); */
			
			var cate_label2 = document.createElement('label');
			cate_label2.setAttribute('for','cate_radio2');
			cate_label2.innerText='특징';
			
			var cate_radio_box = document.createElement('div');
			cate_radio_box.className='cate_radio_box';
			
			cate_radio_box.append(catebtn,cate_label,catebtn2,cate_label2);
			
			var category_save_btn = document.createElement('input');
			category_save_btn.setAttribute('type','button');
			category_save_btn.className='category_save_btn';
			category_save_btn.value='저장';
			category_save_btn.setAttribute('onclick','modalForCheck("cateadd","'+title+'",'+keyidx+')');
			
			category_title.append(category_title_text, cate_radio_box);
			category_title_box.append(category_title, category_save_btn);
		} else {	
			var category_title_text = document.createElement('div');
			category_title_text.className = 'category_title_text';
			category_title_text.innerText = title;
			
			var cate_delete_text = document.createElement('div');
			cate_delete_text.className='category_delete_text';
			cate_delete_text.setAttribute('onclick', 'modalForCheck("catedelete","'+title+'",'+keyidx+')');
			cate_delete_text.innerText='카테고리 삭제';
			
			category_title_box.append(category_title_text, cate_delete_text);
		}
		
		category_box.append(category_title_box);
	}

	function createTagGroup(category_box, tag, keyidx) {
		var tag_group = document.createElement('div');
		tag_group.className = 'tag_group';
		tag_group.id='tagbox'+keyidx;

		var tag_add_box = document.createElement('div');
		tag_add_box.className='tag_add_box';
		
		var tag_add_icon = document.createElement('img');
		tag_add_icon.className='tag_add_icon';
		tag_add_icon.setAttribute('src', '/svg/add_icon_tomato.svg');
		tag_add_icon.setAttribute('onclick', 'addMoreTag(this,'+keyidx+')');

		tag_add_box.appendChild(tag_add_icon);
		
		if((typeof tag)!='string'){
			for(var i=0; i<tag.length; i++) {
				var tag_box=createTagBox(tag[i],keyidx);
				tag_group.appendChild(tag_box);
			}
			tag_group.appendChild(tag_add_box);
		}
		else {
			var tag_box = createTagBox(tag, keyidx);
			
			tag_group.append(tag_box, tag_add_box);
		}
		
		category_box.appendChild(tag_group);
	}
	
	function createTagBox(tag, keyidx) {
		var tag_box = document.createElement('div');
		tag_box.setAttribute('class', 'tag_box');
		tag_box.setAttribute('onmouseover', 'hoverThisTag(this)');
		tag_box.setAttribute('onmouseout', 'outThisTag(this)');

		var tag_text = document.createElement('div');
		tag_text.setAttribute('class', 'tag_text');
		tag_text.innerText = tag;
		tag_text.setAttribute('onclick','updateNewTag(this)');
		
		var tag_icon = document.createElement('img');
		tag_icon.className = 'tag_delete_icon';
		tag_icon.src = '/svg/minus_icon.svg';
			
			if(keyidx!=0){
				var keyname = document.getElementById('tagbox'+keyidx);

				if(keyname!=null && keyname.previousElementSibling.firstElementChild.innerText=='좌석 유형') {
					tag_box.appendChild(tag_text);
					console.log(keyname.previousElementSibling.firstElementChild);
				} else {
					tag_icon.setAttribute('onclick','modalForCheck("tagdelete","'+tag+'",'+keyidx+')');
					tag_box.append(tag_text, tag_icon);
				}
			} else {
				tag_icon.setAttribute('onclick','deleteNewTag(this)');
				tag_box.append(tag_text, tag_icon);
			}
		return tag_box;
	}
	
	function addMoreTag(t, key_idx) {
		var findInput = document.getElementsByClassName('tag_add_input_box');
		
		if(findInput.length==0){
			var tag_add_input_box = document.createElement('div');
			tag_add_input_box.setAttribute('class', 'tag_add_input_box');
			
			var tag_add_input = document.createElement('input');
			tag_add_input.setAttribute('type','text');
			tag_add_input.className='tag_add_input';
			tag_add_input.id=key_idx;
			tag_add_input.setAttribute('placeholder', '태그 이름 입력');
			tag_add_input.setAttribute('onkeypress', 'submitTagText(event, this,'+key_idx+')');
			tag_add_input_box.appendChild(tag_add_input);
			
			var tag_group = t.parentElement.parentElement;
			
			tag_group.insertBefore(tag_add_input_box, t.parentElement);	
			
			tag_add_input.focus();
		}
	}

	function submitTagText(e, t,keyidx) {
		if (e.keyCode == 13 && t.value != '') {
			var tagCont = document.getElementById('tagbox'+keyidx);
			var getTags = tagCont.querySelectorAll('.tag_box');
			var isExistTag='';
			for(var i=0; i<getTags.length; i++) {
				if(getTags[i].firstElementChild.innerText==t.value) {
					isExistTag='on';
				}
			}
			
			if(isExistTag==null || isExistTag==''){
				if(keyidx==0){
				var newtag = t.value;
				var tag_box = t.parentElement;
				tag_box.className='tag_box';
				tag_box.removeChild(tag_box.firstElementChild);
				tag_box.setAttribute('onmouseover','hoverThisTag(this)');
				tag_box.setAttribute('onmouseout','outThisTag(this)');
				
				var tag_text=document.createElement('div');
				tag_text.className='tag_text';
				tag_text.innerText=newtag;
				tag_text.setAttribute('onclick','updateNewTag(this)');

				var delete_icon = document.createElement('img');
				delete_icon.setAttribute('src','/svg/minus_icon.svg');
				delete_icon.className='tag_delete_icon';
				delete_icon.setAttribute('onclick','deleteNewTag(this)');
				tag_box.append(tag_text,delete_icon);
			} else if(keyidx!=0) {
				var params = 'cate_key_idx='+t.id+'&cate_value_name='+t.value;
				sendRequest('addTag', params, showAddTag, 'GET');
			}
			} else {
				t.value='';
				alert('이미 존재하는 태그입니다.');
			}
		}
	}
	
	function showAddTag(){
		if(XHR.readyState==4){
    		if(XHR.status==200){
    			var data=XHR.responseText;
    			var newvalue=JSON.parse(data).catevalue;
    			var newkey_s=JSON.parse(data).catekey;
    			var newkey = +newkey_s;
    			
    			var tag_group = document.getElementsByClassName('tag_group');
    			var newbox = document.getElementsByClassName('tag_add_input_box');
    			
    			for(var i=0; i<tag_group.length; i++){
    				if(tag_group[i].lastElementChild.previousElementSibling==newbox[0]){
    					tag_group[i].removeChild(newbox[0]);
    					
    					var tag_box = createTagBox(newvalue,newkey);
    					tag_group[i].insertBefore(tag_box,tag_group[i].lastElementChild);
    				}
    			}	
    		}
    	}
	}
	
	function deleteTag(cate_value,idx) {
		var params = 'cate_key_idx='+idx+'&cate_value_name='+cate_value;
		sendRequest('deleteTag',params, showDeleteTag, 'POST');
	}
	
	function showDeleteTag(){
		if(XHR.readyState==4){
    		if(XHR.status==200){
    			var data=XHR.responseText;
    			var newkey=JSON.parse(data).catekey;
    			var thiskey = JSON.parse(data).keyname;
    			var thisvalue = JSON.parse(data).catevalue;
    			
    			var category_title_text = document.getElementsByClassName('category_title_text');
    			for(var i=0; i<category_title_text.length; i++) {
    				if(category_title_text[i].innerText==thiskey) {
    					target_group = category_title_text[i].parentElement.nextElementSibling;
    					for(var i=0; i<target_group.children.length; i++) {
    						if(target_group.children[i].firstElementChild.innerText==thisvalue){
    							target_group.removeChild(target_group.children[i]);
    						} 
    					}
    				}	
    			}
    		}
    	}
	}
	
	function editThisTag(cate_value,idx) {
		var tag_group = document.getElementById('tagbox'+idx);
		var tag_box = tag_group.children;
		for(var i=0; i<tag_box.length; i++) {
			if(tag_box[i].firstElementChild.innerText==cate_value) {
				tag_box[i].className='tag_add_input_box';
				tag_box[i].removeAttribute('onmouseover');
				tag_box[i].removeAttribute('onmouseout');
				tag_box[i].removeAttribute('onclick');
				
				tag_box[i].removeChild(tag_box[i].firstElementChild);
				tag_box[i].removeChild(tag_box[i].firstElementChild);
				
				var input = document.createElement('input');
				input.setAttribute('type','text');
				input.className='tag_add_input';
				input.id=idx;
				input.placeholder=cate_value;
				input.setAttribute('onkeypress','submitEditText(event,this,'+idx+',"'+cate_value+'")');
				tag_box[i].appendChild(input);
				
				input.focus();
			}
		}
	}
	
	function submitEditText(e,t,idx, cate_value) {
		if (e.keyCode == 13 && t.value != '') {
			var params = 'new_tag_name='+t.value+'&cate_key_idx='+idx+'&cate_value_name='+cate_value;
			sendRequest('editTag', params, showEditTag, 'GET');
		}
	}
	
	function showEditTag(){
		if(XHR.readyState==4){
    		if(XHR.status==200){
    			var data=XHR.responseText;
    			var newtag=JSON.parse(data).new_tag;
    			var catekey = JSON.parse(data).cate_key_idx
    			
    			var tag_group = document.getElementById('tagbox'+catekey);
    			var tag_box = tag_group.children;
    			for(var i=0; i<tag_box.length; i++) {
    				if(tag_box[i].className=='tag_add_input_box') {
    					tag_box[i].className='tag_box';
    					tag_box[i].setAttribute('onmouseover','hoverThisTag(this)');
    					tag_box[i].setAttribute('onmouseout','outThisTag(this)');
    					
    					tag_box[i].removeChild(tag_box[i].firstElementChild);
    					
    					var tag_text=document.createElement('div');
    					tag_text.className='tag_text';
    					tag_text.innerText=newtag;
    					tag_text.setAttribute('onclick','modalForCheck("tagupdate","'+newtag+'",'+catekey+')');

    					var delete_icon = document.createElement('img');
    					delete_icon.setAttribute('src','/svg/minus_icon.svg');
    					delete_icon.className='tag_delete_icon';
    					delete_icon.setAttribute('onclick','modalForCheck("tagdelete","'+newtag+'",'+catekey+')');
    					
    					tag_box[i].append(tag_text,delete_icon);
    				}
    			}
    		}
		}	
	}
	
	function saveNewCategory(idx){
		var cate_radio = document.getElementsByClassName('cate_radio');
		
		if(cate_radio[0].checked==true || cate_radio[1].checked==true) {
			var tag_group = document.getElementById('tagbox'+idx);
			var cate_text = tag_group.previousElementSibling.firstElementChild.firstElementChild;
			var tag_box = tag_group.children;
			var text='';
			for(var i=0; i<tag_box.length;i++){
				if(tag_box[i].className=='tag_box') {
					text+='&cate_value_name='+tag_box[i].firstElementChild.innerText;
				}
			}
			
			var radio = cate_radio[0].checked==true?1:2;
			
			var params = 'cate_key_name='+cate_text.value+'&cate_key_level='+radio+text;
			sendRequest('addCategory',params,showAddCategory,'GET');
		}
	}
	
	function showAddCategory() {
		if(XHR.readyState==4){
    		if(XHR.status==200){
    			var data=XHR.responseText;
    			var catekey=JSON.parse(data).cate_key;
    			var catevalue=JSON.parse(data).cate_values;
    			var keyidx = JSON.parse(data).key_idx;
    			
    			var category_box = document.createElement('div');
    			category_box.className='category_box';
    			createCategoryBox(category_box, catekey, keyidx);
    			createTagGroup(category_box, catevalue, keyidx)
    			
    			var my_contents = document.getElementById('my_contents');
    			var add_box = document.getElementById('new_category_box');
    			my_contents.insertBefore(category_box,add_box);
    			my_contents.removeChild(document.getElementById('new_category_box'));
    		}
		}
	}
	
	function modalForCheck(checkText,cate_value,idx) {
		var modal_back = document.getElementById('modal_back');
		var modalContent = document.getElementById('modalContent');
		var header = document.getElementsByTagName('header')[0];
		var body_box = document.getElementById('body_box');
		var h = body_box.scrollHeight+header.scrollHeight;
		
		var modal_title = document.getElementById('modal_title');
		var modal_check_btn = document.getElementById('modal_check_btn');
		if(checkText=='tagdelete') {
			modal_title.innerText = '태그를 삭제하시겠습니까?';
			modal_check_btn.value='삭제';
			modal_check_btn.setAttribute('onclick','modalOk("tagdelete","'+cate_value+'",'+idx+')');
		} else if(checkText=='tagupdate') {
			modal_title.innerText = '태그를 수정하시겠습니까?';
			modal_check_btn.value='수정';
			modal_check_btn.setAttribute('onclick','modalOk("tagupdate","'+cate_value+'",'+idx+')');
		} else if(checkText=='catedelete') {
			modal_title.innerText = '카테고리를 삭제하시겠습니까?';
			modal_check_btn.value='삭제';
			modal_check_btn.setAttribute('onclick','modalOk("catedelete","'+cate_value+'",'+idx+')');
		} else if(checkText=='cateadd') {
			modal_title.innerText = '새로운 카테고리와 태그를 생성 하시겠습니까?';
			modal_check_btn.value='생성';
			modal_check_btn.setAttribute('onclick','modalOk("cateadd",0,'+idx+')');
		}
		
		var wh = window.innerHeight;
		if(wh>h) {
			h=wh;
		}
        modal_back.style.height = h+'px';
        modalContent.style.marginTop=window.scrollY+400+'px';
        
		modal_back.style.display = 'flex';
	}
	
	function modalOk(text,cate_value, idx) {
		if(text=='tagdelete'){
			deleteTag(cate_value,idx);
		} else if(text=='catedelete') {
			deleteCategory(cate_value, idx);
		} else if(text=='tagupdate') {
			editThisTag(cate_value, idx);
		} else if(text=='cateadd') {
			saveNewCategory(idx);
		}
		
		var modal_back = document.getElementById('modal_back');
		modal_back.style.display='none';
	}
	
	function deleteCategory(cate_value,idx) {
		var param = 'cate_key_idx='+idx+'&cate_key_name='+cate_value;
		sendRequest('deleteCategory', param, showDeleteCategory, 'GET');
	}
	
	function showDeleteCategory() {
		if(XHR.readyState==4){
    		if(XHR.status==200){
    			var data=XHR.responseText;
    			var thiscate=JSON.parse(data).cate_key;
    			
    			var category_title_text = document.getElementsByClassName('category_title_text');
    			for(var i=0; i<category_title_text.length; i++){
    				if(category_title_text[i].innerText==thiscate) {
    					var my_contents=document.getElementById('my_contents');
    					
    					my_contents.removeChild(category_title_text[i].parentElement.parentElement);
    				}
    			}
    		}
		}	
	}
	
	function closeModal(state) {
		var modal_back = document.getElementById('modal_back');
		
		if(state==1){
			modal_back.style.display='none';
		} else if(state==0) {
			modal_back.style.display='none';
		}
	}
	
	function updateNewTag(t) {
		var tag_box = t.parentElement;
		var tagtext = t.innerText;
		
		tag_box.className='tag_add_input_box';
		tag_box.removeAttribute('onmouseover');
		tag_box.removeAttribute('onmouseout');
				
		tag_box.removeChild(tag_box.firstElementChild);
		tag_box.removeChild(tag_box.firstElementChild);
				
		var input = document.createElement('input');
		input.setAttribute('type','text');
		input.className='tag_add_input';
		input.id=0;
		input.placeholder=tagtext;
		input.setAttribute('onkeypress','submitTagText(event, this,0)');
		tag_box.appendChild(input);
				
		input.focus();
	}
	
	function deleteNewTag(t) {
		var tag_box = document.getElementById('tagbox0');
		tag_box.removeChild(t.parentElement);
	}
	
	/* function addCateLabelText(t) {
		var cate_label_text = document.createElement('div');
		cate_label_text.className='cate_label_text';
		if(t.value=='main' && t.parentElement.lastElementChild.className!='cate_label_text') {
			cate_label_text.innerText = '필수 태그는 삭제할 수 없습니다.'
			t.parentElement.appendChild(cate_label_text);
		} else if(t.value=='sub'&&t.parentElement.lastElementChild.className=='cate_label_text') {
			t.parentElement.removeChild(t.parentElement.lastElementChild);
		}
		
	} */
</script>

<title>Document</title>
</head>

<body>
	<div class="modal_back" id="modal_back">
		<div class="modal" id="modalContent">
			<div class="modal_header">
				<img class="modal_exit_btn" src="/svg/exit.svg"
					onclick="closeModal(0)">
			</div>
			<div class="modal_body">
				<div class="modal_title" id="modal_title">태그를 삭제하시겠습니까?</div>
			</div>
			<div class="modal_buttons">
				<input type="button" class="modal_button" id="modal_cancel_btn"
					value="취소" onclick="closeModal(1)"> <input type="button"
					class="modal_button" id="modal_check_btn" value="삭제"
					onclick="modalOk(text,cate_value,idx)">
			</div>
		</div>
	</div>
	<%@ include file="/layout_component/header.jsp"%>
	<div class="body_box" id="body_box">
		<%@ include file="/layout_component/navigation.jsp"%>
		<div class="my_contents" id="my_contents">

			<c:forEach var="keys" items="${valueList }">
				<div class="category_box">
					<div class="category_title_box">
						<div class="category_title_text">${keys.key }</div>
						<c:if test="${keys.key!='좌석 유형' }">
							<div class="category_delete_text"
								onclick="modalForCheck('catedelete','${keys.key }',${idxList[keys.key]})">카테고리
								삭제</div>
						</c:if>
					</div>
					<div class="tag_group" id="tagbox${idxList[keys.key] }">
						<c:forEach var="values" items="${keys.value }">
							<div class="tag_box" onmouseover="hoverThisTag(this)"
								onmouseout="outThisTag(this)">
								<c:if test="${keys.key!='좌석 유형' }">
									<div class="tag_text"
										onclick="modalForCheck('tagupdate','${values }',${idxList[keys.key] })">${values}</div>
								</c:if>
								<c:if test="${keys.key=='좌석 유형' }">
									<div class="tag_text">${values}</div>
								</c:if>
								<c:if test=""></c:if>
								<c:if test="${keys.key!='좌석 유형' }">
									<img class="tag_delete_icon" src="/svg/minus_icon.svg"
										onclick="modalForCheck('tagdelete','${values }',${idxList[keys.key] })" />
								</c:if>
							</div>
						</c:forEach>
						<div class="tag_add_box">
							<img class="tag_add_icon" src="svg/add_icon_tomato.svg"
								onclick="addMoreTag(this,${idxList[keys.key] })" />
						</div>
					</div>
				</div>
			</c:forEach>

			<div class="category_add_box">
				<img class="category_add_icon" src="/svg/add_icon_tomato.svg"
					onclick="addNewCategory(this)" />
				<div class="category_title_text">
					<input type="text" class="category_title_input"
						id="cate_title_text" placeholder="카테고리 이름 입력">
				</div>
				<div class="category_add_input_box">
					<input type="text" class="category_add_input" id="cate_tag_text"
						placeholder="태그 이름 입력">
				</div>
			</div>
		</div>
	</div>
</body>
<script src="./js/adminScript.js"></script>
</html>