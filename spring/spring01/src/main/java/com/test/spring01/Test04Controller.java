package com.test.spring01;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class Test04Controller {

	@RequestMapping("/test04.do") //url mapping
	public String test04() {
		
		return "test04/exam01";
	}
	
	public Map<String, String> test(HttpServletRequest request) {
		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
		String jumin = request.getParameter("jumin");
		String age = request.getParameter("age");
		Map<String, String> map = new HashMap<String, String>();
		map.put("name", name);
		map.put("gender",gender );
		map.put("jumin",jumin );
		map.put("age", age);
		
		return map;
	}
	
	@RequestMapping("/test04Proc.do") //url mapping
	public String test04Proc(
			@ModelAttribute Test04DTO dto,
			Model model
			) {
		String name = dto.getName();
		String gender = dto.getGender();
		String jumin = dto.getJumin();
		int age = dto.getAge();
		model.addAttribute("name",name);
		model.addAttribute("jumin",jumin);
		model.addAttribute("gender",gender);
		model.addAttribute("age",age);
		return "test04/exam01Result";
	}
	
}
