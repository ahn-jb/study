package com.test.spring01;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class Test09Controller {

	@RequestMapping("/test09.do") //url mapping
	public String test09() {
		
		return "test09/exam01";
	}

	
	@RequestMapping("/test09Proc.do") //url mapping
	public @ResponseBody Map<String,String> test09Proc(
			Model model,
			@RequestParam(value="id", defaultValue="") String id,
			@RequestParam(value="name", defaultValue="") String name,
			@RequestParam(value="email", defaultValue="") String email
			) {
		Map<String,String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("name", name);
		map.put("email", email);
		
		return map;
	}
	
	
	
	
	
}
