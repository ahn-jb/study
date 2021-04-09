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
public class Test05Controller {

	@RequestMapping("/test05.do") //url mapping
	public String test05() {
		
		return "test05/exam01";
	}

	
	@RequestMapping("/test05Proc.do") //url mapping
	public String test04Proc(
			@ModelAttribute Test04DTO dto,
			Model model
			) {
		String name = dto.getName();
		int kor = dto.getKor();
		int eng = dto.getEng();
		int mat = dto.getMat();
		int sci = dto.getSci();
		int his = dto.getHis();
		int total =dto.getTotal();
		double avg = dto.getAvg();
		model.addAttribute("name",name);
		model.addAttribute("kor",kor);
		model.addAttribute("eng",eng);
		model.addAttribute("mat",mat);
		model.addAttribute("his",his);
		model.addAttribute("sci",sci);
		model.addAttribute("total",total);
		model.addAttribute("avg",avg);
		return "test05/exam01Result";
	}
	
}
