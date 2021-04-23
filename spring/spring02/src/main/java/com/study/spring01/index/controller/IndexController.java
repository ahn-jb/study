package com.study.spring01.index.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller //어노테이션 붙이기
public class IndexController {

	@RequestMapping("/") //RequestMapping이라는 것은  url 매핑이다. http://localhost:8080/springTest
    public String index(Model model) {
        model.addAttribute("memo", "사이트 방문을 환영합니다."); //데이타를 전달할 때는 model이라는 그릇에 담아서 전달한다.
        model.addAttribute("name", "홍길동");
        return "index"; //index.jsp로 넘어감..  /WEB-INF/views/main.jsp라는 의미, servlet-contect.xml에서 확인..
    }
    
}
