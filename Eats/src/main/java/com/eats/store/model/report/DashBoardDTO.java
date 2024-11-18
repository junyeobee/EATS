package com.eats.store.model.report;

import java.util.List;

import com.eats.store.model.main.GenderCntDTO;
import com.eats.store.model.main.MonthCntDTO;
import com.eats.store.model.main.ReserveNoshowDTO;
import com.eats.store.model.main.ReserveReqDTO;
import com.eats.store.model.main.ReserveToTimeDTO;
import com.eats.store.model.main.ReserveWeekDTO;
import com.eats.store.model.main.SellTop3MenuDTO;
import com.eats.store.model.main.SelltwlwDTO;

public class DashBoardDTO {
	private int dailySell;
	private int dailyReserve;
	private List<GenderCntDTO> gendercnt;
	private List<MonthCntDTO> monthResereve;
	private int reserveWaitingCnt;
	private ReserveNoshowDTO reserveNoshowOrCancel;
	private List<ReserveWeekDTO> reserveWeek;
	private List<ReserveToTimeDTO> reserveTimeSlotWithToday;
	private List<ReserveReqDTO> reserveReq;
	private SelltwlwDTO sellCompare;
	private List<SellTop3MenuDTO> sellTop3Menu;
	
	public DashBoardDTO() {
		// TODO Auto-generated constructor stub
	}

	public int getDailySell() {
		return dailySell;
	}

	public void setDailySell(int dailySell) {
		this.dailySell = dailySell;
	}

	public int getDailyReserve() {
		return dailyReserve;
	}

	public void setDailyReserve(int dailyReserve) {
		this.dailyReserve = dailyReserve;
	}

	public List<GenderCntDTO> getGendercnt() {
		return gendercnt;
	}

	public void setGendercnt(List<GenderCntDTO> gendercnt) {
		this.gendercnt = gendercnt;
	}

	public List<MonthCntDTO> getMonthResereve() {
		return monthResereve;
	}

	public void setMonthResereve(List<MonthCntDTO> monthResereve) {
		this.monthResereve = monthResereve;
	}

	public int getReserveWaitingCnt() {
		return reserveWaitingCnt;
	}

	public void setReserveWaitingCnt(int reserveWaitingCnt) {
		this.reserveWaitingCnt = reserveWaitingCnt;
	}

	public ReserveNoshowDTO getReserveNoshowOrCancel() {
		return reserveNoshowOrCancel;
	}

	public void setReserveNoshowOrCancel(ReserveNoshowDTO reserveNoshowOrCancel) {
		this.reserveNoshowOrCancel = reserveNoshowOrCancel;
	}

	public List<ReserveWeekDTO> getReserveWeek() {
		return reserveWeek;
	}

	public void setReserveWeek(List<ReserveWeekDTO> reserveWeek) {
		this.reserveWeek = reserveWeek;
	}

	public List<ReserveToTimeDTO> getReserveTimeSlotWithToday() {
		return reserveTimeSlotWithToday;
	}

	public void setReserveTimeSlotWithToday(List<ReserveToTimeDTO> reserveTimeSlotWithToday) {
		this.reserveTimeSlotWithToday = reserveTimeSlotWithToday;
	}

	public List<ReserveReqDTO> getReserveReq() {
		return reserveReq;
	}

	public void setReserveReq(List<ReserveReqDTO> reserveReq) {
		this.reserveReq = reserveReq;
	}

	public SelltwlwDTO getSellCompare() {
		return sellCompare;
	}

	public void setSellCompare(SelltwlwDTO sellCompare) {
		this.sellCompare = sellCompare;
	}

	public List<SellTop3MenuDTO> getSellTop3Menu() {
		return sellTop3Menu;
	}

	public void setSellTop3Menu(List<SellTop3MenuDTO> sellTop3Menu) {
		this.sellTop3Menu = sellTop3Menu;
	}

	public DashBoardDTO(int dailySell, int dailyReserve, List<GenderCntDTO> gendercnt, List<MonthCntDTO> monthResereve,
			int reserveWaitingCnt, ReserveNoshowDTO reserveNoshowOrCancel, List<ReserveWeekDTO> reserveWeek,
			List<ReserveToTimeDTO> reserveTimeSlotWithToday, List<ReserveReqDTO> reserveReq, SelltwlwDTO sellCompare,
			List<SellTop3MenuDTO> sellTop3Menu) {
		this.dailySell = dailySell;
		this.dailyReserve = dailyReserve;
		this.gendercnt = gendercnt;
		this.monthResereve = monthResereve;
		this.reserveWaitingCnt = reserveWaitingCnt;
		this.reserveNoshowOrCancel = reserveNoshowOrCancel;
		this.reserveWeek = reserveWeek;
		this.reserveTimeSlotWithToday = reserveTimeSlotWithToday;
		this.reserveReq = reserveReq;
		this.sellCompare = sellCompare;
		this.sellTop3Menu = sellTop3Menu;
	}
	
	
}
