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
public class Test08Controller {

	@RequestMapping("/test08.do") //url mapping
	public String test08() {
		
		return "test08/exam01";
	}

	
	@RequestMapping("/test08Proc.do") //url mapping
	public String test08Proc(
			Model model,
			@RequestParam(value="id", defaultValue="") String id,
			@RequestParam(value="pw", defaultValue="") String pw
			) {
		String msg = "";
		String DB_id = "hong";
		String DB_pw = "1234";
		if(id.equals(DB_id) && pw.equals(DB_pw)) {
			msg = "로그인성공";
		}else {
			msg = "없는 아이디이거나 비밀번호가 틀렸습니다.";
		}
		model.addAttribute("msg",msg);
		model.addAttribute("id",id);
		model.addAttribute("pw",pw);
		
		return "test08/exam01Result";
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
