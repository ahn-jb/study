package com.study.spring01.test;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class Test05Controller {

	@RequestMapping("/test05.do") //RequestMapping이라는 것은  url 매핑이다. http://localhost:8090/spring01/test01.do
    public String test05(Model model) {
        return "_test/test05/exam01"; //  /WEB-INF/views/test01/test01로 넘어감..  ,  servlet-contect.xml에서 확인..
    }
    
    @RequestMapping("/test05Proc.do")
    public String test05Proc(
    		@ModelAttribute Test05DTO dto,
    		Model model
    		) {
    	String name = dto.getName();
    	int kor = dto.getKor();
    	int eng = dto.getEng();
    	int mat = dto.getMat();
    	int sci = dto.getSci();
    	int his = dto.getHis();
    	int tot = kor + eng + mat + sci + his;
    	double avg = tot / (double) 5;
    	
    	model.addAttribute("name", name);
    	model.addAttribute("kor", kor);
    	model.addAttribute("eng", eng);
    	model.addAttribute("mat", mat);
    	model.addAttribute("sci", sci);
    	model.addAttribute("his", his);
    	model.addAttribute("tot", tot);
    	model.addAttribute("avg", avg);
    	
        return "_test/test05/exam01Result";
    }
    
}
