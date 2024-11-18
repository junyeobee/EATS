package com.eats.controller.store;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.eats.store.model.report.DashBoardDTO;
import com.eats.store.service.StoreMainService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class StoreMainController {
	
	@Autowired
	private StoreMainService service;
	
    @GetMapping("/storeMain")
    public ModelAndView storeMain(HttpServletRequest req) {
        HttpSession session = req.getSession();
        String storeidx = (String)session.getAttribute("store_idx");
        int store_idx = storeidx != null ? Integer.parseInt(storeidx) : 1;

        // 모든 데이터 조회
        DashBoardDTO dash = new DashBoardDTO();
        dash.setDailyReserve(service.dailyReserve(store_idx));
        dash.setDailySell(service.dailySell(store_idx));
        dash.setGendercnt(service.gendercnt(store_idx));
        dash.setMonthResereve(service.monthResereve(store_idx));
        dash.setReserveWaitingCnt(service.reserveWaitingCnt(store_idx));
        dash.setReserveNoshowOrCancel(service.reserveNoshowOrCancel(store_idx));
        dash.setReserveReq(service.reserveReq(store_idx));
        dash.setReserveTimeSlotWithToday(service.reserveTimeSlotWithToday(store_idx));
        dash.setReserveWeek(service.reserveWeek(store_idx));
        dash.setSellCompare(service.sellCompare(store_idx));
        dash.setSellTop3Menu(service.sellTop3Menu(store_idx));

        ModelAndView mv = new ModelAndView();
        mv.addObject("dash", dash);
        mv.setViewName("store/storeMain");

        return mv;
    }
}
