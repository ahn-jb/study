package com.test.spring01;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class Test07Controller {

	@RequestMapping("/test07.do") //url mapping
	public String test07() {
		
		return "test07/exam01";
	}

	
	@RequestMapping("/test07Proc.do") //url mapping
	public String test07Proc_(
			@ModelAttribute Test07DTO dto,
			Model model
			) {
		
		dto.setHarin_price(dto.getProduct_price() -(dto.getProduct_price()/100*dto.getHarin())); 
		model.addAttribute("dto", dto);
		
		Map<String,Object> map = new HashMap<>();
		map.put("dto", dto);
		
		return "test07/exam01Result";
	}
	public ModelAndView test07Proc(
			@ModelAttribute Test07DTO dto,
			Model model
			) {
		dto.setHarin_price(dto.getProduct_price() -(dto.getProduct_price()/100*dto.getHarin())); 
		model.addAttribute("dto", dto);
		
		Map<String,Object> map = new HashMap<>();
		map.put("dto", dto);
		
//		ModeAndView(url,key,value);
//		return new ModelAndView("test/modelandview_result","map",map);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("test07/exam01Result");
		mv.addObject("map",map);
		return mv;

	}
	
}
