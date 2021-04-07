package com.test.spring01;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class Test03Controller {

	@RequestMapping("/test03.do") //url mapping
	public String test03() {
		
		return "test03/exam01";
	}
	
//	@RequestMapping("/test03Proc.do") //url mapping
//	public String test03Proc(
//			HttpServletRequest request,
//			Model model
//			) {
//		String name = request.getParameter("name");
//		String gender = request.getParameter("gender");
//		String jumin = request.getParameter("jumin");
//		String age = request.getParameter("age");
//		
//		model.addAttribute("name",name);
//		model.addAttribute("jumin",jumin);
//		model.addAttribute("gender",gender);
//		model.addAttribute("age",age);
//		
//		return "test03/exam01Result";
//	}
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
	
	@RequestMapping("/test03Proc.do") //url mapping
	public String test03Proc(
			HttpServletRequest request,
			Model model
			) {
		Map<String, String> map = test(request);
		model.addAttribute("name",map.get("name"));
		model.addAttribute("jumin",map.get("jumin"));
		model.addAttribute("gender",map.get("gender"));
		model.addAttribute("age",map.get("age"));
		return "test03/exam01Result";
	}
	
}
