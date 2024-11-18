package com.eats.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminEtcController {


	@GetMapping("/admin/main")
    public String main() {
        return "admin/index";
    }

	@GetMapping("/admin/userList")
    public String userList() {
        return "admin/adminEtc/userList";
    }

	@GetMapping("/admin/reviewDelOkList")
    public String reviewDelOkList() {
        return "admin/adminEtc/reviewDelOkList";
    }
}
