package com.eats.controller.store;

import com.eats.store.model.StoreJoinDTO;
import com.eats.store.service.StoreJoinService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/store")
public class StoreJoinController {

    @Autowired
    private StoreJoinService storeJoinService;

    @GetMapping("/apply")
    public String showJoinForm(Model model) {
        model.addAttribute("storeJoinDto", new StoreJoinDTO());
        return "store/join/storeJoin";
    }

    @PostMapping("/apply")
    public String applyForStore(StoreJoinDTO storeJoinDto, Model model) {
        boolean isSuccess = storeJoinService.applyStore(storeJoinDto);
        
        if (isSuccess) {
            return "redirect:/store/success"; // 성공 페이지로 리디렉션
        } else {
            model.addAttribute("error", "입점 신청에 실패했습니다. 다시 시도해 주세요.");
            return "store/join/storeJoin"; // 신청 실패 시 원래 페이지로 이동
        }
    }
}
