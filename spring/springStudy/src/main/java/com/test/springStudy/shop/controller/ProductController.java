package com.test.springStudy.shop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProductController {
	@RequestMapping("product/index.do")
	public String index(Model model) {
		return "shop/product/index";
	}
}
