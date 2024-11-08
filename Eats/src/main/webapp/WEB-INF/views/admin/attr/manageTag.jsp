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

<script src="js/ajaxJs.js"></script>

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
		var addIcon = t.lastElementChild;

		addIcon.style.display = 'inline';
	}
	
	function outThisTag(t) {
		var addIcon=t.lastElementChild;
		addIcon.style.display='none';
	}

	function addNewCategory(t) {
		var cate_title = document.getElementById('cate_title_text');
		var cate_tag = document.getElementById('cate_tag_text');

		var my_contents = document.getElementById('my_contents');

		if (cate_title.value != '' && cate_tag.value!='') {
			var category_box = document.createElement('div');
			category_box.className = 'new_category_box';

			createCategoryBox(category_box, cate_title.value);
			createTagGroup(category_box, cate_tag.value);

			my_contents.insertBefore(category_box, t.parentElement);
			
			cate_title.value='';
			cate_tag.value='';
		}
	}

	function createCategoryBox(category_box, title) {
		var category_title_box = document.createElement('div');
		category_title_box.className = 'category_title_box';

		var category_title_text = document.createElement('div');
		category_title_text.className = 'category_title_text';
		category_title_text.innerText = title;
		
		var category_save_btn = document.createElement('input');
		category_save_btn.setAttribute('type','button');
		category_save_btn.className='category_save_btn';
		category_save_btn.value='저장';

		category_title_box.append(category_title_text, category_save_btn);
		category_box.appendChild(category_title_box);
	}

	function createTagGroup(category_box, tag) {
		var tag_group = document.createElement('div');
		tag_group.className = 'tag_group';

		var tag_add_box = document.createElement('div');
		tag_add_box.className='tag_add_box';
		
		var tag_add_icon = document.createElement('img');
		tag_add_icon.className='tag_add_icon';
		tag_add_icon.setAttribute('src', '/svg/add_icon_tomato.svg');
		tag_add_icon.setAttribute('onclick', 'addMoreTag(this)');
		
		var tag_box = createTagBox(tag);
		tag_add_box.appendChild(tag_add_icon);
		
		tag_group.append(tag_box, tag_add_box);
		category_box.appendChild(tag_group);
	}
	
	function createTagBox(tag) {
		var tag_box = document.createElement('div');
		tag_box.setAttribute('class', 'tag_box');
		tag_box.setAttribute('onmouseover', 'hoverThisTag(this)');
		tag_box.setAttribute('onmouseout', 'outThisTag(this)');

		var tag_text = document.createElement('div');
		tag_text.setAttribute('class', 'tag_text');
		tag_text.innerText = tag;

		var tag_icon = document.createElement('img');
		tag_icon.className = 'tag_delete_icon';
		tag_icon.src = '/svg/minus_icon.svg';
		
		tag_box.append(tag_text, tag_icon);
		
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
			tag_add_input.setAttribute('onkeypress', 'submitTagText(event, this)');
			
			tag_add_input_box.appendChild(tag_add_input);
			
			var tag_group = t.parentElement.parentElement;
			
			tag_group.insertBefore(tag_add_input_box, t.parentElement);	
		}
	}

	function submitTagText(e, t) {
		if (e.keyCode == 13 && t.value != '') {
			var params = 'cate_key_idx='+t.id+'&cate_value_name='+t.value;
			sendRequest('addTag', params, showAddTag, 'GET');
		}
	}
	
	function showAddTag(){
		if(XHR.readyState==4){
    		if(XHR.status==200){
    			var data=XHR.responseText;
    			var newvalue=JSON.parse(data).catevalue;
    			
    			var tag_group = document.getElementsByClassName('tag_group');
    			var newbox = document.getElementsByClassName('tag_add_input_box');
    			
    			for(var i=0; i<tag_group.length; i++){
    				if(tag_group[i].lastElementChild.previousElementSibling==newbox[0]){
    					tag_group[i].removeChild(newbox[0]);
    					
    					var tag_box = createTagBox(newvalue);
    					tag_group[i].insertBefore(tag_box,tag_group[i].lastElementChild);
    				}
    			}
    			
    			
    			
    		}
    	}
	}
</script>

<title>Document</title>
</head>

<body>
	<%@ include file="/layout_component/header.jsp"%>
	<div class="body_box">
		<%@ include file="/layout_component/navigation.jsp"%>
		<div class="my_contents" id="my_contents">

			<c:forEach var="keys" items="${valueList }">
				<div class="category_box">
					<div class="category_title_box">
						<div class="category_title_text">${keys.key }</div>
						<a href="#" class="category_delete_text">카테고리 삭제</a>
					</div>
					<div class="tag_group">
						<c:forEach var="values" items="${keys.value }">
							<div class="tag_box" onmouseover="hoverThisTag(this)"
								onmouseout="outThisTag(this)">
								<div class="tag_text">${values}</div>
								<img class="tag_delete_icon" src="/svg/minus_icon.svg" />
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