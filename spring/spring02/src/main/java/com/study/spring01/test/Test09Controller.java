package com.study.spring01.test;

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

	@RequestMapping("/test09.do") //RequestMapping이라는 것은  url 매핑이다. http://localhost:8090/spring01/test01.do
    public String test09(Model model) {
        return "_test/test09/exam01"; //  /WEB-INF/views/test01/test01로 넘어감..  ,  servlet-contect.xml에서 확인..
    }
    
    @RequestMapping("/test09Proc.do")
//    @ResponseBody
    public @ResponseBody Map<String, String> test09Proc(
//    		@RequestParam(value="id", defaultValue="") String id,
//    		@RequestParam(value="passwd", defaultValue="") String passwd
    		String id, //@RequestParam 이 생략되어 있는 것이다.
    		String name, //@RequestParam 이 생략되어 있는 것이다.
    		String email //@RequestParam 이 생략되어 있는 것이다.
    		) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("id",  id);
		map.put("name",  name);
		map.put("email",  email);

		return map; //페이지로 넘어가는 것이 아니라 객체가 넘어간다. 그래서 @ResponseBody를 붙인다.
					//페이지로 넘어가는것이 아니다. 데이타 자체를 보내주는 것이다. url이 아니기 때문에 @ResponseBody를 붙여야 된다.
    }
    
    
/*
		***** pom.xml 추가 ***** <- 라이브러리를 추가해야한다.
<dependencies> <— 이 부분 아래에 다음 내용을 추가한다.

		<dependency>
			<groupId>com.fasterxml.jackson.core</groupId>
			<artifactId>jackson-annotations</artifactId>
			<version>2.10.1</version>
		</dependency>

		<dependency>
			<groupId>com.fasterxml.jackson.core</groupId>
			<artifactId>jackson-databind</artifactId>
			<version>2.10.1</version>
		</dependency>

		<dependency>
			<groupId>org.codehaus.jackson</groupId>
			<artifactId>jackson-mapper-asl</artifactId>
			<version>1.9.13</version>
		</dependency> 
*/
}
