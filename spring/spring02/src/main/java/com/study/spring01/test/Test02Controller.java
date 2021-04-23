package com.study.spring01.test;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class Test02Controller {

	@RequestMapping("/test02.do") //RequestMapping이라는 것은  url 매핑이다. http://localhost:8090/spring01/test01.do
    public String test02(Model model) {
        return "_test/test02/exam01"; //  /WEB-INF/views/test01/test01로 넘어감..  ,  servlet-contect.xml에서 확인..
    }
    
    @RequestMapping("/test02Proc.do")
    public String test02Proc(
    		Model model,
    		@RequestParam(value="name", defaultValue="") String name,
    		@RequestParam(value="gender", defaultValue="--") String gender,
    		@RequestParam(value="jumin", defaultValue="") String jumin
    		) {
    	System.out.println("gender:" + gender);
    	
    	model.addAttribute("name", name);
    	model.addAttribute("gender", gender);
    	model.addAttribute("jumin", jumin);
    	
        return "_test/test02/exam01Result";
    }
    
}
