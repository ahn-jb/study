package com.study.spring01.test;

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

	@RequestMapping("/test08.do") //RequestMapping이라는 것은  url 매핑이다. http://localhost:8090/spring01/test01.do
    public String test08(Model model) {
        return "_test/test08/exam01"; //  /WEB-INF/views/test01/test01로 넘어감..  ,  servlet-contect.xml에서 확인..
    }
    
    @RequestMapping("/test08Proc.do")
    public String test08Proc(
//    		@RequestParam(value="id", defaultValue="") String id,
//    		@RequestParam(value="passwd", defaultValue="") String passwd
    		String id, //@RequestParam 이 생략되어 있는 것이다.
    		String passwd, //@RequestParam 이 생략되어 있는 것이다.
    		Model model
    		) {
    	String dbId = "hong";
    	String dbPasswd = "1111";
    	
    	String result = "";
		if (id.equals(dbId) && passwd.equals(dbPasswd)) {
			result = "정상적으로 로그인되었습니다.";
		} else {
			result = "아이디 또는 비밀번호가 다릅니다.";
		}
		model.addAttribute("id", id);
		model.addAttribute("passwd", passwd);
		model.addAttribute("result", result);
		return "_test/test08/exam01Result";
    }
    
}
