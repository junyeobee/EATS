package com.eats.store.model;

import java.util.List;

//매장 정보 페이지용 DTO
public class HYStoreInfoDTO {

	private HYStoreDTO storeDTO;
	
	//매장 이미지, 소식, 메뉴카테고리, 메뉴 DTO를 리스트로 담기
	private List<HYStoreImgDTO> storeImgList;
	private List<StoreTimeDTO> storeTimeList;
	private List<HYStoreNewsDTO> storeNewsList;
	private List<CategoryDTO> convList;
	private List<HYMenuCateDTO> menuCateList;
	private List<HYMenuDTO> menuList;
	
	private int jjimCnt;
	
	public HYStoreInfoDTO() {
		
	}

	public HYStoreInfoDTO(HYStoreDTO storeDTO, List<HYStoreImgDTO> storeImgList, List<StoreTimeDTO> storeTimeList,
			List<HYStoreNewsDTO> storeNewsList, List<CategoryDTO> convList, List<HYMenuCateDTO> menuCateList,
			List<HYMenuDTO> menuList, int jjimCnt) {
		super();
		this.storeDTO = storeDTO;
		this.storeImgList = storeImgList;
		this.storeTimeList = storeTimeList;
		this.storeNewsList = storeNewsList;
		this.convList = convList;
		this.menuCateList = menuCateList;
		this.menuList = menuList;
		this.jjimCnt = jjimCnt;
	}

	public HYStoreDTO getStoreDTO() {
		return storeDTO;
	}

	public void setStoreDTO(HYStoreDTO storeDTO) {
		this.storeDTO = storeDTO;
	}

	public List<HYStoreImgDTO> getStoreImgList() {
		return storeImgList;
	}

	public void setStoreImgList(List<HYStoreImgDTO> storeImgList) {
		this.storeImgList = storeImgList;
	}

	public List<StoreTimeDTO> getStoreTimeList() {
		return storeTimeList;
	}

	public void setStoreTimeList(List<StoreTimeDTO> storeTimeList) {
		this.storeTimeList = storeTimeList;
	}

	public List<HYStoreNewsDTO> getStoreNewsList() {
		return storeNewsList;
	}

	public void setStoreNewsList(List<HYStoreNewsDTO> storeNewsList) {
		this.storeNewsList = storeNewsList;
	}

	public List<CategoryDTO> getConvList() {
		return convList;
	}

	public void setConvList(List<CategoryDTO> convList) {
		this.convList = convList;
	}

	public List<HYMenuCateDTO> getMenuCateList() {
		return menuCateList;
	}

	public void setMenuCateList(List<HYMenuCateDTO> menuCateList) {
		this.menuCateList = menuCateList;
	}

	public List<HYMenuDTO> getMenuList() {
		return menuList;
	}

	public void setMenuList(List<HYMenuDTO> menuList) {
		this.menuList = menuList;
	}

	public int getJjimCnt() {
		return jjimCnt;
	}

	public void setJjimCnt(int jjimCnt) {
		this.jjimCnt = jjimCnt;
	}
}
