package com.test.springStudy.memo.controller;

import java.net.UnknownHostException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.test.springStudy.common.util.Util;

@Controller
public class MemoController {
//	@RequestMapping("memo/index.do")
//	public String index(Model model) {
//		return "memo/index";
//	}
	
	Util util = new Util();
	
	@RequestMapping("memo/index.do")
	public String index(HttpServletRequest request, Model model) throws UnknownHostException {
		Map<String, Object> map = util.basicInfo(request);
		model.addAttribute("menu_gubun","memo_index");
		model.addAttribute("ip",map.get("ip"));
		return "main/main";
	}
}
