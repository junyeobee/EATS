package com.eats.controller.store;

import java.util.Calendar;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.eats.kakao.KakaoPayService;
import com.eats.kakao.model.KakaoPayApproveDTO;
import com.eats.mapper.store.GudokMapper;
import com.eats.store.model.GudokDTO;

@Controller
@RequestMapping("/kakao")
public class KakaoController {
    @Autowired
    private KakaoPayService kakaoPayService;

    @Autowired
    private GudokMapper mapper;
    
    @GetMapping("/subscribe")
    public String showSubscribePage(Model model, @RequestParam(value = "store_Idx", required = false, defaultValue = "1") int storeIdx) {
        model.addAttribute("storeIdx", storeIdx);
        return "store/storeReport/storePay";
    }

    @PostMapping("/subscribe")
    @ResponseBody
    public String subscribe(@RequestBody GudokDTO gudok) {
        return kakaoPayService.readySubscription(gudok);
    }

    @GetMapping("/success")
        public String subscriptionSuccess(@RequestParam("pg_token") String pgToken, @RequestParam("tid") String tid, Model model) {
        KakaoPayApproveDTO response = kakaoPayService.approveSubscription(tid, pgToken);
        Calendar cal = Calendar.getInstance();
        cal.set(Calendar.HOUR_OF_DAY, 0);
        cal.set(Calendar.MINUTE, 0);
        cal.set(Calendar.SECOND, 0);
        cal.add(Calendar.MONTH, 1);

        GudokDTO gudok = new GudokDTO();
        gudok.setStoreIdx(Integer.parseInt(response.getPartner_user_id().replace("store_", "")));
        gudok.setGudokStart(new Date());
        gudok.setGudokType(1); // 월간 구독 기본값
        gudok.setGudokNextpay(cal.getTime());
        gudok.setGudokMethod("KAKAOPAY");
        gudok.setGudokInfo(response.getSid());
        gudok.setGudokStat(1); // 활성 상태

        mapper.insertGudok(gudok);

        return "redirect:/kakao/success-page";
    }

    @GetMapping("/successPage")
    public String showSuccessPage() {
        return "";
    }

    @GetMapping("/cancel")
    public String subscriptionCancel() {
        return "";
    }

    @GetMapping("/fail") 
    public String subscriptionFail() {
        return "subscription/fail";
    }
}