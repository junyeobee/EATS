package com.eats.controller.store;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class StoreNewsController {

	@GetMapping("/store/storeNewsList")
    public String storeNewsList() {
        return "store/news/newsList";
    }

	@GetMapping("/store/storeNewsWrite")
    public String storeNewsWrite() {
        return "store/news/newsWrite";
    }

	@GetMapping("/store/storeNewsRead")
    public String storeNewsRead() {
        return "store/news/newsRead";
    }
}
