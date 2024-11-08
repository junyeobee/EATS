package com.eats.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class StoreController {

    @Autowired
    //private StoreNewsService service;

	@GetMapping("/admin/storeInfoUpdateOk")
    public String storeInfoUpdateOk() {
        return "admin/store/storeInfoUpdateOk";
    }

	@GetMapping("/admin/storeList")
    public String storeList() {
        return "admin/store/storeList";
    }
}
