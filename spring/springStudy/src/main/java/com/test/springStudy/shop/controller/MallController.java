package com.test.springStudy.shop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MallController {
	@RequestMapping("mall/index.do")
	public String index(Model model) {
		return "shop/mall/index";
	}
}
