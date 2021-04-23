package com.study.spring01.test;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class Test03Controller {

	@RequestMapping("/test03.do") //RequestMapping이라는 것은  url 매핑이다. http://localhost:8090/spring01/test01.do
    public String test03(Model model) {
        return "_test/test03/exam01"; //  /WEB-INF/views/test01/test01로 넘어감..  ,  servlet-contect.xml에서 확인..
    }
    
    @RequestMapping("/test03Proc.do")
    public String test03Proc(
    		HttpServletRequest request,
    		Model model
    		) {
    	String name = request.getParameter("name");
    	String gender = request.getParameter("gender");
    	String jumin = request.getParameter("jumin");
    	String age_ = request.getParameter("age");
    	int age = Integer.parseInt(age_);
    	
    	model.addAttribute("name", name);
    	model.addAttribute("gender", gender);
    	model.addAttribute("jumin", jumin);
    	model.addAttribute("age", age);
    	
        return "_test/test03/exam01Result";
    }
    
}
