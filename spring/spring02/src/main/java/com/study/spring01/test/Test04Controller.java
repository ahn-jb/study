package com.study.spring01.test;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class Test04Controller {

	@RequestMapping("/test04.do") //RequestMapping이라는 것은  url 매핑이다. http://localhost:8090/spring01/test01.do
    public String test04(Model model) {
        return "_test/test04/exam01"; //  /WEB-INF/views/test01/test01로 넘어감..  ,  servlet-contect.xml에서 확인..
    }
    
    @RequestMapping("/test04Proc.do")
    public String test04Proc(
    		@ModelAttribute Test04DTO dto,
    		Model model
    		) {
    	String name = dto.getName();
    	String gender = dto.getGender();
    	String jumin = dto.getJumin();
    	int age = dto.getAge();
    	
    	model.addAttribute("name", name);
    	model.addAttribute("gender", gender);
    	model.addAttribute("jumin", jumin);
    	model.addAttribute("age", age);
    	
        return "_test/test04/exam01Result";
    }
    
}
